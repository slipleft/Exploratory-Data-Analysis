##Course Project 1

#Load household power consumption data into an object and subset by the relevant time period
raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors = F, check.names = F, comment.char="", quote='\"')
data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert date and time into proper format
date <- as.Date(data$Date, format = "%d/%m/%Y")
date_time <- as.POSIXct(paste(date, data$Time))

#Construct plot 3 and save it to a file
png(filename = "plot3.png", 480, 480)
plot(date_time, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(date_time, data$Sub_metering_2, type="l", col="red")
lines(date_time, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))
dev.off()