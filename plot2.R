
# After download the data Read it from the directory
EDAP1<-read.table("C://R_Training//household_power_consumption.txt", sep = ";", dec = ".", header = T, as.is = T)
#Subset EDAP1 from target Date ie ("1/2/2007" and "2/2/2007")
subset_EDAP1<-EDAP1[EDAP1$Date %in% c("1/2/2007", "2/2/2007"),]
# Date and Time in new format (strptime function)
datetime <- strptime(paste(subset_EDAP1$Date, subset_EDAP1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Convert Global active power class "chr" to "numeric" 
GAP<-as.numeric(subset_EDAP1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

