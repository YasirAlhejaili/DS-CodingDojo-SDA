# 13.4.6 Exercises

# Q1 : Compute the average delay by destination, then join on the airports
# Ans : 
View(flights)
airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon,lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

avg_dest_delays <-  flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  inner_join(airports, by = c(dest = "faa"))

avg_dest_delays %>%
  ggplot(aes(lon,lat, colour = delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

# Q2 : Add location of the origin and destination to flights
# Ans : 
flights %>%
  left_join(airports, by = c(dest = "faa")) %>%
  left_join(airports, by = c(origin = "faa")) %>%
  head()

# Q3 : What weather conditions make it more likely to see a delay?
# Ans 3 : 
plane_ages <- 
  planes %>%
  mutate(age = 2013 - year) %>%
  select(tailnum,age)

flights %>%
  inner_join(plane_ages, by ="tailnum") %>%
  group_by(age) %>%
  filter(!is.na(dep_delay)) %>%
  summarise(delay = mean(dep_delay)) %>%
  ggplot(aes(x =age, y =delay)) + 
  geom_point()+
  geom_line()
