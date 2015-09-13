

# After download the data Read it from the directory
EDAP1<-read.table("C://R_Training//household_power_consumption.txt", sep = ";", dec = ".", header = T, stringsAsFactors = FALSE)
#Subset EDAP1 from target Date ie ("1/2/2007" and "2/2/2007")
subset_EDAP1<-EDAP1[EDAP1$Date %in% c("1/2/2007", "2/2/2007"),]
# Date and Time in new format (strptime function)
datetime <- strptime(paste(subset_EDAP1$Date, subset_EDAP1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Convert Global active power class "chr" to "numeric" 
GAP<-as.numeric(subset_EDAP1$Global_active_power)
subMetering1 <- as.numeric(subset_EDAP1$Sub_metering_1)
subMetering2 <- as.numeric(subset_EDAP1$Sub_metering_2)
subMetering3 <- as.numeric(subset_EDAP1$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
