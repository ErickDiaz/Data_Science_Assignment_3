##Valida el parametro state de la funcion best
checkState <- function(state, hospitalData){
  states <- getStates(hospitalData)
  if( !(state %in% states) ) stop("invalid state")
}

##Valida el parametro outcome de la funcion best
checkOutcome <- function(outcome){
  validOutcome <- c("heart failure", "heart attack", "pneumonia")
  if( !(outcome %in% validOutcome) ) stop("invalid outcome")
}

## Retorna el numero de columna para el outcome
getIndexTable <- function(outcome){
  v <- c(19,13,25)
  names(v) <- c("heart failure", "heart attack", "pneumonia")   
  v[outcome]
}

getIndexTableP2 <- function(outcome){
  v <- c(17,13,23)
  names(v) <- c("heart failure", "heart attack", "pneumonia")   
  v[outcome]
}

## Retorna los estados
getStates <- function(rawData){
  unique(rawData[,7])
}

##Retorna los hospitalas de un estado
getHostipalByState <- function(state, hospitalData){
  subset( hospitalData,State == state )
}