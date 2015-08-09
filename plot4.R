## Course Project - Plot 4

power_consuption <- read.table("../data/household_power_consumption.txt", 
                               header = TRUE, sep = ";", skip = 66636, 
                               nrows = 2880)
# Rename the columns 
names(power_consuption) <- c("Date", "Time", "Global_active_power", 
                             "Global_reactive_power","Voltage", 
                             "Global_intensity", "Sub_metering_1", 
                             "Sub_metering_2", "Sub_metering_3")
# Create a DateTime columns by merging time and date
power_consuption$DateTime <- strptime(paste(power_consuption$Date, 
                                            power_consuption$Time), 
                                      format = "%d/%m/%Y %H:%M:%S")
# Remove redundant Time and date and time columns
power_consuption <- power_consuption[,c(3:10)]
# Reorder columns 
power_consuption <- power_consuption[,c(8,1,2,3,4,5,6,7)]

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(power_consuption$DateTime, power_consuption$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power")

plot(power_consuption$DateTime, power_consuption$Voltage, 
     type = "l", xlab = "datetime", ylab = "Voltage")

plot(power_consuption$DateTime, power_consuption$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering", 
     ylim=c(0.0,40.0))
par(new=T)
plot(power_consuption$DateTime, power_consuption$Sub_metering_2,
     type = "l", xlab = "", ylab = "", ylim=c(0.0,40.0), col = "red")
par(new=T)
plot(power_consuption$DateTime, power_consuption$Sub_metering_3,
     type = "l", xlab = "", ylab = "", ylim=c(0.0,40.0), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), lty = 1, col = c(1,2,4))

plot(power_consuption$DateTime, power_consuption$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
