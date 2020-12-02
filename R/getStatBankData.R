getStatBankData <- function(table,metadata=TRUE,type="px"){

  # Check the user inputs

  if(!is.character(table)) stop("The table name was not entered as a string.")
  if(!is.logical(metadata)) stop("The metadata argument was not entered as a logical. Please use TRUE or FALSE.")
  if(!(type %in% c("px","df","col","row","ts","jstat"))) stop("The type was not found. Please use \"px\", \"df\",\"col\", \"row\", \"ts\", or \"jstat\".")
  if((table %in% c(paste0("NAH0",1:9),paste0("NAH",10:30)))) stop("Historical National Accounts are lazy loaded by the statbanker package.")

  # Download the data

  if(type=="jstat"){
    data     <- fromJSON(file=paste0("http://www.cso.ie/StatbankServices/StatbankServices.svc/jsonservice/responseinstance/",table))
    metadata <- FALSE # I'll switch this back on at a later stage
  }else{
    #data <- pxR::read.px(px_files_urls[grep(table,px_files_urls)]) # May need to add an encoding option here
    data <- pxR::read.px(paste0("https://ws.cso.ie/public/api.restful/PxStat.Data.Cube_API.ReadDataset/",table,"/PX/2013/"))
  }

  # Print metadata

  if(isTRUE(metadata)){

      MATRIX        <- data$MATRIX$value
      TITLE         <- data$TITLE$value
      UNITS         <- data$UNITS$value
      SOURCE        <- data$SOURCE$value
      DATABASE      <- data$DATABASE$value
      CREATION.DATE <- data$CREATION.DATE$value
      LAST.UPDATED  <- as.character(data$LAST.UPDATED[1])

      cat("*** METADATA ***\n")
      cat("CSO Table = ", MATRIX,"\n")
      cat("TITLE = ", TITLE,"\n")
      cat("UNITS = ", UNITS,"\n")
      cat("SOURCE = ", SOURCE,"\n")
      cat("DATABASE = ", DATABASE,"\n")
      cat("CREATION DATE = ", CREATION.DATE,"\n")
      cat("LAST UPDATED = ", LAST.UPDATED,"\n")
      cat("FILE ADDRESS = ", paste0("https://ws.cso.ie/public/api.restful/PxStat.Data.Cube_API.ReadDataset/",table,"/PX/2013/"),"\n")
  }

  # Convert the data if necessary

  if(type=="col"){
    data <- px2col(data)
  }else if(type=="row"){
    data <- px2row(data)
  }else if(type=="ts"){
    data <- px2ts(data)
  }else if(type=="df"){
    data <- as.data.frame(data)
  }

  return(data)
}
