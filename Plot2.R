#plot2
library(lubridate)
dataset<-read.table("household_power_consumption.txt", sep=";")

subset<-subset(dataset, dataset$V1=="1/2/2007" | dataset$V1=="2/2/2007")
colnames(subset)<- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

x<-as.Date(subset$Date,format='%d/%m/%Y')
x <- paste(as.Date(x), subset$Time)
x <- as.POSIXct(x)

y<-as.numeric(as.character(subset$Global_active_power))

png('Plot2.png')
plot(y ~ x,type="l", xlab="", ylab = "Global Active Power(kilowatts)", main="Global Active Power")
dev.off()