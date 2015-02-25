rankhospital <- function(state, outcome, num = "best"){
  source("utilities.R")
  ## Read outcome data
    hospitalData = read.csv("hospital-data.csv")
    outcomeData = read.csv("outcome-of-care-measures.csv")}

  ## Check that state and outcome are valid
    checkState(state, hospitalData)
    checkOutcome(outcome) 
  
  ##Return hospital name in that state with te given rank 30-day death rate
  
}