# Casino of only one game which is slot machine #
# Rules of the game # 
# To start the game the player pay $50 # 
# If AA the player prize will be $200#
# If BB the player prize will be $100#
# Other the player will loses his money #

p <- 0
casino_profet <- (p)
c <- 0
# Number of games #
num_games <- 1000
# Start the simulation #
repeat {

  wheel <- c("AA" , "AB" , "BA" , "BB")
slot <- sample(wheel, size = 1, replace = TRUE, prob = c(0.10 , 0.40 , 0.40 , 0.10))

if("AA" %in% slot){
  casino_profet <- casino_profet + (-200)
  
}else if ("BB" %in% slot ){
  casino_profet <- casino_profet + (-100)
  
}else {
  casino_profet <- casino_profet + (50)
  
}
  c <- c + 1
  if (c == num_games){
    break
  }
}

# printing the casino profet after the number of games #  
print(casino_profet)
