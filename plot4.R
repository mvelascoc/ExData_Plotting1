
## Exploratory Data Analysis / Coursera / Aug 2014
## Project 1 / Plot 4

## load data

filePath <- "../../data/household_power_consumption.txt"
if (file.exists(filePath)) {
  print("Data File Found")
  #fullData <- read.table(filePath, sep=";", head = TRUE, na.strings = c("?"))
  
  ## subdata dates 2007-02-01 and 2007-02-02
  data <- read.table(filePath, sep=";", head = TRUE, na.strings = c("?"), skip= 66636, nrow = 2880)
  ## transform datatypes for processing
  
  Sys.setlocale("LC_TIME", "en_US") 
  dates <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
  dateDayNames <- strftime(dates, "%a")
  
  ## plot and save graphic
  png("plot4.png", width = 480, height = 480, units = 'px')
  par(mfrow = c(2,2))  # divide screen in 4 plots
  
  ## first plot
  plot(dates, data[,3], type="l",
       col="black",                             ### define your color
       main=" ",  ### main label
       ylab="Global Active Power" , 
       xlab = " "
  )         
  
  ## second plot
  plot(dates, data[,5], type="l",
       col="black",                             ### define your color
       main=" ",  ### main label
       ylab="Voltage" , 
       xlab = "datetime"
  )         
  
  
  
  ## third plot
  
  plot(dates, data[,7], type="l",  col="black", 
       ylab="Energy sub metering" , xlab = " "
  )         
  
  lines(dates, data[,8], type="l", col="red")
  lines(dates, data[,9], type="l", col="blue")
  
  legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
         col=c("black", "red", "blue"))
  
  
  ## fourth plot
  plot(dates, data[,4], type="l",
       col="black",                             ### define your color
       main=" ",  ### main label
       ylab="Global_reactive_time" , 
       xlab = "datetime"
  )         
  
  ## export image
  dev.off()
} else {
  print("Data File Not Found")
}


