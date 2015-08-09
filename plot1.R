## Course Project - Plot 1

#power_consuption <- read.table("../data/household_power_consumption.txt", 
#                        header = TRUE, sep = ";", skip=grep("2005-12-31", 
#                        readLines("../data/household_power_consumption.txt")), 
#                        nrows = 2879)

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

hist(power_consuption$Global_active_power, 
     xlab = "Global Active Power (kilowatts).", main = "Global Active Power",
     col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
