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

# Plotting the second graph in the PNG graphics device 

png(file="./proj1/ExData_Plotting1/plot2.png",width=480,height=480, units="px")

plot(data1$DateTime,data1$Global_active_power,type="l", 
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
