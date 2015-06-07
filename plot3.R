plot3<-function() {
     data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=rep(c("character"),each=9))
     DT<-data.table(data1)
     DT<-DT[,Date:={date<-Date;as.Date(date,"%d/%m/%Y")}]
     DT<-DT[DT$Date>="2007-02-01",]
     DT<-DT[DT$Date<="2007-02-02",]
     y<-DT$Time
     x<-as.character(DT$Date)
     neww<-paste(x,y)
     neww<-strptime(neww,format="%Y-%m-%d %H:%M:%S")
     var1<-DT[[7]]
     var2<-DT[[8]]
     var3<-DT[[9]]
     png(file="plot3.png")
     plot(neww,var1,type="n",xlab="",ylab="Energy sub metering")
     points(neww,var1,type="l")
     points(neww,var2,type="l",col="red")
     points(neww,var3,type="l",col="blue")
     legend("topright",col=c("black","red","blue"),pch="-",lty="solid",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     dev.off()
}