##read data
powerdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings='?',  sep= ';')
##convert date to date class (Date2)
powerdata$Date2 <- as.Date( as.character(powerdata$Date), format="%d/%m/%Y")
##subset to relevant dates
powerfeb <- powerdata[powerdata$Date2=="2007-02-02"|powerdata$Date2=="2007-02-01",]
##format Date AND Time
powerfeb$DateTime <- strptime(paste(powerfeb$Date, powerfeb$Time), "%d/%m/%Y %H:%M:%S") 
##plot line chart
with(powerfeb, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
## write line chart to png
dev.copy(png, 'plot2.png')
dev.off()
