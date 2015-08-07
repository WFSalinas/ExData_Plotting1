
data = read.table("household_power_consumption.txt", header = TRUE, nrows=2880, skip=66636, sep =";", colClasses = c("NULL","NULL","numeric","NULL","NULL","NULL","NULL","NULL","NULL"), na.strings = "?")

good = complete.cases(data)
data = data[good,]
# change into a Time-series object
data = ts(data)

png(file = "plot2.png")
plot(data, xaxt="n", ylab="Global Active Power (Kilowatts)", xlab = "")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()