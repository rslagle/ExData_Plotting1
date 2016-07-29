# Generate Plot4
#
# Set Directory Locations
directory <- "C://R_Programs//Coursera//4_Exploratory_Data_Analysis//Week_1_Course_Project/"
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
# Generate Plot 4
#
# 4 Plots on one page
# #Top Left    - Line Plot (Plot2)
# #Top Right   - Line Plot datetime vs Voltage
# #Bottom Left - Line Plot Sub Metering
# #Botom Right - Line Plot date_time vs Global_inactive_power
# Send to File
#
plot4File <- paste(dataOutputDir, "plot4.png", sep="")
png(filename=plot4File, width=480, height=480, units="px")
#
# Set up template
par(mfrow=c(2,2), mar=c(4,4,2,2))
#
# Top Left Plot
plot(hpcSub$Date_Time, hpcSub$Global_active_power,  type="l", xlab = "", ylab="Global Active Power")
# Top Right Plot
plot(hpcSub$Date_Time, hpcSub$Voltage, type="l", xlab = "datetime", ylab="Voltage")
# Bottom Left Plot
plot(hpcSub$Date_Time, hpcSub$Sub_metering_1, type="l", xlab = "", ylab="Energy Sub metering")
lines(hpcSub$Date_Time, hpcSub$Sub_metering_2, col="red")
lines(hpcSub$Date_Time, hpcSub$Sub_metering_3, col="blue")
legend(c("topright"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"), bty="n")
# Bottom Right Plot
plot(hpcSub$Date_Time, hpcSub$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power", ylim=c(0,0.5))
dev.off()
# End of Graphic Generation
#
# Clean Out Data Table
remove(hpcSub)
#
# End of Generate Plot4 Code
