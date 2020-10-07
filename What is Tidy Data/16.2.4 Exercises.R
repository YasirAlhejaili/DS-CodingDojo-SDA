# 16.2.4 Exercises

library(tidyverse)
library(lubridate)
library(nycflights13)
# Q1 : What happens if you parse a string that contains invalid dates?
ymd(c("2010-10-10", "bananas"))

# Ans 1 : It produces an NA and a warning message 

# Q2 : What does the tzone argument to today() do? Why is it important?

# Ans 2 : It determines the time-zone of the date and can vary depending on the time-zone specified

# Q3 : Use the appropriate lubridate function to parse each of the following dates:

d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014

# Ans 3 : 

mdy(d1)
ymd(d2)
dmy(d3)
mdy(d4)
mdy(d5)

