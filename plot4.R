#plot 4
        
# Data URL:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip        

color <- "white"
        
setwd('~/R/ExporatoryDataProject1')

# Load and filter household power consumption dataset
HHPC <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

dim(HHPC)

# Create a new "datetime" 
HHPC$datetime <- strptime(paste(HHPC$Date, HHPC$Time), "%d/%m/%Y %H:%M:%S")

HHPC$Date=strptime(HHPC$Date, format="%d/%m/%Y")

# Return only the subset of dates 
HHPC=subset(HHPC,HHPC$Date>as.POSIXlt("2007-01-31") & HHPC$Date<as.POSIXlt("2007-02-03"))

HHPC$Global_active_power=as.numeric(HHPC$Global_active_power)
HHPC$Global_intensity=as.numeric(HHPC$Global_intensity)
HHPC$Global_reactive_power=as.numeric(HHPC$Global_reactive_power)
HHPC$Sub_metering_1=as.numeric(HHPC$Sub_metering_1)
HHPC$Sub_metering_2=as.numeric(HHPC$Sub_metering_2)
HHPC$Sub_metering_3=as.numeric(HHPC$Sub_metering_3)
HHPC$Voltage=as.numeric(HHPC$Voltage)
        
        
png(file="plot4.png",width=480,height=480, bg=color)

par(mfrow=c(2,2))

## Plot 1
plot(HHPC$datetime,HHPC$Global_active_power, type="l", xlab="",ylab="Global Active Power")

## Plot 2
plot(HHPC$datetime,HHPC$Voltage, type="l", xlab="datetime",ylab="Voltage")

## Plot 3
plot(HHPC$datetime,HHPC$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")

lines(HHPC$datetime,HHPC$Sub_metering_2,col="red")

lines(HHPC$datetime,HHPC$Sub_metering_3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot 4
plot(HHPC$datetime,HHPC$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()