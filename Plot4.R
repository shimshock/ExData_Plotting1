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
png(file="plot4.png", height=480, width=480)

  ##Par settings to create 4 x 4 plot
  par(mfrow=c(2,2))
  
  ##First Plot upper left
  plot(as.numeric(filtereddata$Global_active_power)~ filtereddata$Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  
  ##Second Plot upper right
  plot(as.numeric(filtereddata$Voltage)~ filtereddata$Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  
  ##Third Plot lower left
  plot(as.numeric(filtereddata$Sub_metering_1)~ filtereddata$Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(as.numeric(filtereddata$Sub_metering_2) ~ filtereddata$Datetime, col="red")
  lines(as.numeric(filtereddata$Sub_metering_3) ~ filtereddata$Datetime, col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         lty=1, col=c("black","red","blue"), cex=.8)
  
  ##Fourth Plot lower right
  plot(as.numeric(filtereddata$Global_reactive_power)~ filtereddata$Datetime, type="l",
       ylab="Global_reactive_power", xlab="datetime")

dev.off()