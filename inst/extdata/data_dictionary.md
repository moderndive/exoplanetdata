# Exoplanet Data Dictionary

Generated 2026-04-30 from REXoplanets 0.1.2 and the NASA Exoplanet Archive column docs.

Sources:
- https://exoplanetarchive.ipac.caltech.edu/docs/API_PS_columns.html
- https://exoplanetarchive.ipac.caltech.edu/docs/API_STELLARHOSTS_columns.html
- `REXoplanets::exoplanets_col_labels`

## planets
Rows: 6278 - Columns: 28

| column_name | label | units | r_type | n_missing | example | description | archive_name |
| --- | --- | --- | --- | --- | --- | --- | --- |
| planet_name | Planet Name |  | character |    0 | 11 Com b | Planet name most commonly used in the literature. | pl_name |
| host_name | Host Name |  | character |    0 | 11 Com | Stellar name most commonly used in the literature. | hostname |
| n_stars | Number of Stars |  | numeric |    0 | 2 | Number of gravitationally bound stars in the planetary system. | sy_snum |
| n_planets | Number of Planets |  | numeric |    0 | 1 | Number of confirmed planets in the planetary system. | sy_pnum |
| discovery_method | Discovery Method |  | factor |    0 | Radial Velocity | Method by which the planet was first identified (e.g. Transit, Radial Velocity). | discoverymethod |
| discovery_year | Discovery Year |  | integer |    1 | 2007 | Year the planet was discovered. | disc_year |
| discovery_facility | Discovery Facility |  | character |    0 | Xinglong Station | Name of the facility making the discovery observations. | disc_facility |
| orbital_period_days | Orbital Period | days | numeric |  340 | 323.21 | Time the planet takes to complete one orbit around its host (system). | pl_orbper |
| semi_major_axis_au | Orbit Semi-Major Axis | au | numeric |  428 | 1.178 | Longest radius of the elliptic orbit; for microlensing/imaging detections, the projected sky-plane separation. | pl_orbsmax |
| eccentricity | Eccentricity |  | numeric | 1051 | 0.238 | Amount by which the orbit deviates from a perfect circle (0 = circular). | pl_orbeccen |
| inclination_deg | Inclination | deg | numeric | 1512 | 146.7 | Angle of the orbit plane relative to the plane perpendicular to Earth's line of sight. | pl_orbincl |
| radius_earth | Planet Radius | Earth radii | numeric |   50 | 12.2 | Planet radius measured in units of Earth's radius. | pl_rade |
| radius_jupiter | Planet Radius | Jupiter radii | numeric |   50 | 1.09 | Planet radius measured in units of Jupiter's radius. | pl_radj |
| mass_earth | Planet Mass or Mass*sin(i) | Earth masses | numeric |   31 | 4914.89848585 | Best mass estimate (Mass, M*sin(i)/sin(i), or M*sin(i)) in Earth masses. | pl_bmasse |
| mass_jupiter | Planet Mass or Mass*sin(i) | Jupiter masses | numeric |   31 | 15.464 | Best mass estimate (Mass, M*sin(i)/sin(i), or M*sin(i)) in Jupiter masses. | pl_bmassj |
| density_g_cm3 | Planet Density | g/cm^3 | numeric |  140 | 14.9 | Planet mass per unit volume. | pl_dens |
| eq_temp_k | Equilibrium Temperature | K | numeric | 1601 | 1700 | Equilibrium temperature assuming a black-body planet heated by its host star. | pl_eqt |
| insolation_earth | Insolation Flux | Earth flux | numeric | 1878 | 2657.8322 | Stellar flux at the planet relative to Earth's solar flux. | pl_insol |
| star_spec_type | Spectral Type |  | character | 3964 | G8 III | Morgan-Keenan spectral classification of the host star. | st_spectype |
| star_temp_k | Stellar Effective Temperature | K | numeric |  294 | 4874 | Black-body temperature emitting the same total electromagnetic radiation as the star. | st_teff |
| star_radius_solar | Stellar Radius | Solar radii | numeric |  318 | 13.76 | Stellar radius in units of the Sun's radius. | st_rad |
| star_mass_solar | Stellar Mass | Solar masses | numeric |    9 | 2.09 | Stellar mass in units of the Sun's mass. | st_mass |
| star_metallicity_dex | Stellar Metallicity | dex | numeric |  641 | -0.26 | Metal content of the stellar photosphere relative to hydrogen. | st_met |
| star_log_g | Stellar Surface Gravity | log10(cm/s^2) | numeric |  322 | 2.45 | Gravitational acceleration at the stellar surface (log10). | st_logg |
| star_age_gyr | Stellar Age | Gyr | numeric | 1425 | 1.56 | Age of the host star in billions of years. | st_age |
| ra_deg | Right Ascension | deg | numeric |    0 | 185.1787793 | Right ascension of the planetary system in decimal degrees. | ra |
| dec_deg | Declination | deg | numeric |    0 | 17.7932516 | Declination of the planetary system in decimal degrees. | dec |
| distance_pc | Distance | pc | numeric |   27 | 93.1846 | Distance to the planetary system in parsecs. | sy_dist |

## stars
Rows: 47558 - Columns: 134

| column_name | label | units | r_type | n_missing | example | description | archive_name |
| --- | --- | --- | --- | --- | --- | --- | --- |
| host_name | Host Name |  | character |     0 | 11 Com | Stellar name most commonly used in the literature. | hostname |
| hd_id | HD ID |  | character | 40704 | HD 107383 | Henry Draper Catalog identifier. | hd_name |
| hip_id | HIP ID |  | character | 40331 | HIP 60202 | Hipparcos Catalog identifier. | hip_name |
| tic_id | TIC ID |  | character |   993 | TIC 72437047 | TESS Input Catalog identifier. | tic_id |
| ra_deg | Right Ascension | deg | numeric |   228 | 185.1787793 | Right ascension of the planetary system in decimal degrees. | ra |
| ra_sexagesimal | RA (sexagesimal) |  | character |   228 | 12h20m42.91s | Right ascension in sexagesimal hh:mm:ss notation. | rastr |
| dec_deg | Declination | deg | numeric |   228 | 17.7932516 | Declination of the planetary system in decimal degrees. | dec |
| dec_sexagesimal | Dec (sexagesimal) |  | character |   228 | +17d47m35.71s | Declination in sexagesimal dd:mm:ss notation. | decstr |
| galactic_lon_deg | Galactic Longitude | deg | numeric |   228 | 264.13775 | Galactic longitude of the planetary system. | glon |
| galactic_lat_deg | Galactic Latitude | deg | numeric |   228 | 78.28058 | Galactic latitude of the planetary system. | glat |
| ecliptic_lon_deg | Ecliptic Longitude | deg | numeric |   228 | 177.4179 | Ecliptic longitude of the planetary system. | elon |
| ecliptic_lat_deg | Ecliptic Latitude | deg | numeric |   228 | 18.33392 | Ecliptic latitude of the planetary system. | elat |
| mag_i_cousins | I (Cousins) Magnitude | mag | logical | 47558 |  | Apparent brightness in the I (Cousins) band. | sy_icmag |
| mag_i_cousins_upper_err | I (Cousins) Magnitude (+ uncertainty) | mag | logical | 47558 |  | Upper (positive) 1-sigma uncertainty on sy_icmag. | sy_icmagerr1 |
| mag_i_cousins_lower_err | I (Cousins) Magnitude (- uncertainty) | mag | logical | 47558 |  | Lower (negative) 1-sigma uncertainty on sy_icmag. | sy_icmagerr2 |
| temperature_k | Stellar Effective Temperature | K | numeric |  8488 | 4742 | Black-body temperature emitting the same total electromagnetic radiation as the star. | st_teff |
| temperature_k_upper_err | Stellar Effective Temperature (+ uncertainty) | K | numeric | 15050 | 100 | Upper (positive) 1-sigma uncertainty on st_teff. | st_tefferr1 |
| temperature_k_lower_err | Stellar Effective Temperature (- uncertainty) | K | numeric | 15219 | -100 | Lower (negative) 1-sigma uncertainty on st_teff. | st_tefferr2 |
| temperature_k_limit_flag | Stellar Effective Temperature (limit flag) |  | numeric |  5367 | 0 | Limit flag for st_teff: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_tefflim |
| metallicity_dex | Stellar Metallicity | dex | numeric | 24296 | -0.35 | Metal content of the stellar photosphere relative to hydrogen. | st_met |
| metallicity_dex_upper_err | Stellar Metallicity (+ uncertainty) | dex | numeric | 26998 | 0.09 | Upper (positive) 1-sigma uncertainty on st_met. | st_meterr1 |
| metallicity_dex_lower_err | Stellar Metallicity (- uncertainty) | dex | numeric | 26998 | -0.09 | Lower (negative) 1-sigma uncertainty on st_met. | st_meterr2 |
| metallicity_dex_limit_flag | Stellar Metallicity (limit flag) |  | numeric | 16783 | 0 | Limit flag for st_met: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_metlim |
| radial_velocity_km_s | Systemic Radial Velocity | km/s | numeric | 44667 | 43.36898 | Star's velocity along the line of sight from Earth. | st_radv |
| radial_velocity_km_s_upper_err | Systemic Radial Velocity (+ uncertainty) | km/s | numeric | 44998 | 0.2087 | Upper (positive) 1-sigma uncertainty on st_radv. | st_radverr1 |
| radial_velocity_km_s_lower_err | Systemic Radial Velocity (- uncertainty) | km/s | numeric | 45060 | -0.2087 | Lower (negative) 1-sigma uncertainty on st_radv. | st_radverr2 |
| radial_velocity_km_s_limit_flag | Systemic Radial Velocity (limit flag) |  | numeric | 44667 | 0 | Limit flag for st_radv: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_radvlim |
| v_sin_i_km_s | Stellar Rotational Velocity | km/s | numeric | 44742 | 1.2 | Equatorial rotational velocity multiplied by sin(inclination). | st_vsin |
| v_sin_i_km_s_upper_err | Stellar Rotational Velocity (+ uncertainty) | km/s | numeric | 45622 | 1 | Upper (positive) 1-sigma uncertainty on st_vsin. | st_vsinerr1 |
| v_sin_i_km_s_lower_err | Stellar Rotational Velocity (- uncertainty) | km/s | numeric | 45710 | -1 | Lower (negative) 1-sigma uncertainty on st_vsin. | st_vsinerr2 |
| v_sin_i_km_s_limit_flag | Stellar Rotational Velocity (limit flag) |  | numeric | 44742 | 0 | Limit flag for st_vsin: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_vsinlim |
| luminosity_log_solar | Stellar Luminosity | log10(L_sun) | numeric | 38264 | 2.243 | Energy emitted per unit time, in solar luminosities (log10). | st_lum |
| luminosity_log_solar_upper_err | Stellar Luminosity (+ uncertainty) | log10(L_sun) | numeric | 39982 | 0.071 | Upper (positive) 1-sigma uncertainty on st_lum. | st_lumerr1 |
| luminosity_log_solar_lower_err | Stellar Luminosity (- uncertainty) | log10(L_sun) | numeric | 40008 | -0.085 | Lower (negative) 1-sigma uncertainty on st_lum. | st_lumerr2 |
| luminosity_log_solar_limit_flag | Stellar Luminosity (limit flag) |  | numeric | 38264 | 0 | Limit flag for st_lum: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_lumlim |
| log_g | Stellar Surface Gravity | log10(cm/s^2) | numeric | 15268 | 2.31 | Gravitational acceleration at the stellar surface (log10). | st_logg |
| log_g_upper_err | Stellar Surface Gravity (+ uncertainty) | log10(cm/s^2) | numeric | 23137 | 0.1 | Upper (positive) 1-sigma uncertainty on st_logg. | st_loggerr1 |
| log_g_lower_err | Stellar Surface Gravity (- uncertainty) | log10(cm/s^2) | numeric | 23131 | -0.1 | Lower (negative) 1-sigma uncertainty on st_logg. | st_loggerr2 |
| log_g_limit_flag | Stellar Surface Gravity (limit flag) |  | numeric | 12147 | 0 | Limit flag for st_logg: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_logglim |
| age_gyr | Stellar Age | Gyr | numeric | 39707 | 3.186 | Age of the host star in billions of years. | st_age |
| age_gyr_upper_err | Stellar Age (+ uncertainty) | Gyr | numeric | 40189 | 1.521 | Upper (positive) 1-sigma uncertainty on st_age. | st_ageerr1 |
| age_gyr_lower_err | Stellar Age (- uncertainty) | Gyr | numeric | 40195 | -1.521 | Lower (negative) 1-sigma uncertainty on st_age. | st_ageerr2 |
| age_gyr_limit_flag | Stellar Age (limit flag) |  | numeric | 22754 | 0 | Limit flag for st_age: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_agelim |
| mass_solar | Stellar Mass | Solar masses | numeric | 18539 | 2.7 | Stellar mass in units of the Sun's mass. | st_mass |
| mass_solar_upper_err | Stellar Mass (+ uncertainty) | Solar masses | numeric | 21907 | 0.3 | Upper (positive) 1-sigma uncertainty on st_mass. | st_masserr1 |
| mass_solar_lower_err | Stellar Mass (- uncertainty) | Solar masses | numeric | 21984 | -0.3 | Lower (negative) 1-sigma uncertainty on st_mass. | st_masserr2 |
| mass_solar_limit_flag | Stellar Mass (limit flag) |  | numeric | 13431 | 0 | Limit flag for st_mass: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_masslim |
| density_g_cm3 | Stellar Density | g/cm^3 | numeric | 28833 | 3.987976 | Stellar mass per unit volume. | st_dens |
| density_g_cm3_upper_err | Stellar Density (+ uncertainty) | g/cm^3 | numeric | 30384 | 1.527688 | Upper (positive) 1-sigma uncertainty on st_dens. | st_denserr1 |
| density_g_cm3_lower_err | Stellar Density (- uncertainty) | g/cm^3 | numeric | 30384 | -0.811581 | Lower (negative) 1-sigma uncertainty on st_dens. | st_denserr2 |
| density_g_cm3_limit_flag | Stellar Density (limit flag) |  | numeric | 21326 | 0 | Limit flag for st_dens: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_denslim |
| radius_solar | Stellar Radius | Solar radii | numeric |  9070 | 19 | Stellar radius in units of the Sun's radius. | st_rad |
| radius_solar_upper_err | Stellar Radius (+ uncertainty) | Solar radii | numeric | 17174 | 2 | Upper (positive) 1-sigma uncertainty on st_rad. | st_raderr1 |
| radius_solar_lower_err | Stellar Radius (- uncertainty) | Solar radii | numeric | 17250 | -2 | Lower (negative) 1-sigma uncertainty on st_rad. | st_raderr2 |
| radius_solar_limit_flag | Stellar Radius (limit flag) |  | numeric |  5938 | 0 | Limit flag for st_rad: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_radlim |
| n_stars | Number of Stars |  | numeric |     0 | 2 | Number of gravitationally bound stars in the planetary system. | sy_snum |
| n_planets | Number of Planets |  | numeric |     0 | 1 | Number of confirmed planets in the planetary system. | sy_pnum |
| n_moons | Number of Moons |  | numeric |     0 | 0 | Number of confirmed moons in the planetary system. | sy_mnum |
| proper_motion_total_mas_yr | Total Proper Motion | mas/yr | numeric |  1199 | 140.3836266 | Total angular change in position over time relative to Solar System barycenter. | sy_pm |
| proper_motion_total_mas_yr_upper_err | Total Proper Motion (+ uncertainty) | mas/yr | numeric |  1199 | 0.3013952 | Upper (positive) 1-sigma uncertainty on sy_pm. | sy_pmerr1 |
| proper_motion_total_mas_yr_lower_err | Total Proper Motion (- uncertainty) | mas/yr | numeric |  1203 | -0.3013952 | Lower (negative) 1-sigma uncertainty on sy_pm. | sy_pmerr2 |
| proper_motion_ra_mas_yr | Proper Motion (RA) | mas/yr | numeric |  1199 | -109.241 | Proper motion in right ascension. | sy_pmra |
| proper_motion_ra_mas_yr_upper_err | Proper Motion (RA) (+ uncertainty) | mas/yr | numeric |  1199 | 0.316107 | Upper (positive) 1-sigma uncertainty on sy_pmra. | sy_pmraerr1 |
| proper_motion_ra_mas_yr_lower_err | Proper Motion (RA) (- uncertainty) | mas/yr | numeric |  1203 | -0.316107 | Lower (negative) 1-sigma uncertainty on sy_pmra. | sy_pmraerr2 |
| proper_motion_dec_mas_yr | Proper Motion (Dec) | mas/yr | numeric |  1199 | 88.1701 | Proper motion in declination. | sy_pmdec |
| proper_motion_dec_mas_yr_upper_err | Proper Motion (Dec) (+ uncertainty) | mas/yr | numeric |  1199 | 0.277297 | Upper (positive) 1-sigma uncertainty on sy_pmdec. | sy_pmdecerr1 |
| proper_motion_dec_mas_yr_lower_err | Proper Motion (Dec) (- uncertainty) | mas/yr | numeric |  1203 | -0.277297 | Lower (negative) 1-sigma uncertainty on sy_pmdec. | sy_pmdecerr2 |
| parallax_mas | Parallax | mas | numeric |  2955 | 10.7104 | Annual parallax of the system. | sy_plx |
| parallax_mas_upper_err | Parallax (+ uncertainty) | mas | numeric |  2955 | 0.219739 | Upper (positive) 1-sigma uncertainty on sy_plx. | sy_plxerr1 |
| parallax_mas_lower_err | Parallax (- uncertainty) | mas | numeric |  2955 | -0.219739 | Lower (negative) 1-sigma uncertainty on sy_plx. | sy_plxerr2 |
| distance_pc | Distance | pc | numeric |  1251 | 93.1846 | Distance to the planetary system in parsecs. | sy_dist |
| distance_pc_upper_err | Distance (+ uncertainty) | pc | numeric |  2258 | 1.9238 | Upper (positive) 1-sigma uncertainty on sy_dist. | sy_disterr1 |
| distance_pc_lower_err | Distance (- uncertainty) | pc | numeric |  2258 | -1.9238 | Lower (negative) 1-sigma uncertainty on sy_dist. | sy_disterr2 |
| mag_b_johnson | B (Johnson) Magnitude | mag | numeric |  2013 | 5.726 | Apparent brightness in the B (Johnson) photometric band. | sy_bmag |
| mag_b_johnson_upper_err | B (Johnson) Magnitude (+ uncertainty) | mag | numeric |  2041 | 0.017 | Upper (positive) 1-sigma uncertainty on sy_bmag. | sy_bmagerr1 |
| mag_b_johnson_lower_err | B (Johnson) Magnitude (- uncertainty) | mag | numeric |  2041 | -0.017 | Lower (negative) 1-sigma uncertainty on sy_bmag. | sy_bmagerr2 |
| mag_v_johnson | V (Johnson) Magnitude | mag | numeric |  1085 | 4.72307 | Apparent brightness in the V (Johnson) photometric band. | sy_vmag |
| mag_v_johnson_upper_err | V (Johnson) Magnitude (+ uncertainty) | mag | numeric |  1097 | 0.023 | Upper (positive) 1-sigma uncertainty on sy_vmag. | sy_vmagerr1 |
| mag_v_johnson_lower_err | V (Johnson) Magnitude (- uncertainty) | mag | numeric |  1098 | -0.023 | Lower (negative) 1-sigma uncertainty on sy_vmag. | sy_vmagerr2 |
| mag_j_2mass | J (2MASS) Magnitude | mag | numeric |  1188 | 2.943 | Apparent brightness in the 2MASS J band. | sy_jmag |
| mag_j_2mass_upper_err | J (2MASS) Magnitude (+ uncertainty) | mag | numeric |  1327 | 0.334 | Upper (positive) 1-sigma uncertainty on sy_jmag. | sy_jmagerr1 |
| mag_j_2mass_lower_err | J (2MASS) Magnitude (- uncertainty) | mag | numeric |  1327 | -0.334 | Lower (negative) 1-sigma uncertainty on sy_jmag. | sy_jmagerr2 |
| mag_h_2mass | H (2MASS) Magnitude | mag | numeric |  1164 | 2.484 | Apparent brightness in the 2MASS H band. | sy_hmag |
| mag_h_2mass_upper_err | H (2MASS) Magnitude (+ uncertainty) | mag | numeric |  1360 | 0.268 | Upper (positive) 1-sigma uncertainty on sy_hmag. | sy_hmagerr1 |
| mag_h_2mass_lower_err | H (2MASS) Magnitude (- uncertainty) | mag | numeric |  1360 | -0.268 | Lower (negative) 1-sigma uncertainty on sy_hmag. | sy_hmagerr2 |
| mag_k_2mass | Ks (2MASS) Magnitude | mag | numeric |  1165 | 2.282 | Apparent brightness in the 2MASS Ks band. | sy_kmag |
| mag_k_2mass_upper_err | Ks (2MASS) Magnitude (+ uncertainty) | mag | numeric |  1502 | 0.346 | Upper (positive) 1-sigma uncertainty on sy_kmag. | sy_kmagerr1 |
| mag_k_2mass_lower_err | Ks (2MASS) Magnitude (- uncertainty) | mag | numeric |  1502 | -0.346 | Lower (negative) 1-sigma uncertainty on sy_kmag. | sy_kmagerr2 |
| mag_u_sloan | u (Sloan) Magnitude | mag | numeric | 42958 | 21.474 | Apparent brightness in the SDSS u band. | sy_umag |
| mag_u_sloan_upper_err | u (Sloan) Magnitude (+ uncertainty) | mag | numeric | 42958 | 0.138038 | Upper (positive) 1-sigma uncertainty on sy_umag. | sy_umagerr1 |
| mag_u_sloan_lower_err | u (Sloan) Magnitude (- uncertainty) | mag | numeric | 42958 | -0.138038 | Lower (negative) 1-sigma uncertainty on sy_umag. | sy_umagerr2 |
| mag_r_sloan | r (Sloan) Magnitude | mag | numeric | 42958 | 17.1968 | Apparent brightness in the SDSS r band. | sy_rmag |
| mag_r_sloan_upper_err | r (Sloan) Magnitude (+ uncertainty) | mag | numeric | 42958 | 0.0055162 | Upper (positive) 1-sigma uncertainty on sy_rmag. | sy_rmagerr1 |
| mag_r_sloan_lower_err | r (Sloan) Magnitude (- uncertainty) | mag | numeric | 42958 | -0.0055162 | Lower (negative) 1-sigma uncertainty on sy_rmag. | sy_rmagerr2 |
| mag_i_sloan | i (Sloan) Magnitude | mag | numeric | 42958 | 14.9773 | Apparent brightness in the SDSS i band. | sy_imag |
| mag_i_sloan_upper_err | i (Sloan) Magnitude (+ uncertainty) | mag | numeric | 42958 | 0.0047109 | Upper (positive) 1-sigma uncertainty on sy_imag. | sy_imagerr1 |
| mag_i_sloan_lower_err | i (Sloan) Magnitude (- uncertainty) | mag | numeric | 42958 | -0.0047109 | Lower (negative) 1-sigma uncertainty on sy_imag. | sy_imagerr2 |
| mag_z_sloan | z (Sloan) Magnitude | mag | numeric | 42958 | 13.7544 | Apparent brightness in the SDSS z band. | sy_zmag |
| mag_z_sloan_upper_err | z (Sloan) Magnitude (+ uncertainty) | mag | numeric | 42958 | 0.0045211 | Upper (positive) 1-sigma uncertainty on sy_zmag. | sy_zmagerr1 |
| mag_z_sloan_lower_err | z (Sloan) Magnitude (- uncertainty) | mag | numeric | 42958 | -0.0045211 | Lower (negative) 1-sigma uncertainty on sy_zmag. | sy_zmagerr2 |
| mag_w1_wise | W1 (WISE) Magnitude | mag | numeric |  4917 | 0.639 | Apparent brightness in the WISE 3.4 micron band. | sy_w1mag |
| mag_w1_wise_upper_err | W1 (WISE) Magnitude (+ uncertainty) | mag | numeric |  5201 | 0.236 | Upper (positive) 1-sigma uncertainty on sy_w1mag. | sy_w1magerr1 |
| mag_w1_wise_lower_err | W1 (WISE) Magnitude (- uncertainty) | mag | numeric |  5201 | -0.236 | Lower (negative) 1-sigma uncertainty on sy_w1mag. | sy_w1magerr2 |
| mag_w2_wise | W2 (WISE) Magnitude | mag | numeric |  4915 | 0.732 | Apparent brightness in the WISE 4.6 micron band. | sy_w2mag |
| mag_w2_wise_upper_err | W2 (WISE) Magnitude (+ uncertainty) | mag | numeric |  5168 | 0.106 | Upper (positive) 1-sigma uncertainty on sy_w2mag. | sy_w2magerr1 |
| mag_w2_wise_lower_err | W2 (WISE) Magnitude (- uncertainty) | mag | numeric |  5168 | -0.106 | Lower (negative) 1-sigma uncertainty on sy_w2mag. | sy_w2magerr2 |
| mag_w3_wise | W3 (WISE) Magnitude | mag | numeric |  4918 | 2.358 | Apparent brightness in the WISE 12 micron band. | sy_w3mag |
| mag_w3_wise_upper_err | W3 (WISE) Magnitude (+ uncertainty) | mag | numeric | 15937 | 0.01 | Upper (positive) 1-sigma uncertainty on sy_w3mag. | sy_w3magerr1 |
| mag_w3_wise_lower_err | W3 (WISE) Magnitude (- uncertainty) | mag | numeric | 15937 | -0.01 | Lower (negative) 1-sigma uncertainty on sy_w3mag. | sy_w3magerr2 |
| mag_w4_wise | W4 (WISE) Magnitude | mag | numeric |  4922 | 2.27 | Apparent brightness in the WISE 22 micron band. | sy_w4mag |
| mag_w4_wise_upper_err | W4 (WISE) Magnitude (+ uncertainty) | mag | numeric | 38990 | 0.018 | Upper (positive) 1-sigma uncertainty on sy_w4mag. | sy_w4magerr1 |
| mag_w4_wise_lower_err | W4 (WISE) Magnitude (- uncertainty) | mag | numeric | 38990 | -0.018 | Lower (negative) 1-sigma uncertainty on sy_w4mag. | sy_w4magerr2 |
| mag_g_sloan | g (Sloan) Magnitude | mag | numeric | 42958 | 18.7211 | Apparent brightness in the SDSS g band. | sy_gmag |
| mag_g_sloan_upper_err | g (Sloan) Magnitude (+ uncertainty) | mag | numeric | 42958 | 0.0082138 | Upper (positive) 1-sigma uncertainty on sy_gmag. | sy_gmagerr1 |
| mag_g_sloan_lower_err | g (Sloan) Magnitude (- uncertainty) | mag | numeric | 42958 | -0.0082138 | Lower (negative) 1-sigma uncertainty on sy_gmag. | sy_gmagerr2 |
| mag_gaia | Gaia Magnitude | mag | numeric |  1468 | 4.44038 | Apparent brightness in the Gaia G band. | sy_gaiamag |
| mag_gaia_upper_err | Gaia Magnitude (+ uncertainty) | mag | numeric |  1468 | 0.0038479 | Upper (positive) 1-sigma uncertainty on sy_gaiamag. | sy_gaiamagerr1 |
| mag_gaia_lower_err | Gaia Magnitude (- uncertainty) | mag | numeric |  1468 | -0.0038479 | Lower (negative) 1-sigma uncertainty on sy_gaiamag. | sy_gaiamagerr2 |
| mag_tess | TESS Magnitude | mag | numeric |  1009 | 3.8379 | Apparent brightness in the TESS bandpass. | sy_tmag |
| mag_tess_upper_err | TESS Magnitude (+ uncertainty) | mag | numeric |  1043 | 0.0071 | Upper (positive) 1-sigma uncertainty on sy_tmag. | sy_tmagerr1 |
| mag_tess_lower_err | TESS Magnitude (- uncertainty) | mag | numeric |  1043 | -0.0071 | Lower (negative) 1-sigma uncertainty on sy_tmag. | sy_tmagerr2 |
| system_name | System Name |  | character |     0 | 11 Com | Name of the system the star belongs to. | sy_name |
| metallicity_ratio | Stellar Metallicity Ratio |  | character | 24481 | [Fe/H] | Ratio used to express metallicity (e.g. [Fe/H], [M/H]). | st_metratio |
| spectral_type | Spectral Type |  | character | 44068 | G8 III | Morgan-Keenan spectral classification of the star. | st_spectype |
| mag_kepler | Kepler Magnitude | mag | numeric | 13290 | 6.095 | Apparent brightness in the Kepler bandpass. | sy_kepmag |
| mag_kepler_upper_err | Kepler Magnitude (+ uncertainty) | mag | logical | 47558 |  | Upper (positive) 1-sigma uncertainty on sy_kepmag. | sy_kepmagerr1 |
| mag_kepler_lower_err | Kepler Magnitude (- uncertainty) | mag | logical | 47558 |  | Lower (negative) 1-sigma uncertainty on sy_kepmag. | sy_kepmagerr2 |
| rotation_period_days | Stellar Rotational Period | days | numeric | 46840 | 329.49 | Time required for one full rotation (assuming solid-body rotation). | st_rotp |
| rotation_period_days_upper_err | Stellar Rotational Period (+ uncertainty) | days | numeric | 46984 | 92.4 | Upper (positive) 1-sigma uncertainty on st_rotp. | st_rotperr1 |
| rotation_period_days_lower_err | Stellar Rotational Period (- uncertainty) | days | numeric | 46984 | -92.4 | Lower (negative) 1-sigma uncertainty on st_rotp. | st_rotperr2 |
| rotation_period_days_limit_flag | Stellar Rotational Period (limit flag) |  | numeric | 46840 | 1 | Limit flag for st_rotp: 1 = upper limit, -1 = lower limit, 0 = a measured value. | st_rotplim |
| gaia_dr2_id | Gaia DR2 ID |  | character |  1459 | Gaia DR2 3946945413106333696 | Gaia Data Release 2 identifier. | gaia_dr2_id |
| gaia_dr3_id | Gaia DR3 ID |  | character |  1787 | Gaia DR3 3946945413106333696 | Gaia Data Release 3 identifier. | gaia_dr3_id |
| circumbinary_flag | Circumbinary Flag |  | numeric |     0 | 0 | 1 if planet orbits a binary system, 0 otherwise. | cb_flag |
