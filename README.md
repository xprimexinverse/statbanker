The statbanker package
==========

This R package can be used to retrieve data from the Central Statistics Office of Ireland's [PxStat database](https://data.cso.ie/). 

The package can retrieve the data from two sources:

1. [CSO PxStat](https://data.cso.ie/) (PC-AXIS files)
2. [Statbank API](http://www.cso.ie/webserviceclient/Default.aspx) (JSON-stat files)

To cite the statbanker package in publications, use:

>  Graeme Walsh (2020). _statbanker_ R package version **7.0.0**.

Installation
-----------

To install the package, download the tar.gz file and use the Install Packages feature under Tools in RStudio.

A couple of things to note. You should already have installed the following packages: pxR, reshape, and rjson. These can be installed from CRAN using the normal method. 

Quick Start
-----------

Begin by loading the package and reading some of the man pages:

```r
library(statbanker)
?statbanker
?getStatBankData
```

Examples
-----------

To quickly get a feel for how the package works, run the following examples.

The first example shows how to retrieve Quarterly National Accounts data from the StatBank database. Note that the returned object is "px".

```r
# Example 1
NQQ33 <- getStatBankData("NQQ33")
class(NQQ33)
```

The second example demonstrates the helper functions in the package.

```r
# Example 2
NQQ33_ROW <- px2row(NQQ33)
NQQ33_COL <- px2col(NQQ33)
NQQ33_TS  <- px2ts(NQQ33)
```

The third example demonstrates how to turn off metadata printing on screen.

```r
# Example 3
NQQ33 <- getStatBankData("NQQ33",metadata=FALSE)

```

The fourth example demonstrates how to download the data in JSON-stat format. 

```r
# Example 4
NQQ33_JSTAT <- getStatBankData("NQQ33",type="jstat")
```

The next example demonstrates how to down the data as a dataframe.

```r
# Example 5
NQQ33_DF <- getStatBankData("NQQ33",type="df")
```

Feedback, Bugs, Suggestions
-----------

Please contact me at <graeme.walsh@centralbank.ie> or <graeme.walsh@hotmail.co.uk>


News (2020 - December)
-----------
The latest version of the package was published on the same day that PxStat replaced StatBank. The package has been simplified thanks to the new structure of the CSO website. I've updated the package such that it works in the same way as before and therefore should prevent any existing code to break.
