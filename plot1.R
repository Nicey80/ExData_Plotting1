plot1<-function(){
        # Read in Dataset
        testset<- read.delim("./ProgAssign4ExpData/household_power_consumption.txt", 
                     sep=";", stringsAsFactors = FALSE, na.strings = "?")

        #format dates & times
        testset$Date<-as.Date(testset$Date,"%d/%m/%Y")
        testset$Time<-strptime(testset$Time,"%H:%M:%S")
        
        #subset
        subdata<-testset[testset$Date=="2007-02-01"|testset$Date=="2007-02-02",]
        

        #Open PNG
        png(file = "plot1.png", width = 480, height = 480)
        
        #create graph
        hist(subdata$Global_active_power, col="red", main="Global Active Power",
             xlab="Global Active Power (kilowatts)")
        
        #output to png
        dev.off()
}