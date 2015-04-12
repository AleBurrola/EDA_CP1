## Plot1: Global Active Power Frequency Histogram

## 1. Read original data and change date format
info <- read.csv("household_power_consumption.txt", sep=";", header=T, na.strings="?")
fechas <- as.Date(info$Date, format="%d/%m/%Y")
info2 <- info
info2$Date <- fechas

## 2. Subset feb1 and feb2
seleccion <- subset(info2, info2$Date == "2007-02-01" | info2$Date == "2007-02-02")

## 3. Create histogram
hist(seleccion$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="Red")

## 4. Save histogram in png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()