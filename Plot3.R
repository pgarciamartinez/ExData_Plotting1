## Plot3.R 

rm(list=ls())

# Store current directory
currentwd <- getwd()

# Switch to the directory corresponding to the assignment
directory <- file.path(currentwd, "Desktop/Johns Hopkins/ExData_Plotting1-master")
setwd(directory)

# Read file
power_consumption_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power_consumption_data <- subset(power_consumption_data, Date == "1/2/2007" | Date == "2/2/2007")

# Quick look at the data
str(power_consumption_data)

# Convert Date and Time variables to Date/Time classes
power_consumption_data$Date_Time <- paste(power_consumption_data$Date, power_consumption_data$Time)
power_consumption_data$Date_Time <- strptime(power_consumption_data$Date_Time, format = "%d/%m/%Y %H:%M:%S")

# Convert other columns to numeric class
power_consumption_data$Global_active_power <- as.numeric(power_consumption_data$Global_active_power)
power_consumption_data$Sub_metering_1 <- as.numeric(power_consumption_data$Sub_metering_1)
power_consumption_data$Sub_metering_2 <- as.numeric(power_consumption_data$Sub_metering_2)
power_consumption_data$Sub_metering_3 <- as.numeric(power_consumption_data$Sub_metering_3)
power_consumption_data$Voltage <- as.numeric(power_consumption_data$Voltage)
power_consumption_data$Global_reactive_power <- as.numeric(power_consumption_data$Global_reactive_power)
power_consumption_data$Global_intensity <- as.numeric(power_consumption_data$Global_intensity)

str(power_consumption_data)

# Creating of Plot3.png
png(file = "Plot3.png", width = 480, height = 480, units = 'px', bg="transparent")
with(power_consumption_data, plot(Date_Time, Sub_metering_1, type = 'l',
                                  xlab = "", ylab = "Energy sub metering"))
with(power_consumption_data, lines(Date_Time, Sub_metering_2, col = "red"))
with(power_consumption_data, lines(Date_Time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

dev.off()