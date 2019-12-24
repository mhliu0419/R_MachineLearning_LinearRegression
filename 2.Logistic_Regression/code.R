# Logistic Regression Project



# Get the Data

adult <- read.csv('/Users/AncelotLiu/Desktop/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training\ Exercises/Machine\ Learning\ Projects/CSV\ files\ for\ ML\ Projects/adult_sal.csv')

head(adult)

library(dplyr)
adult <- select(adult, -X)

head(adult)
str(adult)
summary(adult)



# Data Cleaning


table(adult$type_employer)

# Combine Never-worked and Without-pay into a single group called "Unemployed"

adult$type_employer <- sapply(adult$type_employer, as.character)

typeof(adult$type_employer)

length(adult$type_employer)

for (i in 1:32561) {
  
  
  if (adult$type_employer[i] == 'Never-worked' | adult$type_employer[i] == 'Without-pay') {
    
    adult$type_employer[i] <- 'Unemployed'
    
  }
  
  
}


# Combine State and Local gov jobs into a category called SL-gov

for (i in 1:32561) {
  
  
  if (adult$type_employer[i] == 'State-gov' | adult$type_employer[i] == 'Local-gov') {
    
    adult$type_employer[i] <- 'SL-gov'
    
  }
  
  
}

# Combine self-employed jobs into a category called self-emp.


for (i in 1:32561) {
  
  
  if (adult$type_employer[i] == 'Self-emp-inc' | adult$type_employer[i] == 'Self-emp-not-inc') {
    
    adult$type_employer[i] <- 'SL-gov'
    
  }
  
  
}



# Martial

table(adult$marital)

# Reduce this to three groups:
# 1.Married
# 2.Not-Married
# 3.Never-Married



group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}

adult$marital <- sapply(adult$marital,group_marital)

table(adult$marital)
