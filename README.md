
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/rpdo.svg?branch=master)](https://travis-ci.org/poissonconsulting/rpdo) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/rpdo?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/rpdo) [![Coverage Status](https://img.shields.io/codecov/c/github/poissonconsulting/rpdo/master.svg)](https://codecov.io/github/poissonconsulting/rpdo?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rpdo)](https://cran.r-project.org/package=rpdo) [![CRAN Downloads](http://cranlogs.r-pkg.org/badges/grand-total/rpdo)](https://CRAN.R-project.org/package=rpdo)

rpdo
====

PDO Index
---------

`rpdo` is an R data package of Monthly Pacific Decadal Oscillation (PDO) index values from January 1900 to February 2017.

The function `download_pdo()` scrapes the most recent data from <http://research.jisao.washington.edu/pdo/PDO.latest>.

``` r
library(rpdo)
library(ggplot2)

ggplot(data = subset(rpdo::pdo, pdo$Month == 1), aes(x = Year, y = PDO)) + 
geom_smooth(span = 0.1, se = FALSE, color = "black", method = 'loess') + geom_point() + ylab("January PDO Index")
```

![Pacific Decadal Oscillation (PDO) Index for January by year.](tools/README-unnamed-chunk-2-1.png)

Installation
------------

To install and load the most recent release from CRAN

    install.packages("rpdo")
    library(rpdo)

To install and load the development version from GitHub

    devtools::install_github("rpdo")
    library(rpdo)

Information
-----------

For more information see <http://research.jisao.washington.edu/pdo/PDO.latest>.
