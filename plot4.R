plot4<-function(){
        # Read in Dataset
        testset<- read.delim("./ProgAssign4ExpData/household_power_consumption.txt", 
                             sep=";", stringsAsFactors = FALSE, na.strings = "?")
        
        #format dates & times
        testset$Date<-as.Date(testset$Date,"%d/%m/%Y")
        testset$Time<-strptime(testset$Time,"%H:%M:%S")
        
        #subset
        subdata<-testset[testset$Date=="2007-02-01"|testset$Date=="2007-02-02",]
        
        #Open PNG
        png(file = "plot4.png", width = 480, height = 480)
        
        #set params
        par(mfcol=c(2,2),cex=0.7)
        
        #add graph1
        plot(subdata$Global_active_power, type="l", main=NULL, 
             xlab="", ylab="Global Active Power", xaxt="n")
        axis(1,c(1,1439,2879),c("Thu","Fri","Sat"))
        
        #add graph2
        plot(subdata$Sub_metering_1, type="l", main=NULL, 
             xlab="", ylab="Energy sub metering", xaxt="n")
        points(subdata$Sub_metering_2, col="red", type="l")
        points(subdata$Sub_metering_3, col="blue", type="l")
        legend("topright",legend=c("Sub metering 1","Sub metering 2",
                "Sub metering 3"),col=c("black","red","blue"), lty=1, bty="n")
        axis(1,c(1,1439,2879),c("Thu","Fri","Sat"))
        
        #add graph3
        plot(subdata$Voltage, type="l", main=NULL, 
             xlab="datetime", ylab="Voltage", xaxt="n")
        axis(1,c(1,1439,2879),c("Thu","Fri","Sat"))
        
        #add graph4
        plot(subdata$Global_reactive_power, type="l", main=NULL, 
             xlab="datetime", ylab="Global_Reactive_Power", xaxt="n")
        axis(1,c(1,1439,2879),c("Thu","Fri","Sat"))
        
        #output to png
        dev.off()
}