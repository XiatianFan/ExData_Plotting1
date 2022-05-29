#read the table from saved file
setwd("C:/Users/xifa0/Desktop/Coursera Learning/PlottingAssignment1/ExData_Plotting1")
EnergyData<-read.table("household_power_consumption.txt",skip=1,sep=";")
View(EnergyData)
names(EnergyData)<-c("Date","Time","Global_active_power",
                     "Global_reactive_power","Voltage","Global_intensity",
                     "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
str(EnergyData)
#there are 2075259 obs. and 9 variables

#Calculate the size of the dataset
pryr::object_size(EnergyData)

#filter the interested dateset on the specific dates
InterestedEnergyData<- subset(EnergyData,EnergyData$Date=="1/2/2007" | EnergyData$Date =="2/2/2007")
View(InterestedEnergyData)
str(InterestedEnergyData)
summary(InterestedEnergyData)

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
InterestedEnergyData$Date <- as.Date(InterestedEnergyData$Date, format="%d/%m/%Y")
InterestedEnergyData$Time <- strptime(InterestedEnergyData$Time, format="%H:%M:%S")
InterestedEnergyData[1:1440,"Time"] <- format(InterestedEnergyData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
InterestedEnergyData[1441:2880,"Time"] <- format(InterestedEnergyData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#curve plot of global active power from 1/2/2007 to 2/2/2007
png(file="plot2.png", width = 480, height = 480)
plot(InterestedEnergyData$Time, as.numeric(InterestedEnergyData$Global_active_power), type="l",
     xlab="", ylab="Globale active power (kw)") 
dev.off()