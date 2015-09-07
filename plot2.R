##Reading data##

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?") 
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data=subset(data,Date =="2007-02-01"|data$Date =="2007-02-02")

library(lubridate)
data$Datetime <-  ymd_hms(paste(data$Date, data$Time))  


##Plot 2##
png(filename = "plot2.png",  width = 480, height = 480, units = "px")

par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))

plot(data$Datetime,data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()