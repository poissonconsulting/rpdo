## Resubmission

This is a resubmission. In this version I have:

- Removed all dependencies except `stats`, `utils` and `checkr`. 
- Added values from February 2017 to December 2017.

## Test environments

* local OS X install, R 3.4.3
* ubuntu 12.04 (on travis-ci), R 3.4.3
* win-builder (devel and release)

## R CMD check results

There were no ERRORs or WARNINGs.

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Joe Thorley <joe@poissonconsulting.ca>'

Possibly mis-spelled words in DESCRIPTION:
  Decadal (3:16, 10:30)
  PDO (10:51)
  
**Both words are correctly spelt.**

## Downstream dependencies

rsoi is the only downstream dependency
Checked rsoi: 0 errors | 0 warnings | 0 notes
