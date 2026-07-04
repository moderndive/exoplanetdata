# exoplanetdata 0.1.0

* Initial release.
* Adds two datasets sourced from NASA's Exoplanet Archive (retrieved via the
  [`REXoplanets`](https://github.com/JKolomanski/REXoplanets) package):
    * `planets`: one row per confirmed exoplanet from the
      Planetary Systems Composite Parameters (`pscomppars`) table, with
      host-star parameters merged in.
    * `stars`: reference-level stellar host parameters (`stellarhosts`
      table) — many rows per star, one per published parameter solution.
* Column names have been simplified for classroom use and units baked into
  names where ambiguous. Original NASA short names are preserved in the data
  dictionaries shipped under `inst/extdata/`.
