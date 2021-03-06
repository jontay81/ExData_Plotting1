plot4 <-  function(){
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
    png("plot4.png", width=480, height=480)
    
    #create 2x2 layout
    par(mfrow=c(2,2))
    
    #### PLOT Top Left ####
    with(file, plot(dateTime, Global_active_power, type="l",
                                                   xlab="",
                                                   ylab="Global Active Power (kilowatts)"))
    
    #### PLOT Top Right ####
    with(file, plot(dateTime, Voltage, xlab='datetime', type='l'))
    
    #### PLOT Bottom Left ####
    #plot line graph for each of the sub metering columns
    with(file, {
        #all commands in brackets done with file
        plot(dateTime, Sub_metering_1, type='l', 
                                       xlab='', 
                                       ylab="Energy sub metering")
        
        lines(dateTime, Sub_metering_2, type='l', col='red')
        lines(dateTime, Sub_metering_3, type='l', col='blue')
    })
    
    #create legend for the plot
    legend('topright', 
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
           lwd='1', 
           col=c('black', 'red', 'blue'))
    
    #### PLOT Bottom Right ####
    with(file, plot(dateTime, Global_reactive_power, xlab='datetime', type='l'))
    
    
    #close device
    dev.off()

}