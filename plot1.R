# plot1

# rm(list = ls())
# Sys.setlocale('LC_TIME', 'C')
source("PrepareHouseholdData.R")
data <- PrepareHouseholdData()

hist(data$GlobalActPower, 
     breaks = 10, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()