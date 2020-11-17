data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   colClasses = c("character","character", rep("numeric", 6)),
                   na.strings = "?")

data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

library(dplyr)
DATA <- data %>% select(-Time) %>% filter(as.Date(Date) >= as.Date("2007/02/01") &
                                                as.Date(Date) < as.Date("2007/02/03"))

rm(data)

png("plot1.png")
par(mar = c(4, 4, 1, 4))
hist(DATA$Global_active_power, col = "red", xlab = "Global Active Power (kilowats)",
     main = "Global Active Power")
dev.off()