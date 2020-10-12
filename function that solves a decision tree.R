# If the coach wants to pick a penalty kick taker in the last penalty kick of the game
# And the coach evaluation is depending on his pick
# The coach evaluation is now = 100 point 
# Who should he pick ?
# Usually
# Attacker score 4 and miss 1 of 5 penalty kicks
# Defender score 3 and miss 2 of 5 penalty kicks
# Goal Keeper score 1 and miss 4 of 5 penalty kicks
# If Attacker score the coach evaluation = -0 "Do not change"
# If Attacker miss the coach evaluation = -30
# If Defender score the coach evaluation = -20
# If Defender miss the coach evaluation = -60
# If Goal keeper score the coach evaluation = -50
# If Goal keeper miss the coach evaluation = -90

# Player score or miss
ap <- c("Score" , "Miss")
dp <- c("Score" , "Miss")
gkp <- c("Score" , "Miss")

# coach evaluation
as <- 100
am <- 70 
ds <- 80 
dm <- 40
gks <- 50
gkm <- 10

# function that solves a decision tree
coach_decision_solve <- function(){
  coach_decision <- c(as , am , ds , dm , gks , gkm)
  best <- max(coach_decision)
  if(as == best){
    print("Best decision is attacker that score the penalty kick")
  } else if (am == best) {
    print("Best decision is attacker that miss the penalty kick")
  }else if (ds == best){
    print("Best decision is defender that score the penalty kick")
  }else if (dm == best){
    print("Best decision is defender that miss the penalty kick")
  }else if (gks == best){
    print("Best decision is goal keeper that score the penalty kick")
  }else if (gkm == best){
    print("Best decision is goal keeper that miss the penalty kick")
  }
}

coach_decision_solve()

# Function simulate the pick of the coach
coach_pick <- function(){
  p_of_player <- c("ap" , "dp" , "gkp")
  the_player <- sample(p_of_player , 1)
  
  if("ap" %in% the_player){
    ap_s <- sample(ap ,1 , prob = c(0.8 , 0.2))
    if("Score" %in% ap_s){
      print("Attacker Score")
      print("Coach evaluation 100")}
    else{
      print("Attacker Miss")
      print("Coach evaluation 70")
    }
  }else if("dp" %in% the_player){
    dp_s <- sample(dp ,1 , prob = c(0.6 , 0.4))
    if("Score" %in% dp_s){
      print("Defender Score")
      print("Coach evaluation 80")
    }else{
      print("Defender Miss")
      print("Coach evaluation 40")
    }}else if("gkp" %in% the_player){
      gkp_s <- sample(gkp ,1 , prob = c(0.2 , 0.8))
      if("Score" %in% gkp_s){
        print("Goal Keeper Score")
        print("Coach evaluation 50")
      }else{
        print("Goal Keeper Miss")
        print("Coach evaluation 10")
      }
    }
}

coach_pick()

