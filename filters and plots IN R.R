#create a data frame for pie chart
#four companies and turnover : tata, birla, ambani mahindra # 61, 82, 90, 43
#create a dataframe
companies <- c("Tata", "Birla", "Ambani", "Mahindra","Infosys", "Bosch")
turnover <- c(61, 82, 90, 43, 56, 69)

company_turnover <- data.frame(companies,turnover )

pie(turnover,companies, col = rainbow(4) ) # predefined color
pie(turnover,companies, col = rainbow(length(companies)) )  
pie(turnover,companies, col = c("tomato", "blue", "tan", "violet", "steelblue4","springgreen2"),
    clockwise = FALSE ) #custom colors

#To identify colors
colors()


# Putting percentages and labels in the pie
percentages <- round(turnover/sum(turnover) * 100)

pie(percentages,companies, col = rainbow(length(companies)), 
    main = "PIE CHART Representing TURNOVER OF COMPANIES" ) 

?pie()

#Read the file hotel_bookings.csv
getwd()

hotel_bookings <- read_csv("hotel_bookings.csv")

head(hotel_bookings)
colnames(hotel_bookings)

library(ggplot2)

#Identify which group of guests  typically make early bookings, 
#and this plot shows that many of these guests do not have children. 
hotel_bookings%>%
  ggplot(mapping = aes(x = lead_time, y = children))+
  geom_point()
coord_flip()

#to know which market segments generate the largest number of 
#bookings, and where these bookings are made (city hotels or resort hotels). 

hotel_bookings%>%
  ggplot()+
  geom_bar(mapping = aes(x = hotel, fill = market_segment))
           
           

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment)) +
  facet_wrap(~market_segment)                      

#lead time and guests traveling with children for online bookings at city hotels. This 
#will give them  a better idea of the specific timing for the promotion

hotel_bookings%>%
  filter(hotel == "City Hotel")%>%
  ggplot() +
  #geom_point(mapping = aes(x = lead_time, y = children)) +
 geom_jitter(mapping = aes(x = lead_time, y = children)) + 
  coord_flip()


#The online segment is the fastest growing segment, and families tend to spend more at city hotels than other types of guests. 
#'$' character to specify which column in the data frame 'hotel_bookings' you are referencing 

city_hotel_onlineTA <- filter(hotel_bookings, hotel == "City Hotel" & market_segment  == "Online TA")%>%
  View(city_hotel_onlineTA) 
#another way to do this
  
city_hotel_onlineTA2 <- hotel_bookings %>%
  filter(hotel == "City Hotel") %>%
  filter(market_segment == "Online TA")


View(city_hotel_onlineTA2)



#Use the new dataframe - city_hotel_onlineTA2 for the new plot
ggplot(data = city_hotel_onlineTA2) +
  geom_point(mapping = aes(x = lead_time, y = children))

#Interpretation
#The plot reveals that bookings with children tend to have a 
#shorter lead time, and bookings with 3 children have a significantly 
#shorter lead time (<200 days). So, promotions targeting families 
#can be made closer to the valid booking dates.  
