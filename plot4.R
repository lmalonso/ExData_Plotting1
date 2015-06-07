plot4<-function() {
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
     png(file="plot4.png")
     par(mfrow=c(2,2))
     plot(neww,DT[[3]],xlab="",ylab="Global Active Power",type="l")
     plot(neww,DT[[5]],xlab="datetime",ylab="Voltage",type="l")
     plot(neww,var1,type="n",xlab="",ylab="Energy sub metering")
     points(neww,var1,type="l")
     points(neww,var2,type="l",col="red")
     points(neww,var3,type="l",col="blue")
     legend("topright",col=c("black","red","blue"),pch="-",lty="solid",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)
     plot(neww,DT[[4]],xlab="datetime",ylab="Global_reactive_power",type="l")
     dev.off()
}