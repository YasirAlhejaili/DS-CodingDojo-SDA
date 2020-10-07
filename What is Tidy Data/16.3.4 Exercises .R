# 16.3.4 Exercises 

library(tidyverse)
library(lubridate)
library(nycflights13)
library(ggplot2)
# Q1 : How does the distribution of flight times within a day change over the course of the year?

# Ans 1 : 
flights_dt %>%
  filter(!is.na(dep_time)) %>%
  mutate(dep_hour = update(dep_time, yday = 1)) %>%
  mutate(month = factor(month(dep_time))) %>%
  ggplot(aes(dep_hour, color = month)) +
  geom_freqpoly(binwidth = 60 * 60)

# Q2 : Compare dep_time, sched_dep_time and dep_delay. Are they consistent? Explain your findings

# Ans 2 : 
flights_dt %>%
  mutate(dep_time_ = sched_dep_time + dep_delay * 60) %>%
  filter(dep_time_ != dep_time) %>%
  select(dep_time_, dep_time, sched_dep_time, dep_delay)

# they are not consistent

# Q3 : Compare air_time with the duration between the departure and arrival. Explain your findings

# Ans 3 : 
flights_dt %>%
  mutate(
    flight_duration = as.numeric(arr_time - dep_time),
    air_time_mins = air_time,
    diff = flight_duration - air_time_mins
  ) %>%
  select(origin, dest, flight_duration, air_time_mins, diff)

# Q4 : How does the average delay time change over the course of a day? Should you use dep_time or sched_dep_time? Why?

# Ans 4 : 
flights_dt %>%
  mutate(sched_dep_hour = hour(sched_dep_time)) %>%
  group_by(sched_dep_hour) %>%
  summarise(dep_delay = mean(dep_delay)) %>%
  ggplot(aes(y = dep_delay, x = sched_dep_hour)) +
  geom_point() +
  geom_smooth()
# sched_dep_time because that is the relevant metric for someone scheduling a flight
# dep_time will always bias delays to later in the day since delays will push flights later

# Q5 : On what day of the week should you leave if you want to minimise the chance of a delay?

# Ans 5 : 
flights_dt %>%
  mutate(dow = wday(sched_dep_time)) %>%
  group_by(dow) %>%
  summarise(
    dep_delay = mean(dep_delay),
    arr_delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  print(n = Inf)
flights_dt %>%
  mutate(wday = wday(dep_time, label = TRUE)) %>% 
  group_by(wday) %>% 
  summarize(ave_dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = wday, y = ave_dep_delay)) + 
  geom_bar(stat = "identity")

# Saturday has the lowest average departure delay time and the lowest average arrival delay time

# Q6 : What makes the distribution of diamonds$carat and flights$sched_dep_time similar?

# Ans 6 : 
ggplot(diamonds, aes(x = carat)) +
  geom_density()
# carat and sched_dep_time there are abnormally large numbers of values are at nice “human” numbers
# In sched_dep_time it is at 00 and 30 minutes. In carats, it is at 0, 1/3, 1/2, 2/3

# Q7 : Confirm my hypothesis that the early departures of flights in minutes 20-30 and 50-60 are caused by scheduled flights that leave early
# Ans 7 : 
flights_dt %>% 
  mutate(minute = minute(dep_time),
         early = dep_delay < 0) %>% 
  group_by(minute) %>% 
  summarise(
    early = mean(early, na.rm = TRUE),
    n = n()) %>% 
  ggplot(aes(minute, early)) +
  geom_line()
# This shows that the proportion of flights that are early departures is highest between minutes 20–30 and 50–60








