#Setting working directory

setwd("D:\\<removed path>\\ExploratoryDataAnalysis")

# Creating a new directory

if (!file.exists("proj1")){dir.create("proj1")}

# Downloading the data from the link provided in the course project

fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile="./proj1/proj1.zip")

list.files("./proj1")

# Reading data into R

data<-read.table(unz("./proj1.zip","household_power_consumption.txt"),
                 header= TRUE, sep=";", quote="", dec=".", na.strings="?",
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

head(data)

sapply(data1,class)

# Subsetting the data

data1 <- data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

table(data$Date) # frequency of records in each date

rm(data) # remove bigger data to optimize memory 

#  Converting the DateTime variables to its appropriate classes

data1$DateTime <-strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

head(data1,2)

# Plotting the third graph in the PNG graphics device 

png(file="./proj1/ExData_Plotting1/plot3.png",width=480,height=480, units="px")

plot(data1$DateTime,data1$Sub_metering_1, col="black",type="l", xlab="",ylab="Energy Sub metering")
lines(data1$DateTime,data1$Sub_metering_2, col="red")
lines(data1$DateTime,data1$Sub_metering_3, col="blue")
legend ("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
