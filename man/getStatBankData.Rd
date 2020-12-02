\name{getStatBankData}
\alias{getStatBankData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download Data From CSO PxStat
}
\description{
This function can be used to download data from CSO PxStat.
}
\usage{
getStatBankData(table, metadata = TRUE, type = "px")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{table}{
A character string naming the StatBank table to be downloaded.
}
  \item{metadata}{
If TRUE, metadata is displayed.
}
  \item{type}{
A character string specifiying the type of data to be returned.
}
}
\details{
The function \code{getStatBankData} can be used to download a table from CSO PxStat.

The function parses PC-AXIS files located on CSO PxStat unless \code{type="jstat"}, in which case the function parses JSON-stat files from the Statbank API.
}
\value{
An object of the class \code{px}, which is essentially a list comprising the fields of a PC-AXIS file (see pxR package for more details). A \code{list} is returned if \code{type="jstat"}.
}
\references{
\href{https://data.cso.ie/}{CSO PxStat}
\href{http://www.cso.ie/webserviceclient/Default.aspx}{Statbank API}
}
\author{
Graeme Walsh
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
