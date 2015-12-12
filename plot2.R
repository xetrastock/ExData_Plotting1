download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./Data/H.zip")
unzip("./Data/H.zip",exdir="./Data")
bob <- read.table("./Data/household_power_consumption.txt",sep=";",header=TRUE)
bob <- bob[bob$Date=="1/2/2007"|bob$Date=="2/2/2007",]
bob[,3:9] = apply(bob[,3:9],2,function(x) as.numeric(as.character(x)))
bob$Time <- strptime(paste(bob$Date,bob$Time),"%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(bob$Time,bob$Global_active_power,type="l",xlab = "",ylab= "Global Active Power (kilowatts)")
dev.off()