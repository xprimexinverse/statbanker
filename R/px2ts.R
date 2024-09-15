#' Convert px Object to ts (or mts) Object
#'
#' @param px A px object (from pxR package)
#'
#' @return A ts (or mts) object
#' @export
#'
#' @examples
px2ts <- function(px){
  if(!is(px,"px")) stop("Input data is not a px object.")
  data  <- px2col(px)
  start <- as.character(data[1,1])
  end   <- as.character(data[nrow(data),1])
  if(grepl("Q|M|H",start)){
    freq <- substr(start,5,5)
    if(freq=="M"){
      frequency <- 12
    } else if(freq=="Q"){
      frequency <- 4
    } else if(freq=="H"){
      frequency <- 2
    }
    end_year   <- as.numeric(substr(end,1,4))
    end_period <- as.numeric(substr(end,6,8)); end_period <- as.numeric(gsub("^0","",end_period))
    data       <- ts(data, end=c(end_year,end_period), frequency=frequency)
  } else {
    frequency <- 1
    end_year  <- as.numeric(substr(end,1,4))
    data      <- ts(data, end=c(end_year), frequency=frequency)
  }
  return(data)
}

