#1
hpc<-read.csv(file="household_power_consumption_2007_Feb1_Feb2.txt",sep=";") 
# comment: source file produced from copy/paste of the file household_power_consumption.txt 

#2 prelim
dtx2<-as.POSIXct(paste(as.Date(hpc$Date,"%d/%m/%Y"),hpc$Time),tz="EST")
hpc<-cbind(hpc,dtx2)

#4
png(filename = "plot4.png",	width = 480, height = 480)
par(mfrow=c(2,2))

#4a
plot(range(hpc$dtx2),range(hpc$Global_active_power),type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(hpc$dtx2,hpc$Global_active_power)

#4b
plot(range(hpc$dtx2),range(hpc$Voltage),type="n",xlab="datetime",ylab="Voltage")
lines(hpc$dtx2,hpc$Voltage)

#4c
yrange<-range(c(hpc$Sub_metering_1,hpc$Sub_metering_2,hpc$Sub_metering_3))
plot(range(hpc$dtx2),yrange,type="n",xlab="",ylab="Energy sub metering")
lines(hpc$dtx2,hpc$Sub_metering_1,col="black")
lines(hpc$dtx2,hpc$Sub_metering_2,col="red")
lines(hpc$dtx2,hpc$Sub_metering_3,col="blue")
legend('topright',names(hpc[7:9]),col=c("black","red","blue"),lwd=c(1,1,1), bty="n")

#4d
plot(range(hpc$dtx2),range(hpc$Global_reactive_power),type="n",xlab="datetime",ylab="Global_reactive_power")
lines(hpc$dtx2,hpc$Global_reactive_power)

dev.off()