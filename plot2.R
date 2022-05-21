#Reading Power Consumption Data
power_consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming the Columns
names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1",
                              "Sub_metering_2","Sub_metering_3")

#Subsetting the required data
subset_power_consumption <- subset(power_consumption,
                                   power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")

#Formatting the Date and Time
datetime <- strptime(paste(subset_power_consumption$Date, subset_power_consumption$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

#Plotting the Graph and Saving it as PNG using PNG device
png("plot2.png", width=480, height=480)

#Calling the Scatter Plot function and connecteng the points (type="l")
plot(datetime,as.numeric(subset_power_consumption$Global_active_power),
     type="l",ylab="Global Active Power (kilowatts)",xlab = '')
title(main="Global Active Power Vs Time")
dev.off()

