# 12.6.1 Exercises
# Q1 : What’s the difference between an NA and zero?
# Ans 1 : NA mean that no value added , zero mean the value zero

# Q2 : What happens if you neglect the mutate() step? 
# Ans 2 : mutate() adds new variables and preserves existing ones

# Q3 : Make an informative visualisation of the data 
# Ans 3 : 
ggplot(who6, aes(year, country , sex)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

