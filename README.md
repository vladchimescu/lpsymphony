[![Build Status](https://travis-ci.org/vladchimescu/lpsymphony.svg?branch=master)](https://travis-ci.org/vladchimescu/lpsymphony)

`lpsymphony`: SYMPHONY Interface for Bioconductor
===============================================

[SYMPHONY](<https://github.com/coin-or/SYMPHONY>) is an open-source solver for mixed-integer linear optimization problems . `lpsymphony` adapts SYMPHONY code for use in R. The package is based on CRAN's [Rsymphony](<https://cran.r-project.org/web/packages/Rsymphony/index.html>). 

Install
-------

To install Bioconductor release version of `lpsymphony` simply run in R

```r
## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite("lpsymphony")
```

To get the newest version install the package directly from Github:

```r
devtools::install_github("vladchimescu/lpsymphony")
```

Questions, Issues, Requests
---------------------------

If you are experiencing problems with `lpsymphony` please create an issue or post your question on the [Bioconductor support website](<https://support.bioconductor.org>)
