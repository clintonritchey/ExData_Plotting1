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

png("plot2.png",width=480,height=480)

plot(myData.Feb$DateTime, myData.Feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

dev.off()
