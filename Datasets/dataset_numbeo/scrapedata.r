library(stringr)

url <- "https://www.numbeo.com/quality-of-life/rankings.jsp"
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
write.csv(mydata, "mydata.csv")