## Cleaning Data


## Step 1: Load packages

library(tidyverse)
library(here)
library(dplyr)
library(skimr)
library(here)
library(readr)
library(readxl)
library(janitor)


## Step 2: Import data
#read file hotel bookings
bookingsdf<-read_csv("C:/Users/arunk/Documents/hotel_bookings.csv")

## Step 3: Getting to know your data
head(bookingsdf)
str(bookingsdf)
glimpse(bookingsdf)
colnames(bookingsdf)
spec(bookingsdf)

skim_without_charts(bookingsdf)


## Step 4: Cleaning your data


trimmed_df <- bookingsdf %>%
  select(hotel, is_canceled, lead_time) %>%
  rename(hotel_type = hotel)
trimmed_df



#to either split or combine data in different columns

example_df <- bookingsdf %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")
example_df

## Step 5: Another way of doing things
guests_df <- bookingsdf %>%
  mutate(guests = adults + children + babies )
head(guests_df)


#Grouping based on hotel type and 
group_df <- trimmed_df %>%
  group_by(hotel_type) %>%
  summarise(n = n())
group_df


# To skim a single coloumn  
skim(trimmed_df$hotel_type)


#summary statistics : Find how many guests have cancelled their bookings 
#and what is the average lead time
newdf<- bookingsdf %>%
  group_by(hotel)%>%
  summarise(number_cancelled= sum(is_canceled), average_lead_time = mean(lead_time))
head(newdf)


#sorting in ascending or descending order on the basis of leadtime

hotel_bookings_asc <-arrange(bookingsdf, lead_time)
head(hotel_bookings_asc)
tail(hotel_bookings_asc)

hotel_bookings_desc <-arrange(bookingsdf, -lead_time)
head(hotel_bookings_desc)
hotel_bookings_desc2 <-arrange(bookingsdf, desc(lead_time))

#Summary 
max(bookingsdf$lead_time)
min(bookingsdf$lead_time)
mean(bookingsdf$lead_time)


# Displaying incomplete cases in tabular format
table(complete.cases((bookingsdf)))

summary(bookingsdf)  # can give name of dataset

summary(bookingsdf$children, na.rm = TRUE) # can get summary of single column

# colSums will return  number of nulls in each column
colSums(is.na(bookingsdf))

#Determning which position has NA values
position <- which(is.na(bookingsdf))
length(bookingsdf)   # gives the number of coloumns in a dataframe
View(bookingsdf[position,])


summary(bookingsdf$arrival_date_year)


#to focus the promotion the company is running,  by targeting major cities.
#to know what the average lead time before booking is for just city hotels
# will be need to creating a new data set that only contains data about city hotels using filter

hotel_bookings_city <- filter(bookingsdf,bookingsdf$hotel=="City Hotel" )

head(hotel_bookings_city)
mean(hotel_bookings_city$lead_time)

hotel_summary <-
  hotel_bookings_city%>%
  group_by(hotel)%>%
  summarise(min(lead_time), max(lead_time), mean(lead_time))

head(hotel_summary)


##install and load  gapminder data set

library(gapminder)

str(gapminder)
head(gapminder)
colnames(gapminder)
## Let's say that we want to have the GDP per capita and life expectancy Kenya. 

kenya_df <- gapminder %>%
  select(gdpPercap,lifeExp, country) %>%
  filter(country =="Kenya")
kenya_df
table(complete.cases((kenya_df)))

colSums(is.na(kenya_df))
glimpse(kenya_df)
summary(kenya_df)