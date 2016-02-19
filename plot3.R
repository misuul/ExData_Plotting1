library(data.table)
library(dplyr)
source("plot1.R")

## load and filter data using function from plot1.R
dd <- getData()

## create the chart
png(file = "plot3.png", width = 480, height = 480, units = "px", res = 72)
plot(dd$DateTime, dd$Sub_metering_1, type = "l", xlab = ""  , ylab = "Energy sub metering", col = "black")
lines(dd$DateTime, dd$Sub_metering_2, col = "red")
lines(dd$DateTime, dd$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()
