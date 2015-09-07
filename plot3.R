##Reading data##

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?") 
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data=subset(data,Date =="2007-02-01"|data$Date =="2007-02-02")

library(lubridate)
data$Datetime <-  ymd_hms(paste(data$Date, data$Time))  



##Plot 3##
png(filename = "plot3.png",  width = 480, height = 480, units = "px")

par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))

with(data, plot(Datetime, Sub_metering_1, type="l",col='black',ylab="Energy sub metering", xlab=""))
points(data$Datetime, data$Sub_metering_2, col='red', type='l')
points(data$Datetime, data$Sub_metering_3, col='blue', type='l')
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    

dev.off()
