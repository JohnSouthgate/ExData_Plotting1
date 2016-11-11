#1
hpc<-read.csv(file="household_power_consumption_2007_Feb1_Feb2.txt",sep=";") 
# comment: source file produced from copy/paste of the file household_power_consumption.txt 

png(filename = "plot1.png",	width = 480, height = 480)
hist(hpc$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
