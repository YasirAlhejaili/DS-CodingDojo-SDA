# Tidy data

library(tidyverse)
library(ggplot2)
view(table1)
view(table2)
view(table3)
view(table4a)
view(table4b)

# For table1 
# Compute rate per 10,000
table1 %>%
mutate(rate = cases / population * 10000)

# Compute cases per year
table1 %>%
count(year , wt = cases)

# Visualise changes over time
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))


# 12.3 Pivoting 
table4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")


table4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
table4 <- left_join(table4a, table4b)

view(table4)

# Compute rate per 10,000
table2 <- table2 %>%
  pivot_wider(names_from = type , values_from = count) %>%
  mutate(rate = cases / population * 10000)

# 12.4 Separating and uniting

table3 %>% 
  separate(rate, into = c("cases", "population"))
#or
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")
#or
table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE)
# You can use this arrangement to separate the last two digits
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
# rejoin the century and year columns
table5 %>% 
  unite(new, century, year)
# Here we don’t want any separator
table5 %>% 
  unite(new, century, year, sep = "")

# 12.5 Missing values

stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
stocks

# The return for the fourth quarter of 2015 is explicitly missing, because the cell where its value should be instead contains NA
# The return for the first quarter of 2016 is implicitly missing, because it simply does not appear in the dataset

# we can make the implicit missing value explicit by putting years in the columns
stocks %>% 
  pivot_wider(names_from = year, values_from = return)

# to turn explicit missing values implicit
stocks %>% 
  pivot_wider(names_from = year, values_from = return) %>% 
  pivot_longer(
    cols = c(`2015`, `2016`), 
    names_to = "year", 
    values_to = "return", 
    values_drop_na = TRUE
  )

# Another important tool 
stocks %>% 
  complete(year, qtr)

# There’s one other important tool that you should know for working with missing values
treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)
treatment
# You can fill in these missing values with fill()
treatment %>% 
  fill(person)
# fill() sometimes called last observation carried forward

# 12.6 Case Study 

who
who1 <- who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  )
who1

who1 %>% 
  count(key)

who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2

who3 <- who2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_")
who3

who3 %>% 
  count(new)
who4 <- who3 %>% 
  select(-new, -iso2, -iso3)

who5 <- who4 %>% 
  separate(sexage, c("sex", "age"), sep = 1)
who5


who6 <- who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  ) %>% 
  mutate(
    key = stringr::str_replace(key, "newrel", "new_rel")
  ) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)
