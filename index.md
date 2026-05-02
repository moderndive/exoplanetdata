# exoplanets

Tidied datasets of confirmed exoplanets and their host stars, retrieved
from NASA’s Exoplanet Archive via the
[`REXoplanets`](https://github.com/JKolomanski/REXoplanets) package.
Column names have been simplified for classroom use, with units baked
into names where ambiguous. Intended as a companion dataset of the
[`moderndive`](https://moderndive.com/v2/) textbook.

## Installation

You can install the development version from GitHub with:

``` r

# install.packages("pak")
pak::pak("moderndive/exoplanets")
```

## Datasets

``` r

library(exoplanets)

# One row per confirmed exoplanet (host-star parameters merged in)
planets

# Reference-level stellar parameters (many rows per host star)
stars
```

See
[`?planets`](https://moderndive.github.io/exoplanets/reference/planets.md)
and
[`?stars`](https://moderndive.github.io/exoplanets/reference/stars.md)
for full data dictionaries.
