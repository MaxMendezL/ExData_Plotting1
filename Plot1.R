#plot1
dataset<-read.table("household_power_consumption.txt", sep=";")

 subset<-subset(dataset, dataset$V1=="1/2/2007" | dataset$V1=="2/2/2007")
 colnames(subset)<- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
 
 x<-as.numeric(as.character(subset$Global_active_power))
hist(x, col="red", xlab = "Global Active Power(kilowatts)", main="Global Active Power")
 
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()



 
 
 
 

