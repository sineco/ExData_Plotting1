## Course Project - Plot 2

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

png(filename = "plot2.png", width = 480, height = 480)
plot(power_consuption$DateTime, power_consuption$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
