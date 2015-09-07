##Reading data##

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?") 
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data=subset(data,Date =="2007-02-01"|data$Date =="2007-02-02")

library(lubridate)
data$Datetime <-  ymd_hms(paste(data$Date, data$Time))  



##Plot 4##
png(filename = "plot4.png",  width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

plot(data$Datetime,data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

plot(data$Datetime,data$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

with(data, plot(Datetime, Sub_metering_1, type="l",col='black',ylab="Energy sub metering", xlab=""))
points(data$Datetime, data$Sub_metering_2, col='red', type='l')
points(data$Datetime, data$Sub_metering_3, col='blue', type='l')
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    

plot(data$Datetime,data$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()
