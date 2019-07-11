# Coursera John Hopkins Data Science - Exploratory Data Analysis
# Course Project Week 1
# Plot 4


# Load the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata_data_household_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip")

# Unzip the original data
unzip("exdata_data_household_power_consumption.zip")
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";",dec = ".")

# Select the data needed (i.e. 1/2/2007 and 2/2/2007)
selecteddata <-subset(alldata, Date=="1/2/2007"| Date =="2/2/2007")

# Convert the class of the data to be plotted from "factor" to "numeric"
selecteddata$Global_active_power <- as.numeric(as.character(selecteddata$Global_active_power))
selecteddata$Global_reactive_power <- as.numeric(as.character(selecteddata$Global_reactive_power))
selecteddata$Sub_metering_1 <- as.numeric(as.character(selecteddata$Sub_metering_1))
selecteddata$Sub_metering_2 <- as.numeric(as.character(selecteddata$Sub_metering_2))
selecteddata$Sub_metering_3 <- as.numeric(as.character(selecteddata$Sub_metering_3))
selecteddata$Voltage <- as.numeric(as.character(selecteddata$Voltage))

### PLot 4
# Convert the class of the Date from "factor" to "date"
selecteddata$Date <- as.Date(selecteddata$Date, "%d/%m/%Y")

# Combine Date and Time into DT column and put it into date format
datetime <- paste(as.Date(selecteddata$Date), selecteddata$Time)
selecteddata$Datetime <- as.POSIXct(datetime)

# Plot graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(selecteddata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp=0.8)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

# Save histogram to png-file
dev.copy(device = png, filename = 'Plot4.png', width = 480, height = 480)
dev.off()
