# Confirmed Exoplanets

One row per confirmed exoplanet from NASA's Exoplanet Archive Planetary
Systems Composite Parameters (`pscomppars`) table. Each row carries the
archive's best composite parameter values, with the planet's host star
properties already merged in. Column names have been simplified for
classroom use; the original NASA short name for each column is listed in
the `archive_name` field of the data dictionary
(`system.file("extdata", "data_dictionary_planets.csv", package = "exoplanets")`).

## Usage

``` r
planets
```

## Format

A data frame with 6278 rows and 28 variables:

- planet_name:

  (character) Planet name most commonly used in the literature.

- host_name:

  (character) Stellar name most commonly used in the literature.

- n_stars:

  (numeric) Number of gravitationally bound stars in the planetary
  system.

- n_planets:

  (numeric) Number of confirmed planets in the planetary system.

- discovery_method:

  (factor) Method by which the planet was first identified (e.g.
  Transit, Radial Velocity).

- discovery_year:

  (integer) Year the planet was discovered.

- discovery_facility:

  (character) Name of the facility making the discovery observations.

- orbital_period_days:

  (numeric, days) Time the planet takes to complete one orbit around its
  host (system).

- semi_major_axis_au:

  (numeric, au) Longest radius of the elliptic orbit; for
  microlensing/imaging detections, the projected sky-plane separation.

- eccentricity:

  (numeric) Amount by which the orbit deviates from a perfect circle (0
  = circular).

- inclination_deg:

  (numeric, deg) Angle of the orbit plane relative to the plane
  perpendicular to Earth's line of sight.

- radius_earth:

  (numeric, Earth radii) Planet radius measured in units of Earth's
  radius.

- radius_jupiter:

  (numeric, Jupiter radii) Planet radius measured in units of Jupiter's
  radius.

- mass_earth:

  (numeric, Earth masses) Best mass estimate (Mass, M\*sin(i)/sin(i), or
  M\*sin(i)) in Earth masses.

- mass_jupiter:

  (numeric, Jupiter masses) Best mass estimate (Mass, M\*sin(i)/sin(i),
  or M\*sin(i)) in Jupiter masses.

- density_g_cm3:

  (numeric, g/cm^3) Planet mass per unit volume.

- eq_temp_k:

  (numeric, K) Equilibrium temperature assuming a black-body planet
  heated by its host star.

- insolation_earth:

  (numeric, Earth flux) Stellar flux at the planet relative to Earth's
  solar flux.

- star_spec_type:

  (character) Morgan-Keenan spectral classification of the host star.

- star_temp_k:

  (numeric, K) Black-body temperature emitting the same total
  electromagnetic radiation as the star.

- star_radius_solar:

  (numeric, Solar radii) Stellar radius in units of the Sun's radius.

- star_mass_solar:

  (numeric, Solar masses) Stellar mass in units of the Sun's mass.

- star_metallicity_dex:

  (numeric, dex) Metal content of the stellar photosphere relative to
  hydrogen.

- star_log_g:

  (numeric, log10(cm/s^2)) Gravitational acceleration at the stellar
  surface (log10).

- star_age_gyr:

  (numeric, Gyr) Age of the host star in billions of years.

- ra_deg:

  (numeric, deg) Right ascension of the planetary system in decimal
  degrees.

- dec_deg:

  (numeric, deg) Declination of the planetary system in decimal degrees.

- distance_pc:

  (numeric, pc) Distance to the planetary system in parsecs.

## Source

NASA Exoplanet Archive Planetary Systems columns documentation:
<https://exoplanetarchive.ipac.caltech.edu/docs/API_PS_columns.html>.
Retrieved via the REXoplanets package.
