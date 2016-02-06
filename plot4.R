##Course Project 1

#Load household power consumption data into an object and subset by the relevant time period
raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors = F, check.names = F, comment.char="", quote='\"')
data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert date and time into proper format
date <- as.Date(data$Date, format = "%d/%m/%Y")
date_time <- as.POSIXct(paste(date, data$Time))

#Construct plot 4 defined as a 2 x 2 table
png(filename = "plot4.png", 480, 480)
par(mfrow = c(2, 2)) 

#Add existing "plot1" to the top left quadrant
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#Create new plot and add it to the top right quadrant
plot(date_time, data$Voltage, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Add existing "plot 3" to the bottom left quadrant
plot(date_time, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(date_time, data$Sub_metering_2, type="l", col="red")
lines(date_time, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

#Create new plot and add the bottom right quadrant
plot(date_time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 

#Save plot 4 to a file
dev.off()