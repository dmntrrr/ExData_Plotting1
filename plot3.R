data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses = c("character","character", rep("numeric", 6)),
                   na.strings = "?")

data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

library(dplyr)
DATA <- data %>% select(-Time) %>% filter(as.Date(Date) >= as.Date("2007/02/01") &
                                              as.Date(Date) < as.Date("2007/02/03"))

rm(data)

days <- c("Thu", "Fri", "Sat")
png("plot3.png")
par(mar = c(3,5,3,5))
plot(DATA$Sub_metering_1, type = "l", xaxt = "n",
     xlab = "", ylab = "Energy sub metering")
lines(DATA$Sub_metering_2, col = "red")
lines(DATA$Sub_metering_3, col = "blue")
axis(2, lwd = 2)
axis(1, at = seq(0, 2880, 1440), labels = days[1:3])
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()