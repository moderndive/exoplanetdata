## Friendly column names for the planets and stars tibbles.
##
## Naming conventions:
##   - snake_case
##   - units appended where ambiguous (e.g. orbital_period_days, mass_earth)
##   - "star_" prefix on planet table when a column describes the host star,
##     to disambiguate from the planet's own properties
##   - photometry: mag_<band>_<survey> (e.g. mag_b_johnson, mag_g_sloan,
##     mag_k_2mass, mag_w1_wise, mag_gaia, mag_tess, mag_kepler)
##   - uncertainty/limit suffixes inherited automatically from the base name:
##        <base>err1 -> <base>_upper_err
##        <base>err2 -> <base>_lower_err
##        <base>lim  -> <base>_limit_flag

planet_rename <- c(
  pl_name          = "planet_name",
  hostname         = "host_name",
  sy_snum          = "n_stars",
  sy_pnum          = "n_planets",
  discoverymethod  = "discovery_method",
  disc_year        = "discovery_year",
  disc_facility    = "discovery_facility",
  pl_orbper        = "orbital_period_days",
  pl_orbsmax       = "semi_major_axis_au",
  pl_orbeccen      = "eccentricity",
  pl_orbincl       = "inclination_deg",
  pl_rade          = "radius_earth",
  pl_radj          = "radius_jupiter",
  pl_bmasse        = "mass_earth",
  pl_bmassj        = "mass_jupiter",
  pl_dens          = "density_g_cm3",
  pl_eqt           = "eq_temp_k",
  pl_insol         = "insolation_earth",
  st_spectype      = "star_spec_type",
  st_teff          = "star_temp_k",
  st_rad           = "star_radius_solar",
  st_mass          = "star_mass_solar",
  st_met           = "star_metallicity_dex",
  st_logg          = "star_log_g",
  st_age           = "star_age_gyr",
  ra               = "ra_deg",
  dec              = "dec_deg",
  sy_dist          = "distance_pc"
)

stars_base_rename <- c(
  # identifiers
  sy_name      = "system_name",
  hostname     = "host_name",
  hd_name      = "hd_id",
  hip_name     = "hip_id",
  tic_id       = "tic_id",
  gaia_dr2_id  = "gaia_dr2_id",
  gaia_dr3_id  = "gaia_dr3_id",
  # system composition
  sy_snum      = "n_stars",
  sy_pnum      = "n_planets",
  sy_mnum      = "n_moons",
  cb_flag      = "circumbinary_flag",
  # references
  st_refname   = "star_param_ref",
  sy_refname   = "system_param_ref",
  # stellar properties
  st_spectype  = "spectral_type",
  st_teff      = "temperature_k",
  st_rad       = "radius_solar",
  st_mass      = "mass_solar",
  st_met       = "metallicity_dex",
  st_metratio  = "metallicity_ratio",
  st_lum       = "luminosity_log_solar",
  st_logg      = "log_g",
  st_age       = "age_gyr",
  st_dens      = "density_g_cm3",
  st_vsin      = "v_sin_i_km_s",
  st_rotp      = "rotation_period_days",
  st_radv      = "radial_velocity_km_s",
  # position
  rastr        = "ra_sexagesimal",
  decstr       = "dec_sexagesimal",
  ra           = "ra_deg",
  dec          = "dec_deg",
  glat         = "galactic_lat_deg",
  glon         = "galactic_lon_deg",
  elat         = "ecliptic_lat_deg",
  elon         = "ecliptic_lon_deg",
  sy_pm        = "proper_motion_total_mas_yr",
  sy_pmra      = "proper_motion_ra_mas_yr",
  sy_pmdec     = "proper_motion_dec_mas_yr",
  sy_dist      = "distance_pc",
  sy_plx       = "parallax_mas",
  # photometry
  sy_bmag      = "mag_b_johnson",
  sy_vmag      = "mag_v_johnson",
  sy_umag      = "mag_u_sloan",
  sy_gmag      = "mag_g_sloan",
  sy_rmag      = "mag_r_sloan",
  sy_imag      = "mag_i_sloan",
  sy_zmag      = "mag_z_sloan",
  sy_jmag      = "mag_j_2mass",
  sy_hmag      = "mag_h_2mass",
  sy_kmag      = "mag_k_2mass",
  sy_w1mag     = "mag_w1_wise",
  sy_w2mag     = "mag_w2_wise",
  sy_w3mag     = "mag_w3_wise",
  sy_w4mag     = "mag_w4_wise",
  sy_gaiamag   = "mag_gaia",
  sy_icmag     = "mag_i_cousins",
  sy_tmag      = "mag_tess",
  sy_kepmag    = "mag_kepler",
  # dates
  rowupdate    = "row_update_date",
  pl_pubdate   = "planet_publication_date",
  releasedate  = "release_date"
)

## Returns a named character vector: original_name -> new_name, covering all
## actual columns including err1/err2/lim variants of any base column in the
## rename map. Columns without a mapping are left unchanged.
build_rename_map <- function(actual_cols, base_rename) {
  out <- setNames(actual_cols, actual_cols)  # identity by default
  for (col in actual_cols) {
    suffix <- dplyr::case_when(
      grepl("err1$", col) ~ "err1",
      grepl("err2$", col) ~ "err2",
      grepl("lim$",  col) ~ "lim",
      TRUE                ~ NA_character_
    )
    base <- if (!is.na(suffix)) sub(paste0(suffix, "$"), "", col) else col
    if (!is.na(base_rename[base])) {
      new_base <- unname(base_rename[base])
      out[col] <- if (is.na(suffix)) {
        new_base
      } else {
        paste0(new_base, switch(suffix,
          err1 = "_upper_err",
          err2 = "_lower_err",
          lim  = "_limit_flag"))
      }
    }
  }
  out
}

## Applies a rename map (original -> new) to a data frame.
apply_rename <- function(df, rename_map) {
  stopifnot(all(names(rename_map) %in% names(df)))
  names(df) <- unname(rename_map[names(df)])
  df
}
