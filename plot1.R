plot1<-function() {
     data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=rep(c("character"),each=9))
     DT<-data.table(data1)
     DT<-DT[,Date:={date<-Date;as.Date(date,"%d/%m/%Y")}]
     DT<-DT[DT$Date>="2007-02-01",]
     DT<-DT[DT$Date<="2007-02-02",]
     png(file="plot1.png")
     hist(as.numeric(DT[[3]]),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
     dev.off()
}