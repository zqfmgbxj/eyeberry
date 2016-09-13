titanic <- read.csv("titanic3.csv")

str(titanic)

#1: Port of embarkation
#Find the missing values and replace them with S. 
titanic$embarked <- sub("^$", "S", titanic$embarked)

#2: Age
  #1. Calculate the mean of the Age column and use that value to populate the missing values
mean_age <- mean(titanic$age, na.rm = TRUE)
titanic$age[is.na(titanic$age)] <- mean_age
titanic$age


