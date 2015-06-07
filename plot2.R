plot2<-function() {
     data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=rep(c("character"),each=9))
     DT<-data.table(data1)
     DT<-DT[,Date:={date<-Date;as.Date(date,"%d/%m/%Y")}]
     DT<-DT[DT$Date>="2007-02-01",]
     DT<-DT[DT$Date<="2007-02-02",]
     y<-DT$Time
     x<-as.character(DT$Date)
     neww<-paste(x,y)
     neww<-strptime(neww,format="%Y-%m-%d %H:%M:%S")
     png(file="plot2.png")
     plot(neww,DT[[3]],type="l",xlab="",ylab="Global Active Power (kilowatts)")
     dev.off()
}