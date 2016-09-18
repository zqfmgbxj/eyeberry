library(dplyr)

titanic <- read.csv("titanic3.csv")

str(titanic)

#1: Port of embarkation
#Find the missing values and replace them with S. 
titanic$embarked <- sub("^$", "S", titanic$embarked)

#2: Age
  #1. Calculate the mean of the Age column and use that value to populate the missing values
mean_age <- mean(titanic$age, na.rm = TRUE)
titanic$age[is.na(titanic$age)] <- mean_age

#3 Fill boat empty slots with a dummy value e.g. the string 'None' or 'NA'.
titanic$boat <- sub("^$", NA, titanic$boat)

#4: Cabin - Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise.
titanic$cabin <- sub("^$", NA, titanic$cabin)
titanic <- mutate(titanic, has_cabin_number = ifelse(is.na(titanic$cabin),0,1))

write.csv(titanic, "titanic_clean.csv")
