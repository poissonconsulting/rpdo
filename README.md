
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpdo

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/rpdo.svg?branch=master)](https://travis-ci.org/poissonconsulting/rpdo)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/rpdo/master.svg)](https://codecov.io/github/poissonconsulting/rpdo?branch=master)
[![License:
CC0](https://img.shields.io/badge/License-CC0-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rpdo)](https://cran.r-project.org/package=rpdo)
[![CRAN
Downloads](http://cranlogs.r-pkg.org/badges/grand-total/rpdo)](https://CRAN.R-project.org/package=rpdo)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1163733.svg)](https://doi.org/10.5281/zenodo.1163733)

`rpdo` is an R data package of Monthly Pacific Decadal Oscillation (PDO)
index values from January 1900 to June 2018.

The function `pdo_download()` scrapes the most recent data from
<http://research.jisao.washington.edu/pdo/PDO.latest>.

## Installation

To install the most recent release from CRAN

    install.packages("rpdo")

To install the development version from GitHub

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/rpdo")

## Usage

``` r
library(rpdo)
library(ggplot2)

data <- rpdo::pdo

data <- subset(data, data$Month == 1)

ggplot(data = data, aes(x = Year, y = PDO)) + 
geom_smooth(span = 0.1, se = FALSE, color = "black", method = 'loess') + geom_point() + ylab("January PDO Index")
```

![Pacific Decadal Oscillation (PDO) Index for January by
year.](tools/README-unnamed-chunk-2-1.png)

## Citation

``` 

To cite package 'rpdo' in publications use:

  Joe Thorley, Nathan Mantua and Steven R. Hare (2018). rpdo:
  Pacific Decadal Oscillation Index Data. R package version
  0.2.3.9001. https://github.com/poissonconsulting/rpdo

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {rpdo: Pacific Decadal Oscillation Index Data},
    author = {Joe Thorley and Nathan Mantua and Steven R. Hare},
    year = {2018},
    note = {R package version 0.2.3.9001},
    url = {https://github.com/poissonconsulting/rpdo},
  }
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/rpdo/issues).

[Pull requests](https://github.com/poissonconsulting/rpdo/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

## See Also

The [`rsoi`](https://github.com/boshek/rsoi) package provides El
Nino/Southern Oscillation (ENSO) and Related Climate Indices.

## Information

For more information see
<http://research.jisao.washington.edu/pdo/PDO.latest>.
