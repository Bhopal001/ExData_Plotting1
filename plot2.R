###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 2
###############################################
File <- "household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset 
FebData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(FebData$Date, FebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# to numeric
GlobalActivePower <- as.numeric(FebData$Global_active_power)

#plot 
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
