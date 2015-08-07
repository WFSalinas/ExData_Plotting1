
#Read only data corresponding to 2/1/2007 to 2/2/2007, and only column corresponding 
# to "Global Active Power". 
data = read.table("household_power_consumption.txt", header = TRUE, nrows=2880, skip=66636, sep =";", colClasses = c("NULL","NULL","numeric","NULL","NULL","NULL","NULL","NULL","NULL"), na.strings = "?")

#Remove any NAs from data set.
good = complete.cases(data)
data = data[good,]

#plot the histogram in png graphics device
png(file = "plot1.png", )
hist(data, xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")
dev.off()
