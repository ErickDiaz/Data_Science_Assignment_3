best <- function(state = "", outcome = "") {
  source("utilities.R")
  ## Read outcome data
    hospitalData = read.csv("hospital-data.csv")
    outcomeData = read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
    checkState(state, hospitalData)
    checkOutcome(outcome) 
  
  ##Return hospital name in that state with lowest 30-day death rate
    ##obteniendo los hospitales por estado
    hospitales <- getHostipalByState(state, outcomeData)
    min <-getMinOutcome(outcome,hospitales)
    resp <- getHospitalByMin(outcome,min, hospitales)
    ##print(resp[1])
    as.character(resp[1])
  
}


getMinOutcome <- function(outcome, hospitales){  
   index <- getIndexTable(outcome)
   raw <- as.numeric(as.character(hospitales[,index]))
   values <- raw[!is.na(raw)]
   min(values)
}

getHospitalByMin <- function(outcome,value, hospitales){
  index <- getIndexTable(outcome)
  ##hospitales[,index] == value
  raw <- as.numeric(as.character(hospitales[,index]))
  
  hospitales[c(which(raw==value)),2]
}
