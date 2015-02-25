best <- function(state, outcome) {
  ## Read outcome data
  hospitalData = read.csv("hospital-data.csv")
  outcomeData = read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  if( !checkState(state, hospitalData) ){
    stop("invalid state")
  }
  if( !checkOutcome(outcome) ){
    stop("invalid outcome")
  }
  
  print("all pass")
  ##Return hospital name in that state with lowest 30-day death rate
  
}

checkState <- function(state, hospitalData){
  states <- getStates(hospitalData)
  state %in% states
}

checkOutcome <- function(outcome){
  validOutcome <- c("heart failure", "heart attack", "pneumonia")
  outcome %in% validOutcome
}

getStates <- function(rawData){
  unique(rawData[,7])
}

getHostipalByState <- function(state, hospitalData){
  
}



