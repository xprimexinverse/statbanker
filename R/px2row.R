px2row <- function(px){
  if(!is(px,"px")) stop("Input data is not a px object.")
  data     <- as.data.frame(px)
  col.data <- rename(data, c("dat"="value"))
  string   <- names(col.data)
  remove   <- c ("Year", "Quarter", "Month", "value","CensusYear","HalfYear")
  z        <- string [! string %in% remove]
  rowized  <- cast(col.data, formula=paste(paste(z, collapse= " + ")," ~ ... "))
  return(rowized)
}
