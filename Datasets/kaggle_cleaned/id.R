mydata <- read.csv(file = "movehubqualityoflife.csv", header = TRUE, sep = ",")
mydata$city_id <- 1:nrow(mydata)
mydata$city_id
write.csv(mydata, file = "movehubqualityoflife.csv")
