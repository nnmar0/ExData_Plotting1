#Plot 4----

# Reading (txt) files
file_name <- "household_power_consumption.txt"
hpc_data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")


# Subsetting data with given date range 2007-02-01 and 2007-02-02
hpc <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ]


#Plot
par(mfrow = c(2,2))

plot(time_axis, hpc[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l", xaxt='n')
axis.POSIXct(1, time_axis, format = "%a")

plot(time_axis, hpc[, 5], xlab = "datetime", ylab = "Voltage", type = "l", xaxt='n')
axis.POSIXct(1, time_axis, format = "%a")

plot(time_axis, hpc[, 7], xlab = "", ylab = "Energy sub metering", type = "l", xaxt='n')
axis.POSIXct(1, time_axis, format = "%a")
lines(time_axis, hpc[, 8], col = "red")
lines(time_axis, hpc[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")

plot(time_axis, hpc[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l", xaxt='n')
axis.POSIXct(1, time_axis, format = "%a")
dev.copy(png, file = "plot4.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## to close the PNG device