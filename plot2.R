library(data.table)
library(dplyr)
source("plot1.R")

## load and filter data using function from plot1.R
dd <- getData()

## create the chart
png(file = "plot2.png", width = 480, height = 480, units = "px", res = 72)
plot(dd$DateTime, dd$Global_active_power, type = "l", xlab = ""  , ylab = "Global Active Power (kilowatts)")
dev.off()