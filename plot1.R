plot1 <-  function(){
    
    #read csv file in
    file  <- read.csv("household_power_consumption.txt", header=TRUE, 
                                                         sep = ';', 
                                                         na.strings="?")
    #subset to just dates we are interested in
    file <- subset(file, Date == "1/2/2007" | Date=="2/2/2007")
    
    #create png device
    png("plot1.png", width=480, height=480)
    
    #plot histogram
    with(file, hist(Global_active_power, main="Global Active Power", 
                                         xlab="Global Active Power (kilowatts)",
                                         col="red"))
    #close device
    dev.off()
}