##read data
powerdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings='?',  sep= ';')
##convert date to date class (Date2)
powerdata$Date2 <- as.Date( as.character(powerdata$Date), format="%d/%m/%Y")
##subset to relevant dates
powerfeb <- powerdata[powerdata$Date2=="2007-02-02"|powerdata$Date2=="2007-02-01",]
##create histogram
hist(powerfeb$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
##write histogram as png file
dev.copy(png, 'plot1.png')
dev.off()

