install.packages("expm")
library(expm)

# The digram add in codingdojo learning platform in homework 13 section as a picture
# They should change the order rules so probs be like the digram
T <- matrix(c(0.8,0.2,0,0,0.6,0.2,0.2,0,0.05,0.1,0.65,0.2,0.2, 0.4,0.2,0.2), nrow = 4, byrow = TRUE)
colnames(T) = c("0 Kegs","1 Kegs","2 Kegs","3 Kegs")
rownames(T) = c("0 Kegs","1 Kegs","2 Kegs","3 Kegs")

T

T%^%2

T%^%5

# The steady-state

T%^%20


