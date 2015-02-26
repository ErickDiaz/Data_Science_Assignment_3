rankhospital <- function(state, outcome, num = "best"){
  source("utilities.R")
  ##Read outcome data
    hospitalData = read.csv("hospital-data.csv")
    outcomeData = read.csv("outcome-of-care-measures.csv")

  ##Check that state and outcome are valid
    checkState(state, hospitalData)
    checkOutcome(outcome) 
  
  ##Return hospital name in that state with te given rank 30-day death rate
    hospitales <- getHostipalByState(state, outcomeData) 

    index <- getIndexTable(outcome) 
    raw <- as.numeric(as.character(hospitales[,index]))
    orderValues <- unique(sort(raw, decreasing = FALSE))
    print(orderValues) ##DEBUG
    value <- orderValues[ valNum(num,orderValues) ] 
  
    if( !is.na( value ) ){
      print(value)##DEBUG
      raw <- as.numeric(as.character(hospitales[,index]))      
      ##values <- raw[!is.na(raw)]
      resp <- as.character( hospitales[c(which(raw==value)), 2] )
      order <- sort(resp, decreasing = FALSE)
      print(order)

      
    }else{
      NA
    }
      
  
}

valNum <- function(num, orderValues){
  
  if( is.character(num) ){
    if( num == "worst" ) num <- length(orderValues)
    else num <- 1  
  }
  num
}
