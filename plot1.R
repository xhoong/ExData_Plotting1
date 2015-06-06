require(lubridate)

#Reading data into R
power<- read.table("household_power_consumption.txt", sep=";",
                   header=TRUE, quote= "", strip.white=TRUE, 
                   stringsAsFactors = FALSE, na.strings= "?")
#Convert Date to date
date <- dmy(power$Date)
# Get the rows for days(Feb 1 & Feb2 2007):
data<- which(date %in% c(ymd(20070201), ymd(20070202)))

# creating Plot1
png("plot1.png", width=480, height= 480)
hist(power[data, "Global_active_power"], col= "red", xlab= "Global Active Power (kilowatts)", 
     ylab= "Frequency", main= "Global Active Power")
dev.off()
