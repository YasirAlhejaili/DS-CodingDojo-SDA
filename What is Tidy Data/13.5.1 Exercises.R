# 13.5.1 Exercises

# Q1 : What does it mean for a flight to have a missing tailnum?
# What do the tail numbers that don’t have a matching record in planes have in common?
# Ans 1 : 
flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(carrier, sort = TRUE)

# Q2 : Filter flights to only show flights with planes that have flown at least 100 flights
# Ans : 
planes_gt100 <- 
  filter(flights) %>%
  group_by(tailnum) %>%
  count() %>%
  filter(n > 100)
flights %>%
  semi_join(planes_gt100, by = "tailnum")

