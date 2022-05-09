library(ggplot2)
library(tidyverse)
library(here)
library(readr)
library(readxl)
library(dplyr)
library(here)
library(skimr)
library(janitor)
library(palmerpenguins)
penguins_df <-data(penguins)
penguins_df
View(penguins)
ggplot(data = penguins)+geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = mtcars, mapping = aes(x = disp, y = hp, color = gear)) + geom_point()
##In this scenario, you are a junior data analyst working for a hotel booking company. You have cleaned and manipulated your data, and gotten some initial insights you would like to share. Now, you are going to create some simple data visualizations with the `ggplot2` package. You will use basic `ggplot2` syntax and troubleshoot some common errors you might encounter.    
#open the hotel bookings file, preview the data,Install and load the 'ggplot2' packagecreating a plot

#A stakeholder tells you, "I want to target people who book early, and I have a hypothesis that people with children have to book in advance."

#When you start to explore the data, it doesn't show what you would expect. That is why you decide to create a visualization to see how true that statement is-- or isn't.


hotel_bookings <- read_csv("C:/Users/arunk/Documents/hotel_bookings.csv")

head(hotel_bookings)

colnames(hotel_bookings)

str(hotel_bookings)

ggplot(data = hotel_bookings)+ geom_point(mapping = aes(x=lead_time , y = children))

ggplot(data = hotel_bookings)+ 
  geom_bar(mapping = aes(x=stays_in_week_nights, fill=children))

# 

## Facets
library(palmerpenguins)

ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_wrap(~species)

ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_grid(sex~species)


ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_grid(~sex)



ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_grid(~species)


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut)


#
#open the hotel bookings file, preview the data,Install and load the 
#'ggplot2' packagecreating a plot

#A stakeholder tells you, "I want to target people who book early, 
#I have a hypothesis that people with children book in advance."

#Let us test this hypothesis


hotel_bookings <- read_csv("C:/Users/arunk/Documents/hotel_bookings.csv")

head(hotel_bookings)

colnames(hotel_bookings)

str(hotel_bookings)

ggplot(data = hotel_bookings)+ geom_point(mapping = aes(x=lead_time , y = children))

ggplot(data = hotel_bookings)+ geom_jitter(mapping = aes(x=lead_time , y = children))


ggplot(data = hotel_bookings)+ 
  geom_bar(mapping = aes(x=stays_in_week_nights), col = "blue", fill = "yellow")

# Penguins data Analysis

penguins_df <-data(penguins)
penguins_df

ggplot(data = penguins)+geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#Find the correlation

p <- drop_na(penguins)
cor(p$flipper_length_mm, p$body_mass_g)
## strong positive correlation 0.8729789


## Facets
library(palmerpenguins)

ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_wrap(~species)

ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_grid(sex~species)


ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_grid(~sex)



ggplot(penguins, aes(x = flipper_length_mm , y = body_mass_g )) +
  geom_point(aes(color = species))+
  facet_grid(~species)

### using mtcars data set
ggplot(data = mtcars, mapping = aes(x = disp, y = hp, color = gear)) + geom_point()

#### Use diamonds data set
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut)


### Step 4: Making a Bar Chart

##Your stakeholder is interested in developing promotions based on different
#booking distributions, but first they need 
##to know how many of the transactions are occurring for each 
#different distribution type.



ggplot(data = hotel_bookings)+
  geom_bar(mapping = aes(x = distribution_channel, fill = deposit_type))

ggplot(data = hotel_bookings)+
  geom_bar(mapping = aes(x = distribution_channel, fill = market_segment))+
  facet_grid(deposit_type~market_segment)+
  theme(axis.text.x = element_text(angle = 45))



library(magrittr)
library(tidyverse)
library(dplyr)
hotel_bookings %>%
  group_by(hotel_bookings$hotel)%>%
  summarise(n = n())
onlineta_cityhotels <- filter(hotel_bookings, 
                              ( hotel_bookings$hotel =="City Hotel" & 
                                  hotel_bookings$market_segment=="Online TA"))

head(onlineta_cityhotels)
#######

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)+
  labs(title = "Market Segment based Bar Chart")

range(hotel_bookings$arrival_date_year, na.rm = TRUE)
m<-min(hotel_bookings$arrival_date_year)
n <- max(hotel_bookings$arrival_date_year)
diff = m - n


#####
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", m, " to ", n))


###########
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", m, " to ", n))

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", m, " to ", n),
       x="Market Segment",
       y="Number of Bookings")

#TO SAVE PLOT
ggsave('hotel_booking_chart.png', width = 16, height = 8)

