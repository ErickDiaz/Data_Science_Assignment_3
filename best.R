best <- function(state = "", outcome = "") {
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
  
  ##Return hospital name in that state with lowest 30-day death rate
    ##obteniendo los hospitales por estado
    hospitales <- getHostipalByState(state, outcomeData)
    min <-getMinOutcome(outcome,hospitales)
    resp <- getHospitalByMin(outcome,min, hospitales)
    ##print(resp[1])
    as.character(resp)
  
}

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

getHostipalByState <- function(state, hospitalData){
  subset( hospitalData,State == state )
}

getIndexTable <- function(outcome){
  v <- c(19,13,25)
  names(v) <- c("heart failure", "heart attack", "pneumonia")   
  v[outcome]
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
