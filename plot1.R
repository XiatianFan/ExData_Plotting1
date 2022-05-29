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
#histogram of global active power on 1/2/2007 and 2/2/2007
png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(InterestedEnergyData$Global_active_power)),
     col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()