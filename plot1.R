###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 1
###############################################
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset 
FebData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#coerse to numeric
GlobalActivePower <- as.numeric(FebData$Global_active_power)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
