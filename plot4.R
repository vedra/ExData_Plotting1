# plot 4

# rm(list = ls())
source("PrepareHouseholdData.R")
data <- PrepareHouseholdData()

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar=c(4,2,2,2))
plot(data$DateTime, data$GlobalActPower,  type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
plot(data$DateTime, data$Voltage,  type = "l",
     xlab = "datetime", 
     ylab = "Voltage")
plot(data$DateTime, data$Submetering1, type = "l",
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Submetering2,col="red")
lines(data$DateTime, data$Submetering3,col="blue")
legend("topright", col=c("black","red","blue"), lwd=1, lty=1, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, data$GlobalReactPower, type = "l",
     xlab = "datetime", 
     ylab = "Voltage")
dev.off() 