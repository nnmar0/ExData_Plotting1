# Plot 2----

# Reading (txt) files
file_name <- "household_power_consumption.txt"
hpc_data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")


# Subsetting data with given date range 2007-02-01 and 2007-02-02
hpc <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ]


Sys.setlocale("LC_TIME", "English")


# Vector (converting format)
date_converted <- as.Date(hpc[,1], format = "%d/%m/%Y")
time_converted <- strptime(hpc[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, hpc[, 2]))
df<-data.frame(DateTime=time_axis)

# Plot
par(mfrow = c(1,1))
plot(df, hpc[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l", xaxt='n')
axis.POSIXct(1, time_axis, format = "%a")
#axis(labels=c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## to close the PNG device