# Napa Wine inc 
# Build a decision model
# Mr. Johnson the winemaker at Napa Wine believes that a storm is coming
# and he needs to decide whether or not to harvest the grapes today 
# or wait until after the storm. 

week <- c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
prob_of_storm <- c(0.2,0.4,0.7,0.8)

decision <- c("No storm" , "Storm")

library(tidyverse)
library(readr)
library(dplyr)
library(party)
library(rpart)
library(rpart.plot)
library(ROCR)

harvest_or_not <- function(){
  today <- sample(week , 1)
  if("Sunday" %in% today){
    sunday <-sample(prob_of_storm , 1)
    if(sunday < 0.5){
      print("Sunday")
      print(decision[1])
    } else { 
      print("Sunday")
      print(decision[2])}
  } 
  
  else if("Monday" %in% today){
    monday <-sample(prob_of_storm , 1)
    if(monday < 0.5){
      print("Monday")
      print(decision[1])
    } else { 
      print("Monday")
      print(decision[2])}
  }
  
  else if("Tuesday" %in% today){
    tuesday <-sample(prob_of_storm , 1)
    if(tuesday < 0.5){
      print("Tuesday")
      print(decision[1])
    } else { 
      print("Tuesday")
      print(decision[2])}
  }
  
  else if("Wednesday" %in% today){
    wednesday <-sample(prob_of_storm , 1)
    if(wednesday < 0.5){
      print("Wednesday")
      print(decision[1])
    } else { 
      print("Wednesday")
      print(decision[2])}
  }
  
  else if("Thursday" %in% today){
    thursday <-sample(prob_of_storm , 1)
    if(thursday < 0.5){
      print("Thursday")
      print(decision[1])
    } else { 
      print("Thursday")
      print(decision[2])}
  }
  
  else if("Friday" %in% today){
    friday <-sample(prob_of_storm , 1)
    if(friday < 0.5){
      print("Friday")
      print(decision[1])
    } else { 
      print("Friday")
      print(decision[2])}
  }
  
  else if("Saturday" %in% today){
    saturday <-sample(prob_of_storm , 1)
    if(saturday < 0.5){
      print("Saturday")
      print(decision[1])
    } else { 
      print("Saturday")
      print(decision[2])}
  }
}

harvest_or_not()
  
