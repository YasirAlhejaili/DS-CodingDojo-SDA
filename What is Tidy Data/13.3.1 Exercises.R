# 13.3.1 Exercises

# Q1 : Add a surrogate key to flights
# Ans 1 : 
flights %>% 
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  mutate(flight_id = row_number()) %>%
  glimpse()

# Q2 : Identify the keys in the following datasets
# Lahman::Batting
# babynames::babynames
# nasaweather::atmos
# fueleconomy::vehicles
# ggplot2::diamonds
# Ans 2 : 
Lahman::Batting %>%
  group_by(playerID, yearID) %>%
  filter(n() > 1) 
# since there are multiple records above, we need to add one more variable to make n() >1 return no records
Lahman::Batting %>%
  group_by(playerID, yearID, stint) %>%
  filter(n() > 1)


