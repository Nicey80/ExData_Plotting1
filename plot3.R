plot3<-function(){
        # Read in Dataset
        testset<- read.delim("./ProgAssign4ExpData/household_power_consumption.txt", 
                             sep=";", stringsAsFactors = FALSE, na.strings = "?")
        
        #format dates & times
        testset$Date<-as.Date(testset$Date,"%d/%m/%Y")
        testset$Time<-strptime(testset$Time,"%H:%M:%S")
        
        #subset
        subdata<-testset[testset$Date=="2007-02-01"|testset$Date=="2007-02-02",]

        #Open PNG
        png(file = "plot3.png", width = 480, height = 480)
        
        #create graph
        plot(subdata$Sub_metering_1, type="l", main=NULL, 
             xlab="", ylab="Energy sub metering", xaxt="n")
        points(subdata$Sub_metering_2, col="red", type="l")
        points(subdata$Sub_metering_3, col="blue", type="l")
        
        legend("topright",legend=c("Sub metering 1","Sub metering 2",
                "Sub metering3"),col=c("black","red","blue"), lty=1)
        
        axis(1,c(1,1439,2879),c("Thu","Fri","Sat"))
        
        #output to png
        dev.off()
}