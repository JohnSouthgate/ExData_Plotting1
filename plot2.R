#1
hpc<-read.csv(file="household_power_consumption_2007_Feb1_Feb2.txt",sep=";") 
# comment: source file produced from copy/paste of the file household_power_consumption.txt 

#2 prelim
dtx2<-as.POSIXct(paste(as.Date(hpc$Date,"%d/%m/%Y"),hpc$Time),tz="EST")
hpc<-cbind(hpc,dtx2)

#2,4a
png(filename = "plot2.png",	width = 480, height = 480)
plot(range(hpc$dtx2),range(hpc$Global_active_power),type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(hpc$dtx2,hpc$Global_active_power)
dev.off()

