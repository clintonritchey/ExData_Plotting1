#unzip the zip file
unzip(zipfile="./data/Power_Consumption.zip", exdir="./data")

#read data file
myData <- read.table(file.choose(),header = T, sep = ";", stringsAsFactors=FALSE, na.strings="?")

#data frame
myData.table <- tbl_df(myData)

#check data frame
head(myData.table)

myData.Feb <- filter(myData.table, Date == c("1/2/2007","2/2/2007")) 

myData.Feb$DateTime <- strptime(paste(myData.Feb$Date,myData.Feb$Time),"%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)

plot(myData.Feb$DateTime, myData.Feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")

lines(myData.Feb$DateTime, myData.Feb$Sub_metering_2, col="red")

lines(myData.Feb$DateTime, myData.Feb$Sub_metering_3, col="blue")

legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
