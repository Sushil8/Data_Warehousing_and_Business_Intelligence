library(stringr)
library(dplyr)

mydata <- read.csv(file = "simplemaps-worldcities-basic.csv", header = TRUE, sep = ",")
mydata$iso2 <- NULL
mydata$iso3 <- NULL
mydata$province <- NULL

mydata$city <- gsub("[^0-9A-Za-z///' ]","'" , mydata$city ,ignore.case = TRUE)
mydata$city <- gsub("''","" , mydata$city ,ignore.case = TRUE)
mydata$country <- gsub("\\(.*","" , mydata$country ,ignore.case = TRUE)
mydata$city <- gsub("[^a-z]","" , mydata$city ,ignore.case = TRUE)
mydata$city_ascii <- gsub("[^a-z]","" , mydata$city_ascii ,ignore.case = TRUE)
#mydata1 <- unique(mydata, by = city)
mydata <- mydata %>%  distinct_("city", .keep_all = TRUE)
#mydata <- distinct_(mydata, "city", "city_ascii")
write.csv(mydata, "simplemaps.csv")
