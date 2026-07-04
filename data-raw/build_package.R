## End-to-end build script for the exoplanetdata data package.
##
## Run from the package root (working directory = package root):
##   Rscript data-raw/build_package.R
##
## What this does:
##   1. Fetches `pscomppars` and `stellarhosts` from NASA's Exoplanet Archive
##      via its TAP service.
##   2. Trims and renames columns to friendly snake_case names (see
##      data-raw/utils_rename.R).
##   3. Saves data/planets.rda and data/stars.rda for the package.
##   4. Builds a data dictionary (one row per column) for each tibble.
##   5. Writes R/data.R - roxygen documentation derived from the dictionary,
##      so `?planets` / `?stars` show full column descriptions.
##   6. Saves machine-readable dictionaries to inst/extdata/.
##   7. Runs roxygen2::roxygenise() to regenerate man/*.Rd and NAMESPACE.
##
## Note on data fetching:
##   REXoplanets::fetch_table() runs `select * from <table>` against NASA's
##   sync TAP endpoint, which silently truncates responses above ~5-10 MB
##   (you get ~1,200 rows back instead of tens of thousands). We instead
##   call TAP directly with explicit column projection, dropping only the
##   two long HTML reference-URL columns (st_refname, sy_refname) from
##   stellarhosts. REXoplanets is kept in Suggests for its other helpers.

suppressPackageStartupMessages({
  library(dplyr)
  library(tibble)
  library(readr)
  library(purrr)
  library(httr2)
})

TAP_SYNC <- "https://exoplanetarchive.ipac.caltech.edu/TAP/sync"

tap_query <- function(table, columns = NULL, where = NULL, timeout = 600) {
  cols_sql <- if (is.null(columns)) "*" else paste(columns, collapse = ",")
  query <- paste0("select ", cols_sql, " from ", table)
  if (!is.null(where)) query <- paste0(query, " where ", where)

  message(sprintf("TAP sync: %s (%s columns) ...",
                  table,
                  if (is.null(columns)) "all" else as.character(length(columns))))

  csv <- request(TAP_SYNC) |>
    req_url_query(query = query, format = "csv") |>
    req_options(timeout = timeout, followlocation = TRUE) |>
    req_perform() |>
    resp_body_string()

  df <- suppressWarnings(read_csv(csv, show_col_types = FALSE, progress = FALSE))
  message(sprintf("  -> %d rows x %d cols", nrow(df), ncol(df)))
  df
}

source("data-raw/utils_rename.R")

dir.create("data",          showWarnings = FALSE, recursive = TRUE)
dir.create("inst/extdata",  showWarnings = FALSE, recursive = TRUE)
dir.create("data-raw/cache", showWarnings = FALSE, recursive = TRUE)

## --- 1. Fetch --------------------------------------------------------------

planet_cols <- c(
  "pl_name", "hostname", "sy_snum", "sy_pnum",
  "discoverymethod", "disc_year", "disc_facility",
  "pl_orbper", "pl_orbsmax", "pl_orbeccen", "pl_orbincl",
  "pl_rade", "pl_radj", "pl_bmasse", "pl_bmassj", "pl_dens",
  "pl_eqt", "pl_insol",
  "st_spectype", "st_teff", "st_rad", "st_mass", "st_met",
  "st_logg", "st_age",
  "ra", "dec", "sy_dist"
)

planets_raw <- tap_query("pscomppars", columns = planet_cols)

# Discover stellarhosts columns dynamically (LIMIT 1 trick), then drop the two
# long HTML reference-URL fields before fetching the full table. Those two
# columns alone pushed the payload over the sync TAP truncation threshold.
stellarhosts_all_cols <- tap_query("stellarhosts", where = "rownum < 2") |> names()
stellarhosts_keep_cols <- setdiff(stellarhosts_all_cols, c("st_refname", "sy_refname"))
stars_raw <- tap_query("stellarhosts", columns = stellarhosts_keep_cols)

# Cache so doc-only re-runs can skip the network.
saveRDS(planets_raw, "data-raw/cache/pscomppars_raw.rds")
saveRDS(stars_raw,   "data-raw/cache/stellarhosts_raw.rds")

## --- 2. Tidy + rename ------------------------------------------------------

planets <- planets_raw |>
  as_tibble() |>
  mutate(
    across(where(is.character), \(x) dplyr::na_if(trimws(x), "")),
    discoverymethod = as.factor(discoverymethod),
    disc_year       = as.integer(disc_year)
  ) |>
  arrange(hostname, pl_name) |>
  apply_rename(planet_rename)

stars_archive_cols <- names(stars_raw)
stars_rename_map   <- build_rename_map(stars_archive_cols, stars_base_rename)
stars <- stars_raw |>
  as_tibble() |>
  arrange(hostname) |>
  apply_rename(stars_rename_map)

## --- 3. Save .rda for the package -----------------------------------------

save(planets, file = "data/planets.rda", compress = "xz")
save(stars,   file = "data/stars.rda",   compress = "xz")

message(sprintf(
  "Saved data/planets.rda (%d x %d) and data/stars.rda (%d x %d)",
  nrow(planets), ncol(planets), nrow(stars), ncol(stars)
))

## --- 4. Build data dictionaries -------------------------------------------

planet_base_dict <- tribble(
  ~archive_name,     ~label,                                   ~units,            ~description,
  "pl_name",         "Planet Name",                             NA,               "Planet name most commonly used in the literature.",
  "hostname",        "Host Name",                               NA,               "Stellar name most commonly used in the literature.",
  "sy_snum",         "Number of Stars",                         NA,               "Number of gravitationally bound stars in the planetary system.",
  "sy_pnum",         "Number of Planets",                       NA,               "Number of confirmed planets in the planetary system.",
  "discoverymethod", "Discovery Method",                        NA,               "Method by which the planet was first identified (e.g. Transit, Radial Velocity).",
  "disc_year",       "Discovery Year",                          NA,               "Year the planet was discovered.",
  "disc_facility",   "Discovery Facility",                      NA,               "Name of the facility making the discovery observations.",
  "pl_orbper",       "Orbital Period",                          "days",           "Time the planet takes to complete one orbit around its host (system).",
  "pl_orbsmax",      "Orbit Semi-Major Axis",                   "au",             "Longest radius of the elliptic orbit; for microlensing/imaging detections, the projected sky-plane separation.",
  "pl_orbeccen",     "Eccentricity",                            NA,               "Amount by which the orbit deviates from a perfect circle (0 = circular).",
  "pl_orbincl",      "Inclination",                             "deg",            "Angle of the orbit plane relative to the plane perpendicular to Earth's line of sight.",
  "pl_rade",         "Planet Radius",                           "Earth radii",    "Planet radius measured in units of Earth's radius.",
  "pl_radj",         "Planet Radius",                           "Jupiter radii",  "Planet radius measured in units of Jupiter's radius.",
  "pl_bmasse",       "Planet Mass or Mass*sin(i)",              "Earth masses",   "Best mass estimate (Mass, M*sin(i)/sin(i), or M*sin(i)) in Earth masses.",
  "pl_bmassj",       "Planet Mass or Mass*sin(i)",              "Jupiter masses", "Best mass estimate (Mass, M*sin(i)/sin(i), or M*sin(i)) in Jupiter masses.",
  "pl_dens",         "Planet Density",                          "g/cm^3",         "Planet mass per unit volume.",
  "pl_eqt",          "Equilibrium Temperature",                 "K",              "Equilibrium temperature assuming a black-body planet heated by its host star.",
  "pl_insol",        "Insolation Flux",                         "Earth flux",     "Stellar flux at the planet relative to Earth's solar flux.",
  "st_spectype",     "Spectral Type",                           NA,               "Morgan-Keenan spectral classification of the host star.",
  "st_teff",         "Stellar Effective Temperature",           "K",              "Black-body temperature emitting the same total electromagnetic radiation as the star.",
  "st_rad",          "Stellar Radius",                          "Solar radii",    "Stellar radius in units of the Sun's radius.",
  "st_mass",         "Stellar Mass",                            "Solar masses",   "Stellar mass in units of the Sun's mass.",
  "st_met",          "Stellar Metallicity",                     "dex",            "Metal content of the stellar photosphere relative to hydrogen.",
  "st_logg",         "Stellar Surface Gravity",                 "log10(cm/s^2)",  "Gravitational acceleration at the stellar surface (log10).",
  "st_age",          "Stellar Age",                             "Gyr",            "Age of the host star in billions of years.",
  "ra",              "Right Ascension",                         "deg",            "Right ascension of the planetary system in decimal degrees.",
  "dec",             "Declination",                             "deg",            "Declination of the planetary system in decimal degrees.",
  "sy_dist",         "Distance",                                "pc",             "Distance to the planetary system in parsecs."
)

star_base_dict <- tribble(
  ~archive_name,  ~label,                          ~units,             ~description,
  "sy_name",      "System Name",                    NA,                 "Name of the system the star belongs to.",
  "hostname",     "Host Name",                      NA,                 "Stellar name most commonly used in the literature.",
  "hd_name",      "HD ID",                          NA,                 "Henry Draper Catalog identifier.",
  "hip_name",     "HIP ID",                         NA,                 "Hipparcos Catalog identifier.",
  "tic_id",       "TIC ID",                         NA,                 "TESS Input Catalog identifier.",
  "gaia_dr2_id",  "Gaia DR2 ID",                    NA,                 "Gaia Data Release 2 identifier.",
  "gaia_dr3_id",  "Gaia DR3 ID",                    NA,                 "Gaia Data Release 3 identifier.",
  "sy_snum",      "Number of Stars",                NA,                 "Number of gravitationally bound stars in the planetary system.",
  "sy_pnum",      "Number of Planets",              NA,                 "Number of confirmed planets in the planetary system.",
  "sy_mnum",      "Number of Moons",                NA,                 "Number of confirmed moons in the planetary system.",
  "cb_flag",      "Circumbinary Flag",              NA,                 "1 if planet orbits a binary system, 0 otherwise.",
  "st_refname",   "Stellar Parameter Reference",    NA,                 "Bibliographic reference for this stellar parameter set.",
  "sy_refname",   "System Parameter Reference",     NA,                 "Bibliographic reference for this system parameter set.",
  "st_spectype",  "Spectral Type",                  NA,                 "Morgan-Keenan spectral classification of the star.",
  "st_teff",      "Stellar Effective Temperature",  "K",                "Black-body temperature emitting the same total electromagnetic radiation as the star.",
  "st_rad",       "Stellar Radius",                 "Solar radii",      "Stellar radius in units of the Sun's radius.",
  "st_mass",      "Stellar Mass",                   "Solar masses",     "Stellar mass in units of the Sun's mass.",
  "st_met",       "Stellar Metallicity",            "dex",              "Metal content of the stellar photosphere relative to hydrogen.",
  "st_metratio",  "Stellar Metallicity Ratio",      NA,                 "Ratio used to express metallicity (e.g. [Fe/H], [M/H]).",
  "st_lum",       "Stellar Luminosity",             "log10(L_sun)",     "Energy emitted per unit time, in solar luminosities (log10).",
  "st_logg",      "Stellar Surface Gravity",        "log10(cm/s^2)",    "Gravitational acceleration at the stellar surface (log10).",
  "st_age",       "Stellar Age",                    "Gyr",              "Age of the host star in billions of years.",
  "st_dens",      "Stellar Density",                "g/cm^3",           "Stellar mass per unit volume.",
  "st_vsin",      "Stellar Rotational Velocity",    "km/s",             "Equatorial rotational velocity multiplied by sin(inclination).",
  "st_rotp",      "Stellar Rotational Period",      "days",             "Time required for one full rotation (assuming solid-body rotation).",
  "st_radv",      "Systemic Radial Velocity",       "km/s",             "Star's velocity along the line of sight from Earth.",
  "rastr",        "RA (sexagesimal)",               NA,                 "Right ascension in sexagesimal hh:mm:ss notation.",
  "decstr",       "Dec (sexagesimal)",              NA,                 "Declination in sexagesimal dd:mm:ss notation.",
  "ra",           "Right Ascension",                "deg",              "Right ascension of the planetary system in decimal degrees.",
  "dec",          "Declination",                    "deg",              "Declination of the planetary system in decimal degrees.",
  "glat",         "Galactic Latitude",              "deg",              "Galactic latitude of the planetary system.",
  "glon",         "Galactic Longitude",             "deg",              "Galactic longitude of the planetary system.",
  "elat",         "Ecliptic Latitude",              "deg",              "Ecliptic latitude of the planetary system.",
  "elon",         "Ecliptic Longitude",             "deg",              "Ecliptic longitude of the planetary system.",
  "sy_pm",        "Total Proper Motion",            "mas/yr",           "Total angular change in position over time relative to Solar System barycenter.",
  "sy_pmra",      "Proper Motion (RA)",             "mas/yr",           "Proper motion in right ascension.",
  "sy_pmdec",     "Proper Motion (Dec)",            "mas/yr",           "Proper motion in declination.",
  "sy_dist",      "Distance",                       "pc",               "Distance to the planetary system in parsecs.",
  "sy_plx",       "Parallax",                       "mas",              "Annual parallax of the system.",
  "sy_bmag",      "B (Johnson) Magnitude",          "mag",              "Apparent brightness in the B (Johnson) photometric band.",
  "sy_vmag",      "V (Johnson) Magnitude",          "mag",              "Apparent brightness in the V (Johnson) photometric band.",
  "sy_umag",      "u (Sloan) Magnitude",            "mag",              "Apparent brightness in the SDSS u band.",
  "sy_gmag",      "g (Sloan) Magnitude",            "mag",              "Apparent brightness in the SDSS g band.",
  "sy_rmag",      "r (Sloan) Magnitude",            "mag",              "Apparent brightness in the SDSS r band.",
  "sy_imag",      "i (Sloan) Magnitude",            "mag",              "Apparent brightness in the SDSS i band.",
  "sy_zmag",      "z (Sloan) Magnitude",            "mag",              "Apparent brightness in the SDSS z band.",
  "sy_jmag",      "J (2MASS) Magnitude",            "mag",              "Apparent brightness in the 2MASS J band.",
  "sy_hmag",      "H (2MASS) Magnitude",            "mag",              "Apparent brightness in the 2MASS H band.",
  "sy_kmag",      "Ks (2MASS) Magnitude",           "mag",              "Apparent brightness in the 2MASS Ks band.",
  "sy_w1mag",     "W1 (WISE) Magnitude",            "mag",              "Apparent brightness in the WISE 3.4 micron band.",
  "sy_w2mag",     "W2 (WISE) Magnitude",            "mag",              "Apparent brightness in the WISE 4.6 micron band.",
  "sy_w3mag",     "W3 (WISE) Magnitude",            "mag",              "Apparent brightness in the WISE 12 micron band.",
  "sy_w4mag",     "W4 (WISE) Magnitude",            "mag",              "Apparent brightness in the WISE 22 micron band.",
  "sy_gaiamag",   "Gaia Magnitude",                 "mag",              "Apparent brightness in the Gaia G band.",
  "sy_icmag",     "I (Cousins) Magnitude",          "mag",              "Apparent brightness in the I (Cousins) band.",
  "sy_tmag",      "TESS Magnitude",                 "mag",              "Apparent brightness in the TESS bandpass.",
  "sy_kepmag",    "Kepler Magnitude",               "mag",              "Apparent brightness in the Kepler bandpass.",
  "rowupdate",    "Row Update Date",                NA,                 "Date this row was last updated in the archive.",
  "pl_pubdate",   "Planetary Parameter Reference Publication Date", NA, "Publication date of the reference for the planetary parameter set.",
  "releasedate",  "Release Date",                   NA,                 "Date the row was released to the archive."
)

expand_archive_dict <- function(actual_archive_cols, base_dict) {
  rows <- map(actual_archive_cols, function(col) {
    suffix <- dplyr::case_when(
      grepl("err1$", col) ~ "err1",
      grepl("err2$", col) ~ "err2",
      grepl("lim$",  col) ~ "lim",
      TRUE                ~ NA_character_
    )
    base <- if (!is.na(suffix)) sub(paste0(suffix, "$"), "", col) else col
    base_row <- base_dict[base_dict$archive_name == base, ]
    label <- if (nrow(base_row) > 0) base_row$label       else NA_character_
    units <- if (nrow(base_row) > 0) base_row$units       else NA_character_
    desc  <- if (nrow(base_row) > 0) base_row$description else NA_character_

    if (is.na(suffix)) {
      tibble(archive_name = col, label = label, units = units, description = desc)
    } else if (suffix == "err1") {
      tibble(archive_name = col,
             label = paste(label, "(+ uncertainty)"),
             units = units,
             description = sprintf("Upper (positive) 1-sigma uncertainty on %s.", base))
    } else if (suffix == "err2") {
      tibble(archive_name = col,
             label = paste(label, "(- uncertainty)"),
             units = units,
             description = sprintf("Lower (negative) 1-sigma uncertainty on %s.", base))
    } else {
      tibble(archive_name = col,
             label = paste(label, "(limit flag)"),
             units = NA_character_,
             description = sprintf("Limit flag for %s: 1 = upper limit, -1 = lower limit, 0 = a measured value.", base))
    }
  })
  bind_rows(rows)
}

build_dictionary <- function(df, df_archive_cols, base_dict, rename_map) {
  dict <- expand_archive_dict(df_archive_cols, base_dict) |>
    mutate(column_name = unname(rename_map[archive_name])) |>
    relocate(column_name, .before = archive_name)

  meta <- tibble(
    column_name = names(df),
    r_type      = vapply(df, function(x) class(x)[1], character(1)),
    n_missing   = vapply(df, function(x) sum(is.na(x)), integer(1)),
    example     = vapply(df, function(x) {
      v <- x[!is.na(x)]
      if (length(v) == 0) return(NA_character_)
      as.character(v[[1]])
    }, character(1))
  )

  dict |>
    left_join(meta, by = "column_name") |>
    select(column_name, label, units, r_type, n_missing, example, description, archive_name)
}

planet_dict <- build_dictionary(
  df              = planets,
  df_archive_cols = planet_base_dict$archive_name,
  base_dict       = planet_base_dict,
  rename_map      = planet_rename
)

star_dict <- build_dictionary(
  df              = stars,
  df_archive_cols = stars_archive_cols,
  base_dict       = star_base_dict,
  rename_map      = stars_rename_map
)

stopifnot(
  setequal(names(planets), planet_dict$column_name),
  setequal(names(stars),   star_dict$column_name),
  !any(is.na(planet_dict$description)),
  !any(is.na(star_dict$description))
)

## --- 5. Generate R/data.R from the dictionaries ---------------------------

escape_rd <- function(x) {
  if (is.na(x)) return("")
  x <- gsub("\\\\", "\\\\\\\\", x)
  x <- gsub("%", "\\\\%", x)
  x <- gsub("\\{", "\\\\{", x)
  x <- gsub("\\}", "\\\\}", x)
  x
}

dict_to_describe <- function(dict) {
  items <- vapply(seq_len(nrow(dict)), function(i) {
    row <- dict[i, ]
    type <- row$r_type
    units <- row$units
    head <- if (!is.na(units)) sprintf("(%s, %s)", type, units) else sprintf("(%s)", type)
    sprintf("#'   \\item{%s}{%s %s}",
            row$column_name, head, escape_rd(row$description))
  }, character(1))
  paste(items, collapse = "\n")
}

planet_doc <- sprintf(
'#\' Confirmed Exoplanets
#\'
#\' One row per confirmed exoplanet from NASA\'s Exoplanet Archive Planetary
#\' Systems Composite Parameters (\\code{pscomppars}) table. Each row carries
#\' the archive\'s best composite parameter values, with the planet\'s host
#\' star properties already merged in. Column names have been simplified for
#\' classroom use; the original NASA short name for each column is listed in
#\' the \\code{archive_name} field of the data dictionary
#\' (\\code{system.file("extdata", "data_dictionary_planets.csv", package = "exoplanetdata")}).
#\'
#\' @format A data frame with %d rows and %d variables:
#\' \\describe{
%s
#\' }
#\' @source NASA Exoplanet Archive Planetary Systems columns documentation:
#\'   \\url{https://exoplanetarchive.ipac.caltech.edu/docs/API_PS_columns.html}.
#\'   Retrieved via the \\pkg{REXoplanets} package.
"planets"',
  nrow(planets), ncol(planets), dict_to_describe(planet_dict))

star_doc <- sprintf(
'#\' Stellar Hosts (Reference-Level)
#\'
#\' Reference-level stellar parameter data from NASA\'s Exoplanet Archive
#\' \\code{stellarhosts} table. Unlike \\code{\\link{planets}}, this table
#\' contains MANY rows per host star (one per published parameter solution),
#\' so it is the right table for studying the spread of published values for a
#\' single star but NOT for one-row-per-star analyses. For most introductory
#\' analyses, the host star\'s "best" parameters are already merged into
#\' \\code{planets} - reach for \\code{stars} only when you need uncertainties,
#\' alternative solutions, or full photometry.
#\'
#\' Many columns follow a base + suffix convention:
#\' \\itemize{
#\'   \\item \\code{<col>_upper_err}: upper (+) 1-sigma uncertainty on \\code{<col>}
#\'   \\item \\code{<col>_lower_err}: lower (-) 1-sigma uncertainty on \\code{<col>}
#\'   \\item \\code{<col>_limit_flag}: limit flag (1 = upper limit, -1 = lower limit, 0 = measured)
#\' }
#\'
#\' @format A data frame with %d rows and %d variables:
#\' \\describe{
%s
#\' }
#\' @source NASA Exoplanet Archive Stellar Hosts columns documentation:
#\'   \\url{https://exoplanetarchive.ipac.caltech.edu/docs/API_STELLARHOSTS_columns.html}.
#\'   Retrieved via the \\pkg{REXoplanets} package.
"stars"',
  nrow(stars), ncol(stars), dict_to_describe(star_dict))

writeLines(
  c("## Auto-generated by data-raw/build_package.R - do not edit by hand.",
    "",
    planet_doc,
    "",
    star_doc, ""),
  "R/data.R"
)
message("Wrote R/data.R")

## --- 6. Save dictionary CSV/MD to inst/extdata for users to read ----------

write_csv(planet_dict, "inst/extdata/data_dictionary_planets.csv")
write_csv(star_dict,   "inst/extdata/data_dictionary_stars.csv")

render_md_table <- function(d) {
  hdr  <- paste(names(d), collapse = " | ")
  sep  <- paste(rep("---", ncol(d)), collapse = " | ")
  body <- apply(d, 1, function(row) {
    cells <- ifelse(is.na(row), "", gsub("\\|", "\\\\|", row))
    paste(cells, collapse = " | ")
  })
  paste(c(paste("|", hdr, "|"), paste("|", sep, "|"), paste("|", body, "|")), collapse = "\n")
}

md <- c(
  "# Exoplanet Data Dictionary",
  "",
  sprintf("Generated %s from REXoplanets %s and the NASA Exoplanet Archive column docs.",
          format(Sys.Date()), utils::packageVersion("REXoplanets")),
  "",
  "Sources:",
  "- https://exoplanetarchive.ipac.caltech.edu/docs/API_PS_columns.html",
  "- https://exoplanetarchive.ipac.caltech.edu/docs/API_STELLARHOSTS_columns.html",
  "- `REXoplanets::exoplanets_col_labels`",
  "",
  "## planets",
  sprintf("Rows: %d - Columns: %d", nrow(planets), ncol(planets)),
  "",
  render_md_table(planet_dict),
  "",
  "## stars",
  sprintf("Rows: %d - Columns: %d", nrow(stars), ncol(stars)),
  "",
  render_md_table(star_dict)
)
writeLines(md, "inst/extdata/data_dictionary.md")

message("Wrote inst/extdata/data_dictionary_*.csv and data_dictionary.md")

## --- 7. Run roxygen2 to regenerate man/*.Rd and NAMESPACE -----------------

if (requireNamespace("roxygen2", quietly = TRUE)) {
  message("Running roxygen2::roxygenise() ...")
  roxygen2::roxygenise(load_code = roxygen2::load_source)
  message("Done. Man pages regenerated under man/.")
} else {
  message("roxygen2 not installed; skip roxygenise. Run devtools::document() manually.")
}
