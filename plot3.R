# Generate Plot3
#
# Set Directory Locations
directory <- "C://R_Programs//Coursera//4_Exploratory_Data_Analysis//Week_1_Course_Project//"
setwd(directory)
dataInputDir <- paste(directory, "Data/", sep="")
dataOutputDir <- paste(directory, "Graphs/", sep="")
#
#Read Data File
#Read household_power_consumption.txt File
hpcFile <- paste(dataInputDir, "household_power_consumption.txt", sep="")
hpcData <-read.table(hpcFile, sep=";", header=TRUE, na.strings="?")
#
# End reading file
#
# Subset for Dates 2007-02-01 and 2007-02-02
hpcSub <- hpcData[as.Date(hpcData$Date,"%d/%m/%Y") >= as.Date("02/01/2007", "%m/%d/%Y"),]
hpcSub <- hpcSub[as.Date(hpcSub$Date,"%d/%m/%Y")   <= as.Date("02/02/2007", "%m/%d/%Y"),]
remove(hpcData)
# Combine Date and Time
hpcSub$Date_Time <- strptime(paste(hpcSub$Date,hpcSub$Time), "%d/%m/%Y %H:%M:%S")
#
# Generate Plot 3
#
# Line Plots of Weekday_Time (Thur-Sat) and Energy Sub metering
#
# Send to File
plot3File <- paste(dataOutputDir, "plot3.png", sep="")
png(filename=plot3File, width=480, height=480, units="px")
plot(hpcSub$Date_Time, hpcSub$Sub_metering_1, type="l", xlab = "", ylab="Energy Sub metering")
lines(hpcSub$Date_Time, hpcSub$Sub_metering_2, col="red")
lines(hpcSub$Date_Time, hpcSub$Sub_metering_3, col="blue")
legend(c("topright"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))
dev.off()
# End of Graphic Generation
#
# Clean Out Data Table
remove(hpcSub)
#
# End of Generate Plot3 Code