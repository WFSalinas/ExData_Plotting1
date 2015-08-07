
data = read.table("household_power_consumption.txt", header = TRUE, nrows=2880, skip=66636, sep =";", colClasses = c("NULL","NULL","NULL","NULL","NULL","NULL","numeric","numeric","numeric"), na.strings = "?")
colnames(data) = c("SubMtrng1","SubMtrng2","SubMtrng3")
good = complete.cases(data)
data = data[good,]
# change into a Time-series object
data = ts(data)

png(file = "plot3.png")
plot(data[,1], xaxt="n", ylab ="Energy sub metering", xlab = "", typ = "l")
lines(data[,2], col = "red")
lines(data[,3], col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), col = c(1,2,4),pt.cex=1,cex = .75 )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()