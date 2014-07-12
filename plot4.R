my_data <- read.table("household_power_consumption.txt", 
                      sep=";", 
                      header=TRUE, stringsAsFactors=FALSE)
#                     colClasses=c("Date","character", 
#                                   "numeric","numeric", "numeric", 
#                                   "numeric", "numeric","numeric","numeric")
#                     )
my_data2 <- my_data[my_data$Date=="1/2/2007",]
my_data2 <- rbind(my_data2,my_data[my_data$Date=="2/2/2007",])
#colnames(my_data) <- c("Date", "Time", "g_active_power","g_reactive_power","Voltage", "g_intensity", "sub_1","sub_2","sub_3")
my_data2$Time <- strptime(my_data2$Time, format = "%H:%M:%S")
my_data2$Date <- as.Date(my_data2$Date, format = "%d/%m/%Y")
my_data2$Global_active_power <- as.numeric(my_data2$Global_active_power)
my_data2$Global_reactive_power <- as.numeric(my_data2$Global_reactive_power)
my_data2$Voltage <- as.numeric(my_data2$Voltage)
my_data2$Global_intensity <- as.numeric(my_data2$Global_intensity)
my_data2$Sub_metering_1 <- as.numeric(my_data2$Sub_metering_1)
my_data2$Sub_metering_2 <- as.numeric(my_data2$Sub_metering_2)
my_data2$Sub_metering_3 <- as.numeric(my_data2$Sub_metering_3)

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,2,0))
par(ps="12")

plot.ts(my_data2$Global_active_power, xaxt="n", 
        xlab="",ylab="Global Active Power")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

plot(my_data2$Voltage, type="n", xaxt="n", xlab="datetime", ylab="Voltage")
lines(my_data2$Voltage)
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

plot(my_data2$Sub_metering_1, type="n", xaxt="n", xlab="", ylab="Energy sub metering")
lines(my_data2$Sub_metering_1)
lines(my_data2$Sub_metering_2, col="red")
lines(my_data2$Sub_metering_3, col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), bty="n")

plot(my_data2$Global_reactive_power, type="n", xaxt="n", xlab="", ylab="Global_reactive_power")
lines(my_data2$Global_reactive_power)
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()