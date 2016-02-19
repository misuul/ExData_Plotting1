library(data.table)
library(dplyr)

## function to load and filter data, to be used by all 4 scripts
getData <- function() {
    fileName <- "~/Desktop/household_power_consumption.txt"
    headData <- read.table(fileName, header = TRUE, sep = ";", nrows = 10)
    data <- read.table(fileName, header = TRUE, sep = ";", col.names = names(headData), na.strings = "?")
    data <- data.table(data)
    data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
    dd <- filter(data, Date == "2007-02-01" | Date == "2007-02-02" )
    ## remove large dataset to free up memory if needed
    ## rm(list = "data") 
    if(dim(dd)[1] != sum(complete.cases(dd))) print("Check for incomplete cases")
    ## create a new DateTime column from Date and Time
    t <- strptime(dd$Time, format = "%H:%M:%S")
    tf <- strftime(t, format = "%H:%M:%S")
    ps <- paste(dd$Date, tf)
    DateTime <- strptime(ps, format = "%Y-%m-%d %H:%M:%S")
    dd <- cbind(dd, DateTime)
    dd    
}

## load and filter data
dd <- getData()

## create the chart
png(file = "plot1.png", width = 480, height = 480, units = "px", res = 72)
hist(dd$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", breaks = 12, main = "Global Active Power")
dev.off()