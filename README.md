
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpdo

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/rpdo.svg?branch=master)](https://travis-ci.org/poissonconsulting/rpdo)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/rpdo?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/rpdo)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/rpdo/master.svg)](https://codecov.io/github/poissonconsulting/rpdo?branch=master)
[![status](https://tinyverse.netlify.com/badge/rpdo)](https://CRAN.R-project.org/package=rpdo)
[![License:
CC0](https://img.shields.io/badge/License-CC0-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rpdo)](https://cran.r-project.org/package=rpdo)
![CRAN Downloads](http://cranlogs.r-pkg.org/badges/rpdo)
<!-- badges: end -->

`rpdo` is an R data package of Monthly Pacific Decadal Oscillation (PDO)
index values from January 1900 to September 2018.

The function `pdo_download()` scrapes the most recent data from
<http://research.jisao.washington.edu/pdo/PDO.latest>.

## Demonstration

``` r
library(rpdo)
library(ggplot2)

data <- rpdo::pdo

data <- subset(data, data$Month == 1)

ggplot(data = data, aes(x = Year, y = PDO)) +
  geom_smooth(span = 0.1, se = FALSE, color = "black", method = "loess") +
  geom_point() +
  ylab("January PDO Index")
```

![Pacific Decadal Oscillation (PDO) Index for January by
year.](man/figures/README-unnamed-chunk-2-1.png)

## Installation

To install the latest release from [CRAN](https://cran.r-project.org)

``` r
install.packages("rpdo")
```

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/rpdo)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/rpdo")
```

To install the latest developmental release from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

``` r
# install.packages("drat")
drat::addRepo("poissonconsulting")
install.packages("rpdo")
```

## See Also

The [`rsoi`](https://github.com/boshek/rsoi) package which provides El
Nino/Southern Oscillation (ENSO) and Related Climate Indices.

## Information

For more information see
<http://research.jisao.washington.edu/pdo/PDO.latest>.

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/rpdo/issues).

[Pull requests](https://github.com/poissonconsulting/rpdo/pulls) are
always welcome.

### Code of Conduct

Please note that the rpdo project is released with a [Contributor Code
of
Conduct](https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/).
By contributing to this project, you agree to abide by its terms.
