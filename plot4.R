require(lubridate)

#Reading data into R
if(!exists("power")){
  power<- read.table("household_power_consumption.txt", sep=";",
                     header=TRUE, quote= "", strip.white=TRUE, 
                     stringsAsFactors = FALSE, na.strings= "?")
}
#Convert Date to date
date <- dmy(power$Date)
# Get the rows for days(Feb 1 & Feb2 2007):
data<- which(date %in% c(ymd(20070201), ymd(20070202)))

# Extract only the data we need
power2 <- power[data,]
# Create full date and time column
power2$DateTime <- dmy_hms(paste(power2$Date,power2$Time))

# Generating Plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # adding plots in col-wised manner.
# Adding the first and second plot.
plot(power2$DateTime, power2$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="") 
plot(power2$DateTime, power2$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")
lines(power2$DateTime, power2$Sub_metering_2, type="l", col="red")
lines(power2$DateTime, power2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty="n", col=c("black", "red", "blue")) 
# Adding the third and fourth plot.
plot(power2$DateTime, power2$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(power2$DateTime, power2$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power") 
dev.off()
