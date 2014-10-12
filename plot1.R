library(graphics)
png("plot1.png")
pcdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
pcdsub <- pcdata[which((as.Date("2007-01-31") < as.Date(pcdata[,1],format="%d/%m/%Y")) & (as.Date("2007-02-03") > as.Date(pcdata[,1],format="%d/%m/%Y"))),]
kwp <- as.numeric(as.character(pcdsub[,3]))
hist(kwp,xlab="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
