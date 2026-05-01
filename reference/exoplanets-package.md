# exoplanets: Exoplanet Datasets for Teaching Introductory Statistics

Tidied datasets of confirmed exoplanets and their host stars, retrieved
from NASA's Exoplanet Archive via the REXoplanets package.

## Datasets

- [`planets`](https://moderndive.github.io/exoplanets/reference/planets.md) -
  one row per confirmed exoplanet (`pscomppars` table)

- [`stars`](https://moderndive.github.io/exoplanets/reference/stars.md) -
  reference-level stellar host data (`stellarhosts` table)

## Data dictionary

Machine-readable column dictionaries are shipped in `inst/extdata`:


    system.file("extdata", "data_dictionary_planets.csv", package = "exoplanets")
    system.file("extdata", "data_dictionary_stars.csv",   package = "exoplanets")
    system.file("extdata", "data_dictionary.md",          package = "exoplanets")

## See also

Useful links:

- <https://github.com/moderndive/exoplanets>

- Report bugs at <https://github.com/moderndive/exoplanets/issues>

## Author

**Maintainer**: Chester Ismay <chester.ismay@gmail.com>
