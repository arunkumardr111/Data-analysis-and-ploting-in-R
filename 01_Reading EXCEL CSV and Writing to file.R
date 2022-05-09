scan(file= "H:/R Studio/R PROGRAMMING - Copy/Datasets/data1.txt")
getwd()
setwd("H:/R Studio/R PROGRAMMING - Copy/Datasets")
getwd()

scan(file= "Desktop/data1.txt")

a <- readLines("H:/R Studio/R PROGRAMMING - Copy/Datasets/EmployeeSales.txt", -1)
a

con <- url("https://www.google.com", "r")
ans <- readLines(con)
head(ans)

con <- url("https://www.adarshaimit.org/", "r")
ans <- readLines(con)
head(ans)
tail(ans)
getwd()
dataframe1<-read.table("EmployeeSales.txt", header = TRUE, sep = ",")
dataframe1
head(dataframe1)


### Writing to a file
connec<-file("Employee.txt", "w+")
rec1<-as.character(cat("25","Uma","Ananth","Ph.D","Professional","1000000","2500", sep = ","))

fileConn<-file("Employee.txt")
writeLines(rec1, fileConn, sep = ",")
close(fileConn)

rec<- c("9","Rob","Verhoff","Partial High School","Clerical","45000","24.989999999999998")
rec

obj1 <- cat("\n", rec, file = "EmployeSales.txt", append = TRUE)

rec1 <- c(90,"Harry","Krebs","Graduate Degree","Clerical",50000,59.530000000000001)

rec<-cat( rec1,
         file = "EmployeeSales.txt", append = TRUE)

rec<-cat("\n", "27",",", "XYZ",",", "ABC",",", "Ph.D" , "," ,"Professional" , "," , "1000000" , "," ,"2500", 
         file = "EmployeeSales.txt", append = TRUE)


rec2<- paste(c("27","Uma", "Ananth", "Ph.D" , "Professional" , "1000000" ,"2500" ), sep = ",", collapse = '"')
rec2
rec3<-cat(rec2,
         file = "EmployeeSales.txt", append = TRUE)
rm(rec2)

write.table(rec, file = "EmployeeSales.txt", append = TRUE, sep = ",")

d1<-read.table("EmployeeSales.txt", header = TRUE, sep = ",")
d1
data("mtcars")
head(mtcars)
mtcars


write.table(mtcars, file = "mtcars.txt", sep = ",",
            row.names = TRUE,  col.names = TRUE)
read.table("EmployeeSales.txt", header = TRUE, sep = ",")

write.table(mtcars, file = "mtcars.txt", sep = "\t",
            row.names = FALSE)

# data import
#tidyverse packages-readr and readxl-to import files from other sources into R. 
# use readr to read a .csv file, and readxl to read a .xlsx file.


#display a list of the available datasets - f preloaded datasets from the "datasets" package..
data()

#load the "mtcars" dataset - information about cars that have been 
#featured in past issues of Motor Trend magazine

data(mtcars)     #The dataset will also appear in the "environment" pane

mtcars

#press ctrl and enter - short cut to execute a command 
#display the dataset by clicking directly on the name of the dataset in the environment pane -
#R automatically runs the View() function and displays the dataset in the RStudio data viewer.

as_tibble(mtcars)



#Base R also has functions for reading files
#read.table() is a general function 
#that can be used to read a file in table format. The data will be imported as a data frame.

# Read "comma separated value" files (".csv")
#read.csv(file, header = TRUE, sep = ",", dec = ".", ...)

# Reading a local file
# Writing and Reading  a txt file, named "mtcars.txt"

write.table(mtcars, file = "mtcars.txt")
getwd()

my_data <- read.delim("mtcars.txt")
my_data

#Writing and  Reading a csv file, named "mtcars.csv"

write.table(mtcars, file = "mtcars.csv")
my_data <- read.csv("mtcars.csv")

my_data
#using the function file.choose()
# Read a txt file

my_data1 <- read.delim(file.choose())
my_data2 <- read.csv("mtcars.csv")
my_data2

# Read a csv file
my_data2 <- read.csv(file.choose())


my_data2


#readr - faster than base R functions- also produce tibbles - part of core tidyverse package
#to import data from other sources for analysis. 
#USeful for Reading rectangular data. 
#rectangle of rows and columns, with each column referring to a single variable 
#and each row referring to a single observation.
# Examples of file types that store rectangular data:

#    .csv (comma separated values): is a plain text file that contains a list of data. use commas to separate (or delimit) data

#     .tsv (tab separated values):  columns of data are separated by tabs. For example, a database table or spreadsheet data.

#     .fwf (fixed width files): a .fwf file has a specific format that allows for the saving of textual data in an organized fashion.

#     .log: a .log file is a computer-generated file that records events from operating systems and other software programs.


# To read a csv file using readr
#The readr package comes with some sample files from built-in datasets that you can use for example code. To list the sample files,

library(tidyverse)

readr_example() 

read_csv(readr_example("mtcars.csv"))

#The readxl package is part of the tidyverse but is not a core tidyverse package, 
#so you need to load readxl in R by using the library() function.  

library(readxl)

readxl_example() 

read_excel("C:/Users/SRN2/Documents/Book1.xlsx")


#reading the example file "type-me.xlsx
read_excel(readxl_example("type-me.xlsx"))


# excel_sheets() function to list the names of the individual sheets. 
excel_sheets(readxl_example("type-me.xlsx"))



#use the sheet named "numeric_coercion" from the list 
df3 <-read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")


df3<-read_xlsx("G:/Tableau Training/Datasets/sales.xlsx")
View(df3)
colnames(df3)
str(df3)
class(df3)

