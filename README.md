<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/rpdo.svg?branch=master)](https://travis-ci.org/poissonconsulting/rpdo) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rpdo)](http://cran.r-project.org/package=rpdo) [![CRAN Downloads](http://cranlogs.r-pkg.org/badges/grand-total/rpdo)](https://hadley.shinyapps.io/cran-downloads)

rpdo
====

PDO Index
---------

rpdo is an R data package of Monthly Pacific Decadal Oscillation (PDO) index values from January 1900 to present.

``` r
library(rpdo)
library(ggplot2)

data(pdo)
ggplot(data = pdo, aes(x = Year, y = PDO)) + facet_wrap(~Month) + geom_line() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
```

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png)

Further Information
-------------------

For more information install the package and then run `vignette("rpdo")`.

Installation
------------

To install and load the most recent release from CRAN

    install.packages("rpdo")
    library(rpdo)

To install and load the development version from GitHub

    devtools::install_github("rpdo")
    library(rpdo)
