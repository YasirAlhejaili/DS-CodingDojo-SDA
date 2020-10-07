# 16.4.5 Exercises

# Q1 : Why is there months() but no dmonths()?

# Ans 1 : The month is not a duration of time defined independently of when it occurs, but a special interval between two dates

# Q2 : Explain days(overnight * 1) to someone who has just started learning R. How does it work?

# Ans 2 : overnight is equal to TRUE or FALSE. If it is an overnight flight, this becomes 1 day, and if not, then overnight = 0, and no days are added to the date

# Q3 : Create a vector of dates giving the first day of every month in 2015. Create a vector of dates giving the first day of every month in the current year

# Ans 3 : 
# A vector of the first day of the month for every month in 2015
ymd("2015-01-01") + months(0:11)

# vector of the first day of the month for this year
floor_date(today(), unit = "year") + months(0:11)

# Q4 : Write a function that given your birthday (as a date), returns how old you are in years

# Ans 4 : 
age <- function(bday) {
  (bday %--% today()) %/% years(1)
}
age(ymd("1996-11-14"))

# Q5 : Why can’t (today() %--% (today() + years(1))) / months(1) work?

# Ans 5 : 

# To find the number of months 
(today() %--% (today() + years(1))) %/% months(1)

