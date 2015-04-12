## Plot2: Global Active Power Plot for Date and Time

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

## 4. Create plot
plot(seleccion$Global_active_power~seleccion$Date_and_Time, type="l",xlab="",ylab="Global Active Power (kilowatts)")

## 5. Save plot in png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


