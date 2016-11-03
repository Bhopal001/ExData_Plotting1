###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 3
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


plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
#legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
