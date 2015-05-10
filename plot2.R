#plot 2

# Data URL:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip        

color <- "white"

setwd('~/R/ExporatoryDataProject1')

# Load and filter household power consumption dataset
HHPC <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

## Converting dates
HHPC$datetime <- strptime(paste(HHPC$Date, HHPC$Time), "%d/%m/%Y %H:%M:%S")

HHPC$Date=strptime(HHPC$Date, format="%d/%m/%Y")

## Subsetting the data
HHPC=subset(HHPC,HHPC$Date>as.POSIXlt("2007-01-31") & HHPC$Date<as.POSIXlt("2007-02-03"))

HHPC$Global_active_power=as.numeric(HHPC$Global_active_power)
HHPC$Global_intensity=as.numeric(HHPC$Global_intensity)
HHPC$Global_reactive_power=as.numeric(HHPC$Global_reactive_power)
HHPC$Sub_metering_1=as.numeric(HHPC$Sub_metering_1)
HHPC$Sub_metering_2=as.numeric(HHPC$Sub_metering_2)
HHPC$Sub_metering_3=as.numeric(HHPC$Sub_metering_3)
HHPC$Voltage=as.numeric(HHPC$Voltage)

png(file="plot2.png",width=480,height=480, bg=color)

## Plot 2
plot(HHPC$datetime,HHPC$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.off()