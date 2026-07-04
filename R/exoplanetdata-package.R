#' exoplanetdata: Exoplanet Datasets for Teaching Introductory Statistics
#'
#' Tidied datasets of confirmed exoplanets and their host stars, retrieved
#' from NASA's Exoplanet Archive via the \pkg{REXoplanets} package.
#'
#' @section Datasets:
#' \itemize{
#'   \item \code{\link{planets}} - one row per confirmed exoplanet
#'         (\code{pscomppars} table)
#'   \item \code{\link{stars}} - reference-level stellar host data
#'         (\code{stellarhosts} table)
#' }
#'
#' @section Data dictionary:
#' Machine-readable column dictionaries are shipped in \code{inst/extdata}:
#' \preformatted{
#' system.file("extdata", "data_dictionary_planets.csv", package = "exoplanetdata")
#' system.file("extdata", "data_dictionary_stars.csv",   package = "exoplanetdata")
#' system.file("extdata", "data_dictionary.md",          package = "exoplanetdata")
#' }
#'
#' @keywords internal
"_PACKAGE"
