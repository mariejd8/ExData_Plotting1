##read data
powerdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings='?',  sep= ';')
##convert date to date class (Date2)
powerdata$Date2 <- as.Date( as.character(powerdata$Date), format="%d/%m/%Y")
##subset to relevant dates
powerfeb <- powerdata[powerdata$Date2=="2007-02-02"|powerdata$Date2=="2007-02-01",]
##format Date AND Time
powerfeb$DateTime <- strptime(paste(powerfeb$Date, powerfeb$Time), "%d/%m/%Y %H:%M:%S") 

with(powerfeb, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering"))
lines(powerfeb$DateTime, powerfeb$Sub_metering_2, col="red")
lines(powerfeb$DateTime, powerfeb$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1), cex=0.8)

dev.copy(png, 'plot3.png')
dev.off()