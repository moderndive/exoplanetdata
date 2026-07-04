# Stellar Hosts (Reference-Level)

Reference-level stellar parameter data from NASA's Exoplanet Archive
`stellarhosts` table. Unlike
[`planets`](https://moderndive.github.io/exoplanetdata/reference/planets.md),
this table contains MANY rows per host star (one per published parameter
solution), so it is the right table for studying the spread of published
values for a single star but NOT for one-row-per-star analyses. For most
introductory analyses, the host star's "best" parameters are already
merged into `planets` - reach for `stars` only when you need
uncertainties, alternative solutions, or full photometry.

## Usage

``` r
stars
```

## Format

A data frame with 47558 rows and 134 variables:

- host_name:

  (character) Stellar name most commonly used in the literature.

- hd_id:

  (character) Henry Draper Catalog identifier.

- hip_id:

  (character) Hipparcos Catalog identifier.

- tic_id:

  (character) TESS Input Catalog identifier.

- ra_deg:

  (numeric, deg) Right ascension of the planetary system in decimal
  degrees.

- ra_sexagesimal:

  (character) Right ascension in sexagesimal hh:mm:ss notation.

- dec_deg:

  (numeric, deg) Declination of the planetary system in decimal degrees.

- dec_sexagesimal:

  (character) Declination in sexagesimal dd:mm:ss notation.

- galactic_lon_deg:

  (numeric, deg) Galactic longitude of the planetary system.

- galactic_lat_deg:

  (numeric, deg) Galactic latitude of the planetary system.

- ecliptic_lon_deg:

  (numeric, deg) Ecliptic longitude of the planetary system.

- ecliptic_lat_deg:

  (numeric, deg) Ecliptic latitude of the planetary system.

- mag_i_cousins:

  (logical, mag) Apparent brightness in the I (Cousins) band.

- mag_i_cousins_upper_err:

  (logical, mag) Upper (positive) 1-sigma uncertainty on sy_icmag.

- mag_i_cousins_lower_err:

  (logical, mag) Lower (negative) 1-sigma uncertainty on sy_icmag.

- temperature_k:

  (numeric, K) Black-body temperature emitting the same total
  electromagnetic radiation as the star.

- temperature_k_upper_err:

  (numeric, K) Upper (positive) 1-sigma uncertainty on st_teff.

- temperature_k_lower_err:

  (numeric, K) Lower (negative) 1-sigma uncertainty on st_teff.

- temperature_k_limit_flag:

  (numeric) Limit flag for st_teff: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- metallicity_dex:

  (numeric, dex) Metal content of the stellar photosphere relative to
  hydrogen.

- metallicity_dex_upper_err:

  (numeric, dex) Upper (positive) 1-sigma uncertainty on st_met.

- metallicity_dex_lower_err:

  (numeric, dex) Lower (negative) 1-sigma uncertainty on st_met.

- metallicity_dex_limit_flag:

  (numeric) Limit flag for st_met: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- radial_velocity_km_s:

  (numeric, km/s) Star's velocity along the line of sight from Earth.

- radial_velocity_km_s_upper_err:

  (numeric, km/s) Upper (positive) 1-sigma uncertainty on st_radv.

- radial_velocity_km_s_lower_err:

  (numeric, km/s) Lower (negative) 1-sigma uncertainty on st_radv.

- radial_velocity_km_s_limit_flag:

  (numeric) Limit flag for st_radv: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- v_sin_i_km_s:

  (numeric, km/s) Equatorial rotational velocity multiplied by
  sin(inclination).

- v_sin_i_km_s_upper_err:

  (numeric, km/s) Upper (positive) 1-sigma uncertainty on st_vsin.

- v_sin_i_km_s_lower_err:

  (numeric, km/s) Lower (negative) 1-sigma uncertainty on st_vsin.

- v_sin_i_km_s_limit_flag:

  (numeric) Limit flag for st_vsin: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- luminosity_log_solar:

  (numeric, log10(L_sun)) Energy emitted per unit time, in solar
  luminosities (log10).

- luminosity_log_solar_upper_err:

  (numeric, log10(L_sun)) Upper (positive) 1-sigma uncertainty on
  st_lum.

- luminosity_log_solar_lower_err:

  (numeric, log10(L_sun)) Lower (negative) 1-sigma uncertainty on
  st_lum.

- luminosity_log_solar_limit_flag:

  (numeric) Limit flag for st_lum: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- log_g:

  (numeric, log10(cm/s^2)) Gravitational acceleration at the stellar
  surface (log10).

- log_g_upper_err:

  (numeric, log10(cm/s^2)) Upper (positive) 1-sigma uncertainty on
  st_logg.

- log_g_lower_err:

  (numeric, log10(cm/s^2)) Lower (negative) 1-sigma uncertainty on
  st_logg.

- log_g_limit_flag:

  (numeric) Limit flag for st_logg: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- age_gyr:

  (numeric, Gyr) Age of the host star in billions of years.

- age_gyr_upper_err:

  (numeric, Gyr) Upper (positive) 1-sigma uncertainty on st_age.

- age_gyr_lower_err:

  (numeric, Gyr) Lower (negative) 1-sigma uncertainty on st_age.

- age_gyr_limit_flag:

  (numeric) Limit flag for st_age: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- mass_solar:

  (numeric, Solar masses) Stellar mass in units of the Sun's mass.

- mass_solar_upper_err:

  (numeric, Solar masses) Upper (positive) 1-sigma uncertainty on
  st_mass.

- mass_solar_lower_err:

  (numeric, Solar masses) Lower (negative) 1-sigma uncertainty on
  st_mass.

- mass_solar_limit_flag:

  (numeric) Limit flag for st_mass: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- density_g_cm3:

  (numeric, g/cm^3) Stellar mass per unit volume.

- density_g_cm3_upper_err:

  (numeric, g/cm^3) Upper (positive) 1-sigma uncertainty on st_dens.

- density_g_cm3_lower_err:

  (numeric, g/cm^3) Lower (negative) 1-sigma uncertainty on st_dens.

- density_g_cm3_limit_flag:

  (numeric) Limit flag for st_dens: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- radius_solar:

  (numeric, Solar radii) Stellar radius in units of the Sun's radius.

- radius_solar_upper_err:

  (numeric, Solar radii) Upper (positive) 1-sigma uncertainty on st_rad.

- radius_solar_lower_err:

  (numeric, Solar radii) Lower (negative) 1-sigma uncertainty on st_rad.

- radius_solar_limit_flag:

  (numeric) Limit flag for st_rad: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- n_stars:

  (numeric) Number of gravitationally bound stars in the planetary
  system.

- n_planets:

  (numeric) Number of confirmed planets in the planetary system.

- n_moons:

  (numeric) Number of confirmed moons in the planetary system.

- proper_motion_total_mas_yr:

  (numeric, mas/yr) Total angular change in position over time relative
  to Solar System barycenter.

- proper_motion_total_mas_yr_upper_err:

  (numeric, mas/yr) Upper (positive) 1-sigma uncertainty on sy_pm.

- proper_motion_total_mas_yr_lower_err:

  (numeric, mas/yr) Lower (negative) 1-sigma uncertainty on sy_pm.

- proper_motion_ra_mas_yr:

  (numeric, mas/yr) Proper motion in right ascension.

- proper_motion_ra_mas_yr_upper_err:

  (numeric, mas/yr) Upper (positive) 1-sigma uncertainty on sy_pmra.

- proper_motion_ra_mas_yr_lower_err:

  (numeric, mas/yr) Lower (negative) 1-sigma uncertainty on sy_pmra.

- proper_motion_dec_mas_yr:

  (numeric, mas/yr) Proper motion in declination.

- proper_motion_dec_mas_yr_upper_err:

  (numeric, mas/yr) Upper (positive) 1-sigma uncertainty on sy_pmdec.

- proper_motion_dec_mas_yr_lower_err:

  (numeric, mas/yr) Lower (negative) 1-sigma uncertainty on sy_pmdec.

- parallax_mas:

  (numeric, mas) Annual parallax of the system.

- parallax_mas_upper_err:

  (numeric, mas) Upper (positive) 1-sigma uncertainty on sy_plx.

- parallax_mas_lower_err:

  (numeric, mas) Lower (negative) 1-sigma uncertainty on sy_plx.

- distance_pc:

  (numeric, pc) Distance to the planetary system in parsecs.

- distance_pc_upper_err:

  (numeric, pc) Upper (positive) 1-sigma uncertainty on sy_dist.

- distance_pc_lower_err:

  (numeric, pc) Lower (negative) 1-sigma uncertainty on sy_dist.

- mag_b_johnson:

  (numeric, mag) Apparent brightness in the B (Johnson) photometric
  band.

- mag_b_johnson_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_bmag.

- mag_b_johnson_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_bmag.

- mag_v_johnson:

  (numeric, mag) Apparent brightness in the V (Johnson) photometric
  band.

- mag_v_johnson_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_vmag.

- mag_v_johnson_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_vmag.

- mag_j_2mass:

  (numeric, mag) Apparent brightness in the 2MASS J band.

- mag_j_2mass_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_jmag.

- mag_j_2mass_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_jmag.

- mag_h_2mass:

  (numeric, mag) Apparent brightness in the 2MASS H band.

- mag_h_2mass_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_hmag.

- mag_h_2mass_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_hmag.

- mag_k_2mass:

  (numeric, mag) Apparent brightness in the 2MASS Ks band.

- mag_k_2mass_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_kmag.

- mag_k_2mass_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_kmag.

- mag_u_sloan:

  (numeric, mag) Apparent brightness in the SDSS u band.

- mag_u_sloan_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_umag.

- mag_u_sloan_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_umag.

- mag_r_sloan:

  (numeric, mag) Apparent brightness in the SDSS r band.

- mag_r_sloan_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_rmag.

- mag_r_sloan_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_rmag.

- mag_i_sloan:

  (numeric, mag) Apparent brightness in the SDSS i band.

- mag_i_sloan_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_imag.

- mag_i_sloan_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_imag.

- mag_z_sloan:

  (numeric, mag) Apparent brightness in the SDSS z band.

- mag_z_sloan_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_zmag.

- mag_z_sloan_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_zmag.

- mag_w1_wise:

  (numeric, mag) Apparent brightness in the WISE 3.4 micron band.

- mag_w1_wise_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_w1mag.

- mag_w1_wise_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_w1mag.

- mag_w2_wise:

  (numeric, mag) Apparent brightness in the WISE 4.6 micron band.

- mag_w2_wise_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_w2mag.

- mag_w2_wise_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_w2mag.

- mag_w3_wise:

  (numeric, mag) Apparent brightness in the WISE 12 micron band.

- mag_w3_wise_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_w3mag.

- mag_w3_wise_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_w3mag.

- mag_w4_wise:

  (numeric, mag) Apparent brightness in the WISE 22 micron band.

- mag_w4_wise_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_w4mag.

- mag_w4_wise_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_w4mag.

- mag_g_sloan:

  (numeric, mag) Apparent brightness in the SDSS g band.

- mag_g_sloan_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_gmag.

- mag_g_sloan_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_gmag.

- mag_gaia:

  (numeric, mag) Apparent brightness in the Gaia G band.

- mag_gaia_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_gaiamag.

- mag_gaia_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_gaiamag.

- mag_tess:

  (numeric, mag) Apparent brightness in the TESS bandpass.

- mag_tess_upper_err:

  (numeric, mag) Upper (positive) 1-sigma uncertainty on sy_tmag.

- mag_tess_lower_err:

  (numeric, mag) Lower (negative) 1-sigma uncertainty on sy_tmag.

- system_name:

  (character) Name of the system the star belongs to.

- metallicity_ratio:

  (character) Ratio used to express metallicity (e.g. \[Fe/H\],
  \[M/H\]).

- spectral_type:

  (character) Morgan-Keenan spectral classification of the star.

- mag_kepler:

  (numeric, mag) Apparent brightness in the Kepler bandpass.

- mag_kepler_upper_err:

  (logical, mag) Upper (positive) 1-sigma uncertainty on sy_kepmag.

- mag_kepler_lower_err:

  (logical, mag) Lower (negative) 1-sigma uncertainty on sy_kepmag.

- rotation_period_days:

  (numeric, days) Time required for one full rotation (assuming
  solid-body rotation).

- rotation_period_days_upper_err:

  (numeric, days) Upper (positive) 1-sigma uncertainty on st_rotp.

- rotation_period_days_lower_err:

  (numeric, days) Lower (negative) 1-sigma uncertainty on st_rotp.

- rotation_period_days_limit_flag:

  (numeric) Limit flag for st_rotp: 1 = upper limit, -1 = lower limit, 0
  = a measured value.

- gaia_dr2_id:

  (character) Gaia Data Release 2 identifier.

- gaia_dr3_id:

  (character) Gaia Data Release 3 identifier.

- circumbinary_flag:

  (numeric) 1 if planet orbits a binary system, 0 otherwise.

## Source

NASA Exoplanet Archive Stellar Hosts columns documentation:
<https://exoplanetarchive.ipac.caltech.edu/docs/API_STELLARHOSTS_columns.html>.
Retrieved via the REXoplanets package.

## Details

Many columns follow a base + suffix convention:

- `<col>_upper_err`: upper (+) 1-sigma uncertainty on `<col>`

- `<col>_lower_err`: lower (-) 1-sigma uncertainty on `<col>`

- `<col>_limit_flag`: limit flag (1 = upper limit, -1 = lower limit, 0 =
  measured)
