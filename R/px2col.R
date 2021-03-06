px2col <- function(px){
  if(!is(px,"px")) stop("Input data is not a px object.")
  data       <- as.data.frame(px)
  col.data   <- rename(data, c("dat"="value"))
  string     <- names(data)
  remove     <- c ("Year", "Quarter", "Month", "value","CensusYear","HalfYear")
  z          <- string [! string %in% remove]
  columnized <- cast(data, formula=paste("... ~ ", paste(z, collapse= " + ")))
  return(columnized)
}
