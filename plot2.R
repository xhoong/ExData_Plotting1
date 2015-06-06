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


# Generating Plot2:
png("plot2.png", width=480, height= 480)
plot(power2$DateTime, power2$Global_active_power, type= "l", lwd=1,
     ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
