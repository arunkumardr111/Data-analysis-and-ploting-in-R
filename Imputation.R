airquality
colnames(airquality)
table(complete.cases(airquality))

# mean of ozone by specifying Col number
mean(airquality[, 1]) # gives a null value
is.na(airquality[, 1])
mean(airquality[, 1], na.rm = TRUE)

#omit records havi NA from the dataset
new_air <- na.omit(airquality)
table(complete.cases(new_air))
mean(airquality$Wind)

#Missing Data Imputation
#command which() is used to return the indices where the condition hilds TRU
x <-seq(10)
ans <- (x==6|x == 8)

# Determining the position(index) wheere the resutl is TRUE
position <- which(ans)
position

#Missing Data Imputation for existing data set
table(complete.cases(airquality$Ozone))
# Calculating average of Ozone column by removing NA values
avg <- mean(airquality$Ozone, na.rm = TRUE)

#determining the position of NA values
position <- which(is.na(airquality$Ozone))

airquality$Ozone[position]= avg
## or airquality[position, 1] = avg

table(complete.cases(airquality$Ozone))

#The Sample Function in dplyr package
library(dplyr)
sample1 <- sample_n(iris, size = 3)
sample2 <- sample_frac(iris, size = 0.40)
#Random selection generates different records in the next execution
sample2 <- sample_frac(iris, size = 0.03)

#Count function tallies observations based on a group
count(iris, Species)
