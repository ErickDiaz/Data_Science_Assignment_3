##Valida el parametro state de la funcion best
checkState <- function(state, hospitalData){
  states <- getStates(hospitalData)
  state %in% states
}

##Valida el parametro outcome de la funcion best
checkOutcome <- function(outcome){
  validOutcome <- c("heart failure", "heart attack", "pneumonia")
  outcome %in% validOutcome
}

## Retorna los estados
getStates <- function(rawData){
  unique(rawData[,7])
}