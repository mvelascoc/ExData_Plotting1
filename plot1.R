## Exploratory Data Analysis / Coursera / Aug 2014
## Project 1 / Plot 1

## load data

filePath <- "../../data/household_power_consumption.txt"
if (file.exists(filePath)) {
  print("Data File Found")
  #fullData <- read.table(filePath, sep=";", head = TRUE, na.strings = c("?"))

  ## subdata dates 2007-02-01 and 2007-02-02
  data <- read.table(filePath, sep=";", head = TRUE, na.strings = c("?"), skip= 66636, nrow = 2880)
  
  
  ## plot and save graphic
  png("plot1.png", width = 480, height = 480, units = 'px')
  hist(data[,3], 
       col="red",                             ### define your color
       main="Global Active Power",  ### main label
       xlab="Global Active Power (kilowatts)",         ### x-label
       ylab="Frequency")         ### y-label
  ## export image
  dev.off()
} else {
  print("Data File Not Found")
}
  

