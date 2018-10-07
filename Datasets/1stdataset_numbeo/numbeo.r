library(stringr)
library(rvest)
library(dplyr)

url <- "https://www.numbeo.com/cost-of-living/rankings.jsp"
page <- read_html(url) #Downloads the URLs webpage
table <- html_table(page, fill = TRUE)
typeof(table)
write.csv(table,"city.csv")
mydata <- read.csv(file = "city.csv", header = TRUE, sep = ",")
typeof(mydata)
mydata$X <- NULL
mydata$X1 <- NULL
mydata$X2 <- NULL
mydata$X1.1 <- NULL
mydata$X2.1 <- NULL
mydata$X3 <- NULL
mydata$Rank <- NULL
mydata$City <- gsub(",.*","", mydata$City, ignore.case = TRUE)
mydata$City <- gsub("\\(.*", "", mydata$City)
mydata$City <- gsub("[^a-z]", "" , mydata$City ,ignore.case = TRUE)
mydata <- mydata %>%  distinct_("City", .keep_all = TRUE)
write.csv(mydata, "mydata.csv")
  