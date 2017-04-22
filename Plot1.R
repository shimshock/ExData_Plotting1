## Read txt file
rawdata <- "./household_power_consumption.txt"

##Create a table from the text file
mydata <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Filter Data for the specified days of February 1 and 2 of 2007
filtereddata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

##convert text date to a date format
filtereddata$Date <- strptime(as.character(filtereddata$Date), "%d/%m/%Y")
filtereddata$Date <- as.Date(filtereddata$Date, "%m/%d/%y")

##Create and save the plot
png(file="plot1.png", height=480, width=480)
hist(as.numeric(filtereddata$Global_active_power), main = "Global Active Power",
     col="Red", xlab="Global Active Power (kilowats)")
dev.off()
