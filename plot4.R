#Reading Power Consumption Data
power_consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming the Columns
names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1",
                              "Sub_metering_2","Sub_metering_3")

#Subsetting the required data
subset_power_consumption <- subset(power_consumption,power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")


#Plotting the Graph and Saving it as PNG using PNG device
png("plot4.png", width=480, height=480)


#Dividing the graphing space,and printing the plots columnwise
par(mfcol=c(2,2))


#Plot1
plot(datetime,as.numeric(subset_power_consumption$Global_active_power),
     type="l",ylab="Global Active Power",xlab = '')


#Plot2
plot(datetime,as.numeric(subset_power_consumption$Sub_metering_1),
     type="l",ylab="Energy sub metering",xlab = '')
lines(datetime,as.numeric(subset_power_consumption$Sub_metering_2),type='l',col="red")
lines(datetime,as.numeric(subset_power_consumption$Sub_metering_3),type='l',col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


#Plot3
plot(datetime,as.numeric(subset_power_consumption$Voltage),
     type="l",ylab="Voltage")


#Plot4
plot(datetime,as.numeric(subset_power_consumption$Global_reactive_power),
     type="l",ylab = "Global_reactive_power")

dev.off()
