library(graphics)
png("plot2.png")
pcdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
pcdsub <- pcdata[which((as.Date("2007-01-31") < as.Date(pcdata[,1],format="%d/%m/%Y")) & (as.Date("2007-02-03") > as.Date(pcdata[,1],format="%d/%m/%Y"))),]
kwp <- as.numeric(pcdsub[,3])/1000
timestamp <- paste(pcdsub$Date, " ", pcdsub$Time)
df <- cbind(timestamp,kwp)
colnames(df) <- c("Timestamp","Global_active_power")
plot(strptime(df[,1],format="%d/%m/%Y %H:%M:%S"),df[,2],type="l", ylab="Global ACtive Power (kilowatts)", xlab="")
dev.off()
