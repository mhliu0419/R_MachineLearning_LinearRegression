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

adult$type_employer <- sapply(adult$type_employer, as.character)

typeof(adult$type_employer)

length(adult$type_employer)

for (i in 1:32561) {
  
  
  if (adult$type_employer[i] == 'Never-worked' | adult$type_employer[i] == 'Without-pay') {
    
    adult$type_employer[i] <- 'Unemployed'
    
  }
  
  
}






