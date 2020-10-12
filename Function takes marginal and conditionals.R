
# Write a function that takes marginals and conditionals as inputs and calculates the all the conditionals, marginals and joints

# f = get flu , not_f = did't get flu 
# t = tested flu , not_t = not tested

f <- "Flu" 
not_f <- "Not Flu" 
t <- "Tested"
not_t <- "Not Tested"

human <- c(f , not_f)
test <- c(t , not_t)

#pa <- sample(human , 1 , prob = c(0.8 , 0.2))
#ts <- sample(test , 1  ,prob = c(0.9 , 0.1))


f_or_not <- function(){
  pa <- sample(human , 1 , prob = c(0.8 , 0.2))
  ts <- sample(test , 1 , prob = c(0.9 , 0.1))
  if("Flu" %in% pa){
    if("Tested" %in% ts){
      print("Flu Tested")
      print("t ∩ f =")
      print(0.8*0.9)
    }else if("Not Tested" %in% ts){
      print("Flu Not Tested")
      print("t' ∩ f =")
      print(0.8*0.1)
    }
  }else if("Not Flu" %in% pa){
    if("Tested" %in% ts){
      print("Flu Tested")
      print("t ∩ f' =")
      print(0.2*0.1)
    }else if("Not Tested" %in% ts){
      print("Flu Not Tested")
      print("t' ∩ f' =")
      print(0.2*0.9)
    }
  }
}

f_or_not()

