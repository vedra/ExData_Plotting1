# plot 3

# rm(list = ls())
source("PrepareHouseholdData.R")
data <- PrepareHouseholdData()

png(file = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Submetering1, type = "l",
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Submetering2,col="red")
lines(data$DateTime, data$Submetering3,col="blue")
legend("topright", col=c("black","red","blue"), lwd=1, lty=1, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
