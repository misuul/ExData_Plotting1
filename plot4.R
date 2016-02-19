library(data.table)
library(dplyr)
source("plot1.R")

## load and filter data using function from plot1.R
dd <- getData()

## create the chart
png(file = "plot4.png", width = 480, height = 480, units = "px", res = 72)
par(mfrow = c(2,2), mar = c(5,4,2,2))

plot(dd$DateTime, dd$Global_active_power, type = "l", xlab = ""  , ylab = "Global Active Power")
plot(dd$DateTime, dd$Voltage, type = "l", xlab = "datetime"  , ylab = "Voltage")

plot(dd$DateTime, dd$Sub_metering_1, type = "l", xlab = ""  , ylab = "Energy sub metering", col = "black")
lines(dd$DateTime, dd$Sub_metering_2, col = "red")
lines(dd$DateTime, dd$Sub_metering_3, col = "blue")
legend("topright", box.lty = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

plot(dd$DateTime, dd$Global_reactive_power , type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
