hpc <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
hpc$Date <- as.Date(as.character(hpc$Date), format="%d/%m/%Y")
sel <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
sel$datetime <- strptime(paste(sel$Date,sel$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(sel$datetime, sel$Sub_metering_1, type="l", col = "Black", xlab = "", ylab = "Energy sub metering", main = "")
lines(sel$datetime, sel$Sub_metering_2, type="l", col = "Red")
lines(sel$datetime, sel$Sub_metering_3, type="l", col = "Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("Black","Red","Blue"))
dev.off()

