data = read.table("household_power_consumption.txt", header = TRUE, nrows=2880, skip=66636, sep =";", na.strings = "?")
data = data[,-c(1,2)]
colnames(data) = c("GlblActivePwr", "GlblReactivePwr", "Voltage", "GlblIntensity", "SubMtring1","SubMtring2","SubMtrng3")
#Remove any NAs from data set.
good = complete.cases(data)
data = data[good,]

data = apply(data,2,as.numeric)

#plot the histogram in png graphics device
png(file = "plot4.png", )
par(mfrow=c(2,2))

#Global Active Power 
plot(data[,1], xaxt="n", ylab="Global Active Power (Kilowatts)", xlab = "", typ = "l")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

#Voltage plot
plot(data[,3], xaxt = "n", typ = "l", ylab = "Voltage", xlab = "datetime" )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

plot(data[,5], xaxt="n", ylab ="Energy sub metering", xlab = "", typ = "l")
lines(data[,6], col = "red")
lines(data[,7], col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), col = c(1,2,4),pt.cex=1,cex = .75 )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

plot(data[,2], xaxt = "n", typ = "l", ylab = "Global_reactive_power", xlab = "datetime" )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
par(mfrow=c(1,1))
dev.off()