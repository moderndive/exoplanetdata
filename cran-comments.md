## Submission summary

This is a new submission of a data-only package (`exoplanetdata`) providing
tidied NASA Exoplanet Archive datasets for teaching introductory statistics.

## Test environments

* local macOS (R 4.5.3), `R CMD check --as-cran`
* win-builder (devel and release)
* GitHub Actions: macOS-latest, windows-latest, ubuntu-latest (release, devel, oldrel-1)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Notes for CRAN

* This is a new release.

* The name `exoplanetdata` was chosen deliberately to avoid conflicting with
  the unrelated, previously-archived `exoplanets` package (an rOpenSci API
  client by a different author). This package instead ships pre-tidied
  snapshot datasets and is not an API client.

* The package contains only data (no exported functions), so there are no
  runnable examples and no unit tests beyond `R CMD check`'s data validation.

* All `Suggests` packages are used only in the `data-raw/` build script (which
  is excluded from the build via `.Rbuildignore`) to regenerate the shipped
  `.rda` files; the package itself has no runtime dependencies beyond base R.
