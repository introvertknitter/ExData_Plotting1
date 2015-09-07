##Reading data##

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?") 
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data=subset(data,Date =="2007-02-01"|data$Date =="2007-02-02")

library(lubridate)
data$Datetime <-  ymd_hms(paste(data$Date, data$Time))  


##Plot 1##
png(filename = "plot1.png",  width = 480, height = 480, units = "px")

par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))

hist(data$Global_active_power,
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()