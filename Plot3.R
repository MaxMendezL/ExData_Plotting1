#plot3
library(lubridate)

dataset<-read.table("household_power_consumption.txt", sep=";")
subset<-subset(dataset, dataset$V1=="1/2/2007" | dataset$V1=="2/2/2007")
colnames(subset)<- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

cleaned<-subset[apply(subset, 1, function(x) any(x != '')), ] # Clean empty rows

x<-as.Date(subset$Date,format='%d/%m/%Y')
x <- paste(as.Date(x), subset$Time)
x <- as.POSIXct(x)

y1<-as.numeric(as.character(cleaned$Sub_metering_1))
y2<-as.numeric(as.character(cleaned$Sub_metering_2))
y3<-as.numeric(as.character(cleaned$Sub_metering_3))

png('plot3.png')
with(cleaned, {
        plot(y1~x, type="l", ylab="Energy sub metering", xlab="", col='black')
        lines(y2~x, type="l", col='red')
        lines(y3~x, type="l", col='blue')
        legend('topright', col=c("black", "red", "blue"), lty=1,
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()