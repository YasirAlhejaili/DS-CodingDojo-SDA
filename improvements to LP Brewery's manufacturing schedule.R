install.packages("lpSolve")
library(lpSolve)

# Assume full-time work is 10 hr
# Each keg for Hopatronic -------> 5 hr
# Each keg for All American -----> 10 hr
# Each keg for Dantzig ----------> 20 hr
# Assume the working days for a month is 20 
# For Hopatronic , Ecah month the labor produce 40 keg/month
# For All American , Ecah month the labor produce 20 keg/month
# For Dantzig , Ecah month the labor produce 10 keg/month
# If we make the employees 10 insted of 5 and working in 2 shifts will double the kegs
# For Hopatronic , Ecah month the labor produce 80 keg/month
# For All American , Ecah month the labor produce 40 keg/month
# For Dantzig , Ecah month the labor produce 20 keg/month
f.obj <- matrix(c(13,
           23,
           30))

f.con <- matrix(c(5,4,35,
                  15,4,20,
                  10,4,15), nrow = 3, byrow = TRUE)

f.dir <- c("<=",
           "<=",
           "<=")

f.rhs <- c(80,     
           40,     
           20)

sol<-lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
sol$objval
sol$solution
sol$duals
