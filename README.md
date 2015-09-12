[![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/rpdo.svg?branch=master)](https://travis-ci.org/poissonconsulting/rpdo)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rpdo)](http://cran.r-project.org/web/packages/rpdo)

# Pacific Decadal Oscillation Index

Monthly Pacific Decadal Oscillation (PDO) index 
values from January 1900 to present.

Updated standardized values for the PDO index, derived as the 
leading PC of monthly SST anomalies in the North Pacific Ocean, 
poleward of 20N. The monthly mean global average SST anomalies
are removed to separate this pattern of variability from any 
"global warming" signal that may be present in the data. 

For more details, see:

 Zhang, Y., J.M. Wallace, D.S. Battisti, 1997: 
     ENSO-like interdecadal variability: 1900-93. J. Climate, 10, 1004-1020. 

 Mantua, N.J. and S.R. Hare, Y. Zhang, J.M. Wallace, and R.C. Francis,1997: 
     A Pacific interdecadal climate oscillation with impacts on salmon 
     production. Bulletin of the American Meteorological Society, 78, 
     pp. 1069-1079.
     (available via the internet at url: 
         http://www.atmos.washington.edu/~mantua/abst.PDO.html) 

Data sources for this index are: 
 UKMO Historical SST data set for 1900-81; 
 Reynold's Optimally Interpolated SST (V1) for January 1982-Dec 2001)
*** OI SST Version 2 (V2) beginning January 2002 -   

See also <http://research.jisao.washington.edu/pdo/PDO.latest>.

## Installation

To install and load the most recent release from CRAN
```
install.packages("rpdo")
library(rpdo)
```

## Information

For more information type after loading the package
```
?rpdo
```
