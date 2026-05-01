## Installs the dependencies needed to rebuild this package's data.
## Run once: source("data-raw/00_setup.R")

cran_pkgs <- c("remotes", "dplyr", "readr", "tibble", "purrr",
               "roxygen2", "devtools", "usethis")
to_install <- cran_pkgs[!vapply(cran_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(to_install)) {
  install.packages(to_install, repos = "https://cloud.r-project.org")
}

if (!requireNamespace("REXoplanets", quietly = TRUE)) {
  remotes::install_github("JKolomanski/REXoplanets", upgrade = "never")
}

message("Setup complete. REXoplanets ", utils::packageVersion("REXoplanets"), " ready.")
