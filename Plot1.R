getwd()
[1] "D:/Source Code/GitHub/Exploratory-Data-Analysis"
> library(data.table)
> library(lubridate)
> if (!file.exists('source data')) {
+     dir.create('source data')
+ }
> if (!file.exists('source data/power_consumption.txt')) {
+ 
variable.class<-c(rep('character',2),rep('numeric',7))
> power.consumption<-read.table('source data/household_power_consumption.txt',header=TRUE,
+                               sep=';',na.strings='?',colClasses=variable.class)
> power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
> cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
+         'SubMetering1','SubMetering2','SubMetering3')
> colnames(power.consumption)<-cols
> power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
> power.consumption<-power.consumption[,c(10,3:9)]
>     power.consumption<-read.table('source data/power_consumption.txt',header=TRUE,sep='|')
>     power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
> if (file.exists('source data/household_power_consumption.txt')) {
+     x<-file.remove('source data/household_power_consumption.txt')
+ }
> if (!file.exists('plots')) {
+     dir.create('plots')
+ }
> png(filename='plots/plot1.png',width=480,height=480,units='px')
> hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
> x<-dev.off()
