
#Reading Power Consumption Data
power_consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming the Columns
names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")

#Subsetting the required data
subset_power_consumption <- subset(power_consumption,power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")


#Plotting the Graph and Saving it as PNG using PNG device
png("plot1.png", width=480, height=480)

#calling the basic plot function (Histogram Here)
hist(as.numeric(as.character(subset_power_consumption$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()