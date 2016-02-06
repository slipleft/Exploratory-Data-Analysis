##Course Project 1

#Load household power consumption data into an object and subset by the relevant time period
raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors = F, check.names = F, comment.char="", quote='\"')
data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert date and time into proper format
date <- as.Date(data$Date, format = "%d/%m/%Y")
date_time <- as.POSIXct(paste(date, data$Time))

#Construct plot 2 and save it to a file
png(filename = "plot2.png", 480, 480)
plot(date_time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()