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

par(mar=c(5.1,4.1,2.1,2.1))
par(ps="12")
png(file="plot1.png", width=480, height=480)
hist(my_data2$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()