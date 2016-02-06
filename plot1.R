##Course Project 1

#Load household power consumption data into an object and subset by the relevant time period
raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors = F, check.names = F, comment.char="", quote='\"')
data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Construct plot 1 and save it to a file
png(filename = "plot1.png", 480, 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()