#unzip the zip file
unzip(zipfile="./data/Power_Consumption.zip", exdir="./data")

#read data file
myData <- read.table(file.choose(),header = T, sep = ";", stringsAsFactors=FALSE, na.strings="?")

#data frame
myData.table <- tbl_df(myData)

#check data frame
head(myData.table)

myData.Feb <- filter(myData.table, Date == c("1/2/2007","2/2/2007")) 

png("plot1.png",width=480,height=480)

hist(myData.Feb$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", c = "red")

dev.off()
