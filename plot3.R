## Plot3: Submetering 1, 2 and 3 multiple plot for Date and Time

## 1. Read original data and change date format
info <- read.csv("household_power_consumption.txt", sep=";", header=T, na.strings="?")
fechas <- as.Date(info$Date, format="%d/%m/%Y")
info2 <- info
info2$Date <- fechas

## 2. Subset feb1 and feb2
seleccion <- subset(info2, info2$Date == "2007-02-01" | info2$Date == "2007-02-02")

## 3. Join Date and Time
fecha_hora <- paste(seleccion$Date,seleccion$Time)
seleccion$Date_and_Time <- as.POSIXct(fecha_hora)

## 4. Create multiple plot
plot(seleccion$Sub_metering_1~seleccion$Date_and_Time, type="l", xlab="",ylab="Energy sub metering")
lines(seleccion$Sub_metering_2~seleccion$Date_and_Time,col='Red')
lines(seleccion$Sub_metering_3~seleccion$Date_and_Time,col='Blue')
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=1,col=c("black", "red", "blue"))

## 5. Save plot in png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()