## Read txt file
rawdata <- "./household_power_consumption.txt"

##Create a table from the text file
mydata <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Filter Data for the specified days of February 1 and 2 of 2007
filtereddata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert chr data to date format
filtereddata$Date <- as.Date(filtereddata$Date, format="%d/%m/%Y")

##Combine the Date and Time for ploting
Datetime <- paste(as.Date(filtereddata$Date), filtereddata$Time)
filtereddata$Datetime <- as.POSIXct(Datetime)


##Create and save the plot
png(file="plot3.png", height=480, width=480)
plot(as.numeric(filtereddata$Sub_metering_1)~ filtereddata$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(as.numeric(filtereddata$Sub_metering_2) ~ filtereddata$Datetime, col="red")
lines(as.numeric(filtereddata$Sub_metering_3) ~ filtereddata$Datetime, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, col=c("black","red","blue"))
dev.off()