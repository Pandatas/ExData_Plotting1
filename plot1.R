# Coursera John Hopkins Data Science - Exploratory Data Analysis
# Course Project Week 1
# PLot 1

# Load libraries
library(lubridate)

# Load the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata_data_household_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")

# Unzip the original data
unzip("exdata_data_household_power_consumption.zip")
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";",dec = ".")

# Select the data needed (i.e. 1/2/2007 and 2/2/2007)
selecteddata <-subset(alldata, Date=="1/2/2007"| Date =="2/2/2007")

# Convert the class of the Date from "factor" to "date"
selecteddata$Date <- as.Date(selecteddata$Date, "%d/%m/%Y")

# Convert the class of the data to be plotted from "factor" to "numeric"
selecteddata$Global_active_power <- as.numeric(as.character(selecteddata$Global_active_power))
selecteddata$Sub_metering_1 <- as.numeric(as.character(selecteddata$Sub_metering_1))
selecteddata$Sub_metering_2 <- as.numeric(as.character(selecteddata$Sub_metering_2))
selecteddata$Sub_metering_3 <- as.numeric(as.character(selecteddata$Sub_metering_3))
selecteddata$Voltage <- as.numeric(as.character(selecteddata$Voltage))

### Plot 1
# Plot histogram
hist(selecteddata$Global_active_power, col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
# Save histogram to png-file
dev.copy(device = png, filename = 'Plot1.png', width = 480, height = 480)
dev.off()