###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 4
###############################################
File <- "household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset 
FebData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#datetime
datetime <- strptime(paste(FebData$Date, FebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(FebData$Global_active_power)
subMeter1 <- as.numeric(FebData$Sub_metering_1)
subMeter2 <- as.numeric(FebData$Sub_metering_2)
subMeter3 <- as.numeric(FebData$Sub_metering_3)
voltage <- as.numeric(FebData$Voltage)
globalReactivePower <- as.numeric(FebData$Global_reactive_power)


par(mfrow = c(2, 2), mar=c(2,2,2,2), oma=c(0,0,0,0))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topleft", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()