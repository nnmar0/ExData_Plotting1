
# Downloading dataset
filename <- "Coursera_PGA_CP1.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("Electric Power Consumption")) { 
        unzip(filename) 
}

# Reading (txt) files
file_name <- "household_power_consumption.txt"
hpc_data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")


# Subsetting data with given date range 2007-02-01 and 2007-02-02
hpc <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ]


# Plot 1----

hist(hpc[, 3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## to close the PNG device