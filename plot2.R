# Generate Plot2
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
# Generate Plot 2
#
# Line Plot of Weekday_Time (Thur-Sat) and Global Active Power
#
# Send to File
plot2File <- paste(dataOutputDir, "plot2.png", sep="")
png(filename=plot2File, width=480, height=480, units="px")
plot(hpcSub$Date_Time, hpcSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
# End of Graphic Generation
#
# Clean Out Data Table
remove(hpcSub)
#
# End of Generate Plot2 Code
