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

# Generating Plot3:
png("plot3.png", width = 480, height = 480)
plot(power2$DateTime, power2$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(power2$DateTime, power2$Sub_metering_2, type="l", col="red")
lines(power2$DateTime, power2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
