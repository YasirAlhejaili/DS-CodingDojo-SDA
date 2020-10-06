# 12.3.3 Exercises
stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
view(stocks)
stocks %>% 
  pivot_wider(names_from = year, values_from = return) %>%
  pivot_longer(`2015`:`2016`, names_to = "year", values_to = "return")

# Why does this code fail? -> Ans : because alredy fixed the table
table4a %>% 
  pivot_longer(c(1999, 2000), names_to = "year", values_to = "cases")

# What would happen if you widen this table? Why? <- Ans : we can't because the coulmes names
people <- tribble(
  ~name,             ~names,  ~values,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
people %>%
  pivot_wider(names_from = names, values_from = values)

# Tidy the simple tibble below

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
preg %>% 
  pivot_longer(c(male, female), names_to = "type", values_to = "numbers")

######################################################################