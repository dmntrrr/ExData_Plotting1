data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses = c("character","character", rep("numeric", 6)),
                   na.strings = "?")

data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

library(dplyr)
DATA <- data %>% select(-Time) %>% filter(as.Date(Date) >= as.Date("2007/02/01") &
                                              as.Date(Date) < as.Date("2007/02/03"))

rm(data)

days <- c("Thu", "Fri", "Sat")
png("plot2.png")
par(mar = c(2,5,1,5))
plot(DATA$Global_active_power, type = "l", xaxt = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
axis(2, lwd = 2)
axis(1, at = seq(0, 2880, 1440), labels = days[1:3])
dev.off()