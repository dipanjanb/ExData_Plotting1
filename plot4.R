library(graphics)
png("plot4.png")
par(mfrow=c(2,2))
pcdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
pcdsub <- pcdata[which((as.Date("2007-01-31") < as.Date(pcdata[,1],format="%d/%m/%Y")) & (as.Date("2007-02-03") > as.Date(pcdata[,1],format="%d/%m/%Y"))),]

kwp <- as.numeric(as.character(pcdsub[,3]))
timestamp <- paste(pcdsub$Date, " ", pcdsub$Time)
df <- cbind(timestamp,kwp)
colnames(df) <- c("Timestamp","Global_active_power")
plot(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,2],type="l", ylab="Global Active Power (kilowatts)", xlab="")

timestamp <- paste(pcdsub$Date, " ", pcdsub$Time)
df <- cbind(timestamp,as.numeric(as.character(pcdsub[,5])))
colnames(df) <- c("Timestamp","Voltage")
plot(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,2],type="l", ylab="Voltage", xlab="datetime")

sm1 <- as.numeric(as.character(pcdsub[,7]))
sm2 <- as.numeric(as.character(pcdsub[,8]))
sm3 <- as.numeric(as.character(pcdsub[,9]))
timestamp <- paste(pcdsub$Date, " ", pcdsub$Time)
df <- cbind(timestamp,sm1,sm2,sm3)
colnames(df) <- c("Timestamp","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,2],type="l", ylab="Energy sub metering", xlab="")
lines(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,3],col="red")
lines(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,4],col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

timestamp <- paste(pcdsub$Date, " ", pcdsub$Time)
df <- cbind(timestamp,as.numeric(as.character(pcdsub[,4])))
colnames(df) <- c("Timestamp","Global_reactive_power")
plot(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,2],type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
