<a href="https://www.nies.futbol/"><img
src="https://github.com/nepito/world_cup_semis/blob/develop/img/logo.jpeg" align="right" width="256"
/></a>

# `readdp`
[![codecov](https://codecov.io/github/niesfutbol/readdp/graph/badge.svg?token=ZyE3cju8ES)](https://codecov.io/github/niesfutbol/readdp)
![licencia](https://img.shields.io/github/license/niesfutbol/readdp)
![languages](https://img.shields.io/github/languages/top/niesfutbol/readdp)
![commits](https://img.shields.io/github/commit-activity/y/niesfutbol/readdp)

## Step to use

Para instalar
``` R
remotes::install_github('niesfutbol/readdp')
```

Escribe un `datapackage.json` con el **tibble** `example_data` en el folder `/workdir/deleteme/`:

``` R
example_data <- tibble::tibble(
  a = 1:5,
  b = letters[1:5]
)
path_example <- "/workdir/deleteme/example.csv"
readdp::write_csv(example_data, path_example)
```

