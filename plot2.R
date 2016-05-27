plot2<-function(){
        # Read in Dataset
        testset<- read.delim("./ProgAssign4ExpData/household_power_consumption.txt", 
                             sep=";", stringsAsFactors = FALSE, na.strings = "?")
        
        #format dates & times
        testset$Date<-as.Date(testset$Date,"%d/%m/%Y")
        testset$Time<-strptime(testset$Time,"%H:%M:%S")
        
        #subset
        subdata<-testset[testset$Date=="2007-02-01"|testset$Date=="2007-02-02",]
        
        #Open PNG
        png(file = "plot2.png", width = 480, height = 480)
        
        #creat graph
        plot(subdata$Global_active_power, type="l", main=NULL, 
             xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
        axis(1,c(1,1439,2879),c("Thu","Fri","Sat"))
        
        #output to png
        dev.off()
}