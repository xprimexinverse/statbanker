\name{statbanker-package}
\alias{statbanker-package}
\alias{statbanker}
\docType{package}
\title{Download Data From CSO PxStat}
\description{
  The package can be used to download data from CSO PxStat.

}
\details{
\tabular{ll}{
Package: \tab statbanker\cr
Type: \tab Package\cr
Version: \tab 7.0.0\cr
Date: \tab 2020-12-01\cr
License: \tab GPL-3\cr
}
The most important function in the package is \code{getStatBankData}.
}
\author{
Graeme Walsh

Maintainer: Graeme Walsh <graeme.walsh@centralbank.ie>
}
\references{
\url{https://data.cso.ie/}
}
\keyword{ package }
\seealso{
  \code{\link{getStatBankData}}
}
\examples{
## Download Quarterly National Accounts (QNA) data
\dontrun{NQQ38 <- getStatBankData("NQQ38")}
## Download ESB Connections data
\dontrun{HSM01 <- getStatBankData("HSM01")}
}
