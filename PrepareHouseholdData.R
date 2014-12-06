PrepareHouseholdData <- function(){
      # rm(list = ls())
      # source("PrepareHouseholdData.R")
      # data <- PrepareHouseholdData()
      
      unzip("exdata-data-household_power_consumption.zip")
      filename <- "household_power_consumption.txt"
      data <- read.table(filename, header = TRUE, nrows = 24*60*2, skip = 66636, sep = ";")
      names(data) = c("Date", "Time", "GlobalActPower", "GlobalReactPower",
                      "Voltage","GlobalIntensity",
                      "Submetering1", "Submetering2", "Submetering3")
      data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
      data$DateTime <- paste(data$Date, data$Time)
      data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S")
      data$Weekdays <- weekdays(data$DateTime);
      print("Data Prepared")
      return(data)
}