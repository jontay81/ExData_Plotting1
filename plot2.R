plot2 <- function(){
    #read csv file in
    file  <- read.csv("household_power_consumption.txt", header=TRUE, 
                                                         sep = ';', 
                                                         na.strings="?")
    #subset to just dates we are interested in
    file <- subset(file, Date == "1/2/2007" | Date=="2/2/2007")
    
    #Create dateTime by combining date and time
    dateTime <- with(file, paste(Date,Time, sep=" "))
    
    #convert to proper format and add to dataset as dateTime
    dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
    file$dateTime <- dateTime
    
    #create png device
    png("plot2.png", width=480, height=480)
    
    #plot line graph
    with(file, plot(dateTime, Global_active_power, type="l",
                                                   xlab="",
                                                   ylab="Global Active Power (kilowatts)"))
    #close device
    dev.off()
    
    
}