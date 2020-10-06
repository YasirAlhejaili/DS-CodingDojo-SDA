# 12.2.1 Exercises 
library(tidyverse)
library(ggplot2)

# For table2 
# Compute rate per 10,000
table2 <- table2 %>%
  pivot_wider(names_from = type , values_from = count) %>%
mutate(rate = cases / population * 10000)

# For table4 "table4a + table4b"
table4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

table4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
table4 <- left_join(table4a, table4b)

table4 <- table4 %>%
  mutate(rate = cases / population * 10000)
view(table4)

# plot showing change in cases over time for table2 
ggplot(table2, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

######################################################################



