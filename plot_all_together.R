setwd("C:/Users/Vedrana/Desktop/Education/The Data Science Specialization/Course 4 - Exploratory data analysis/Exploratory Data Analysis - Programming Assignment 1/")

# read first few lines from the table
# datahead <- read.table("household_power_consumption.txt", header = TRUE, nrows = 3)
# now we know the delimiter and variable classes

Sys.setlocale('LC_TIME', 'C')
filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, nrows = 24*60*2, skip = 66636, sep = ";")
names(data) = c("Date", "Time", "GlobalActPower", "GlobalReactPower",
                "Voltage","GlobalIntensity",
                "Submetering1", "Submetering2", "Submetering3")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S")
data$Weekdays <- weekdays(data$DateTime) 
# plot1
hist(data$GlobalActPower, 
     breaks = 10, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, file = "plot1.png",
         width = 480, height = 480)
dev.off()

# plot2
png(file = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$GlobalActPower,  type = "l",
        xlab = "", 
        ylab = "Global Active Power (kilowatts)")
dev.off() 

# plot 3
png(file = "plot3.png", width = 480, height = 480)
      plot(data$DateTime, data$Submetering1, type = "l",
              xlab = "", 
              ylab = "Energy sub metering")
             lines(data$DateTime, data$Submetering2,col="red")
             lines(data$DateTime, data$Submetering3,col="blue")
      legend("topright", col=c("black","red","blue"), lwd=1, lty=1, 
             c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 

# plot 4
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