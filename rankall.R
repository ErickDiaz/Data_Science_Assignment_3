rankall <- function(outcome, num = "best"){
  ##Read outcome data
  hospitalData = read.csv("hospital-data.csv")
  outcomeData = read.csv("outcome-of-care-measures.csv")
  
  ##Check that state and outcome are valid
  checkOutcome(outcome) 
  
  ##For each state, find the hospital of the giben rank

  
  index <- getIndexTableP2(outcome) 
  states <- sort( getStates(hospitalData), decreasing = FALSE )
 
    for(state in states){
        hospitales <- getHostipalByState(state, outcomeData) 
        raw <- as.numeric(as.character(hospitales[,index]))
        ##print(raw)
        
        if( is.character(num) ){
           if( num == "worst" ){
             temp <- sort( raw[!is.na(raw)] , decreasing = TRUE )
           }else{
             temp <- sort( raw[!is.na(raw)] , decreasing = FALSE )
           }   
           searchVal <- temp[1]
        }else{
            temp <- sort( raw[!is.na(raw)] , decreasing = FALSE )
            searchVal <- temp[num]    
        }  
        
        
        ##print(state)
        
        if( is.na(searchVal)){
          resp <- data.frame ( NA, state)
        }else{
          ##print(searchVal)
          raw <- as.numeric(as.character(hospitales[,index]))      
          ##values <- raw[!is.na(raw)]
          resChar <- as.character( hospitales[c(which(raw==searchVal)), 2] )
        
          order <- sort(resChar, decreasing = FALSE)
        
          resp <- data.frame ( order[1], state)
        }
        
        colnames(resp) <- c("hospital","state")
        rownames(resp) <- state
        
        if (!exists("df_result")){                  
          df_result <- resp
        }else{
          df_result <- rbind( df_result, resp )
        }   
      
    }
    
   df_result

  
  ##Return a data frame with the hospital names and the abbreviated state name
}