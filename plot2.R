# plot2

# rm(list = ls())
source("PrepareHouseholdData.R")
data <- PrepareHouseholdData()

png(file = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$GlobalActPower,  
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off() 