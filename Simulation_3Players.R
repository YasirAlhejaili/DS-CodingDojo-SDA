winnings <- vector("integer" , 10000)
Acc_winnings <- vector("integer" , 10000)
#Rules#
# Player bets $1 , if player wins he gets his money back plus $1 #
# If player loses he loses $1 #
# If a tie happens , player recovers his money #
# Chance of player winning is 0.4722 , chance of tie is 0.0348 # 
# Chance of dealer winning is 0.493 #
# One hand of play # 
numplayers <- 6 
for (i in 1:length(winnings)){

onehand <- sample(c("D" , "P" , "T"), numplayers, prob = c(0.493 , 0.4722 , 0.0348), replace = TRUE)
winnings [i] <- length(onehand[onehand == "P"])*-1 + length(onehand[onehand == "D"])

if(i!=1){
  Acc_winnings [i] <- Acc_winnings[i-1] + winnings[i]
} else {
  Acc_winnings[i] <- winnings[i]
}
}

print(Acc_winnings[10000])
print(sum(winnings))

# Plots #

plot(Acc_winnings)
plot(winnings)
hist(Acc_winnings , col = "Blue")
hist(winnings , col = "Blue")

