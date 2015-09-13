

# After download the data Read it from the directory
EDAP1<-read.table("C://R_Training//household_power_consumption.txt", sep = ";", dec = ".", header = T, stringsAsFactors = FALSE)
#Subset EDAP1 from target Date ie ("1/2/2007" and "2/2/2007")
subset_EDAP1<-EDAP1[EDAP1$Date %in% c("1/2/2007", "2/2/2007"),]
# Names of variables in the data frame
names(subset_EDAP1)
# Structure of variables 
str(subset_EDAP1)
# Convert chr to numeric 
GAP<-as.numeric(subset_EDAP1$Global_active_power)
# Drawn the Plot (Histogram)
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off()



