# Weekend project " Munging Project " 
# The dataset used " saudi arabian airlines passengers arriving from abroad by airports from 2000 to 2009 " 
# https://data.gov.sa/Data/en/dataset/saudi-arabian-airlines-passengers-arriving--from-abroad--by-airports-/resource/5eb0e265-fa72-4dae-9986-973b178f92db?inner_span=True
# the excel file is added to codingdojo in " Munging Project " section

# Install the packages and import the data
install.packages("readxl")
library("readxl")
my_data <- read_excel(file.choose())
library(tidyverse)
library(ggplot2)

# Rename the coulmes
names(my_data) <- c("Departure city" , "Jeddah" , "Riyadh" , "Madinah" ,"Dammam" , "Other")

# Sign the data to t1
t1 <- my_data %>% 
  pivot_longer(c("Jeddah" , "Riyadh" , "Madinah" , "Dammam" , "Other"),
               names_to = "Arrival city" , values_to = "passengers arriving")

view(t1)

# Rename the coulme
names(t1) <- c("Departure city" , "Arrival city" , "Passengers Arriving")
names(t1) <- c("Departure_city" , "Arrival_city" , "Passengers_Arriving")
view(t1)

# Sign the data to my_data
my_data <- t1


# This code reduce the rows from 235 to 148  
my_data <-  my_data %>%
  filter_at(vars("Passengers_Arriving"), all_vars(. != 0))

# Preform EDA 

# To see how many passenger come and there cities
my_data %>%
  ggplot(aes(x = Passengers_Arriving, y = Departure_city , colour = Arrival_city)) +
  geom_point(size = 5)   

# To see wich city receive more passengers
my_data %>% 
  ggplot(aes( x = Arrival_city )) +
  geom_bar(fill = "dark blue")

# We can say that alot of passengers come from cairo 
# Also the cities receive more passengers by order 
# 1- jeddah , 2- Madinah , 3- Riyadh , 4- Dammam , 5- Other

# To see the number of passengers from each Departure city
n_of_p_from <- my_data %>% 
  group_by(Departure_city) %>% 
  summarise(Passengers_Arriving = sum(Passengers_Arriving))

view(n_of_p_from)

# To see the max and min number of passengers and from wich city
max_and_min <- n_of_p_from %>% 
  summarise(max_city = Departure_city[which.max(Passengers_Arriving)] ,  max_arriving = max(Passengers_Arriving) ,
            min_city = Departure_city[which.min(Passengers_Arriving)] , min_arriving = min(Passengers_Arriving))

view(max_and_min)

# To see the number of passengers from each arrival city
n_of_p_to <- my_data %>% 
  group_by(Arrival_city) %>% 
  summarise(Passengers_Arriving = sum(Passengers_Arriving))

view(n_of_p_to)

# To see the max and min number of passengers to wich arrival city
max_and_min_to <- n_of_p_to %>% 
  summarise(max_city = Arrival_city[which.max(Passengers_Arriving)] ,  max_arriving = max(Passengers_Arriving) ,
            min_city = Arrival_city[which.min(Passengers_Arriving)] , min_arriving = min(Passengers_Arriving))

view(max_and_min_to)


  



