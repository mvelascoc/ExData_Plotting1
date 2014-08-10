## Exploratory Data Analysis / Coursera / Aug 2014
## Project 1 / Plot 2

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
  png("plot2.png", width = 480, height = 480, units = 'px')
  plot(dates, data[,3], type="l",
       col="black",                             ### define your color
       main=" ",  ### main label
       ylab="Global Active Power (kilowatts)" , 
       xlab = " "
       )         
  ## export image
  dev.off()
} else {
  print("Data File Not Found")
}


