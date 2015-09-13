##read data
powerdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings='?',  sep= ';')
##convert date to date class (Date2)
powerdata$Date2 <- as.Date( as.character(powerdata$Date), format="%d/%m/%Y")
##subset to relevant dates
powerfeb <- powerdata[powerdata$Date2=="2007-02-02"|powerdata$Date2=="2007-02-01",]
##format Date AND Time
powerfeb$DateTime <- strptime(paste(powerfeb$Date, powerfeb$Time), "%d/%m/%Y %H:%M:%S") 
##plot four graphs
par(mfrow= c(2,2))
with(powerfeb, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
  plot(DateTime, Voltage, type="l", ylab="Global Active Power (kilowatts)")
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering")
  lines(powerfeb$DateTime, powerfeb$Sub_metering_2, col="red")
  lines(powerfeb$DateTime, powerfeb$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1), xjust=1)
  plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power")
})
##write plot to png
dev.copy(png, 'plot4.png')
dev.off()