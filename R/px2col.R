#' Convert px Object to Column-Orientated Dataframe
#'
#' @param px A px object (from pxR package)
#'
#' @return A data.frame
#' @export
#'
#' @examples
px2col <- function(px){
  if(!methods::is(px,"px")) stop("Input data is not a px object.")
  data       <- as.data.frame(px)
  col.data   <- plyr::rename(data, c("dat"="value"))
  string     <- names(data)
  remove     <- c("Year", "Quarter", "Month", "value","CensusYear","HalfYear")
  z          <- string[! string %in% remove]
  columnized <- reshape2::cast(data, formula=paste("... ~ ", paste(z, collapse= " + ")))
  return(columnized)
}
