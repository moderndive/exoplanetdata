# exoplanetdata: Exoplanet Datasets for Teaching Introductory Statistics

Tidied datasets of confirmed exoplanets and their host stars, retrieved
from NASA's Exoplanet Archive via the REXoplanets package.

## Datasets

- [`planets`](https://moderndive.github.io/exoplanetdata/reference/planets.md) -
  one row per confirmed exoplanet (`pscomppars` table)

- [`stars`](https://moderndive.github.io/exoplanetdata/reference/stars.md) -
  reference-level stellar host data (`stellarhosts` table)

## Data dictionary

Machine-readable column dictionaries are shipped in `inst/extdata`:


    system.file("extdata", "data_dictionary_planets.csv", package = "exoplanetdata")
    system.file("extdata", "data_dictionary_stars.csv",   package = "exoplanetdata")
    system.file("extdata", "data_dictionary.md",          package = "exoplanetdata")

## See also

Useful links:

- <https://github.com/moderndive/exoplanetdata>

- <https://moderndive.github.io/exoplanetdata/>

- Report bugs at <https://github.com/moderndive/exoplanetdata/issues>

## Author

**Maintainer**: Chester Ismay <chester.ismay@gmail.com>
