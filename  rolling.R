d1 <- 1:10
d2 <- 1:20
prob1 <- c(1/10 , 1/10 , 1/10 , 1/10 , 1/10 , 1/10 , 1/10 , 1/10 , 1/10 , 1/10)
prob2 <- c(1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20 , 1/20)

#Function for 10 sided dice#
  roll1 <- function(n){
    sample(d1 , 3 , replace = TRUE , prob = prob1)
  }  
  roll1 = roll1(3)
#Function for 20 sided dice#
  roll2 <- function(n){
    sample(d2 , 3 , replace = TRUE , prob = prob2)
  }  
  roll2 = roll2(3)
#Function for both 10 sided and 20 sided dice#  
  bothdice <- function(n){
    roll3 = c(roll2 , roll1)
}
bothdice = bothdice(3)
sum_of_both_dice = sum(bothdice)
#To find more than 6 in 10 sided dice#
s1 <- sample(roll1 , 3 , replace = FALSE)
s1 > 6 & s1 < 11
sum(s1 > 6 & s1 < 11)

more_than_6_in_d1 <- sum(s1 > 6 & s1 < 11)
#To find more than 16 in 20 sided dice#
s2 <- sample(roll2 , 3 , replace = FALSE)
s2 > 16 & s2 < 21
sum(s2 > 16 & s2 < 21)

more_than_16_in_d2 <- sum(s2 > 16 & s2 < 21)
