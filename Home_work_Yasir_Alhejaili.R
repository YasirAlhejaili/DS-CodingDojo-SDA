# Assign deck to Blackjack dataframe
blackjack1 <- deck

# Assign facecards the value of 10
facecard<-c("king","queen","jack")
blackjack1$value[blackjack1$face %in% facecard]
blackjack1[blackjack1$face %in% facecard,]
blackjack1$value[blackjack1$face %in% facecard]<-10

#Assign aces the value of NA
blackjack1$value[blackjack1$face == "ace"]<-NA

# Assign blackjack1 to blackjack2 dataframe
blackjack2 <- blackjack1
View(blackjack2)

# shuffling function for blackjack #
blackjack2_shuffle <- function(){
  blackjack2[sample(nrow(blackjack2 )) , ]
}
bj_deck <- blackjack2_shuffle()
print(bj_deck)

#Deal two players & dealer from blackjack deck.
deal_jacks<- function() {
  blackjack2<- blackjack2_shuffle()
  j_player1<- head(blackjack2, 2)
  j_player1$player <- c("Player1")
  j_player2<- tail(blackjack2, 2)
  j_player2$player <- c("Player2")
  dealer<- blackjack2[c(10:11),1:3]
  dealer$player <- c("dealer")
  print("----Blackjack player1----")
  print(j_player1)
  print("----Blackjack player2----")
  print(j_player2)
  print("----Blackjack dealer----")
  print(dealer)
  hands <- rbind(j_player1 ,j_player2 , dealer)
}
print(deal_jacks())

# Assign deal_jacks() to hands as dataframe 
hands <- data.frame(deal_jacks())
View(hands)

# Taking Player1 from hands as an analyezed hand #
if (sum(hands$player == "Player1")>0) {
  analyhand_p1 <- hands[hands$player == "Player1" ,]
}
data.frame(analyhand_p1)
View(analyhand_p1)

# Taking Player2 from hands as an analyezed hand #
if (sum(hands$player == "Player2")>0) {
  analyhand_p2 <- hands[hands$player == "Player2" ,]
}
data.frame(analyhand_p2)
View(analyhand_p2)

# Taking dealer from hands as an analyezed hand #
if (sum(hands$player == "dealer")>0) {
  analyhand_dealer <- hands[hands$player == "dealer" ,]
}
data.frame(analyhand_dealer)
View(analyhand_dealer)

# if player 1 have ace #


p1_ace <- function(){ if (sum(analyhand_p1$face == "ace")>0){
  if (sum(analyhand_p1$value,na.rm = TRUE) > 10){
    score <- sum(analyhand_p1$value,na.rm = TRUE) + 1
    print("ace = 1")
  } else {
    score <- sum(analyhand_p1$value,na.rm = TRUE) + 11
    print("ace = 1")
  }
}else {
  score <- sum(analyhand_p1$value,na.rm = TRUE)  
  print("No ace")
}
  
  print(score)
}
p1_ace()

# if player 2 have ace #


p2_ace <- function(){ if (sum(analyhand_p2$face == "ace")>0){
  if (sum(analyhand_p2$value,na.rm = TRUE) > 10){
    score <- sum(analyhand_p2$value,na.rm = TRUE) + 1
    print("ace = 1")
  } else {
    score <- sum(analyhand_p2$value,na.rm = TRUE) + 11
    print("ace = 11")
  }
}else {
  score <- sum(analyhand_p2$value,na.rm = TRUE)  
  print("No ace")
}
  
  print(score)
}
p2_ace()

# if the dealer have ace #

dealer_ace <- function(){ if (sum(analyhand_dealer$face == "ace")>0){
  if (sum(analyhand_dealer$value,na.rm = TRUE) > 10){
    score <- sum(analyhand_dealer$value,na.rm = TRUE) + 1 
    print("ace = 1")
  } else {
    score <- sum(analyhand_dealer$value,na.rm = TRUE) + 11
    print("ace = 11")
  }
}else {
  score <- sum(analyhand_dealer$value,na.rm = TRUE)
  print("No ace")
}
  
  print(score)
}
dealer_ace()

#########################################################
# Not shure if the code below is right or not but i try #
#########################################################

# Dealer strategy #

score <- dealer_ace()
while(d_score() < 17){
  newcard <- hands[hands$player == "dealer" ,]
  newcard$player <- "dealer"
  analyhand_dealer <- rbind(analyhand_dealer , newcard)
  score <- dealer_ace()
}
print(score)

# Player 1 strategy #

score <- p1_ace()
while(p1_ace() < 17){
  newcard <- hands[hands$player == "player1" ,]
  newcard$player <- "player1"
  analyhand_p1 <- rbind(analyhand_p1 , newcard)
  score <- p1_ace()
}
print(score)

# Player 1 strategy #

score <- p2_ace()
while(p2_ace() < 17){
  newcard <- hands[hands$player == "player2" ,]
  newcard$player <- "player2"
  analyhand_p2 <- rbind(analyhand_p2 , newcard)
  score <- p1_ace()
}
print(score)