e <- read.table(file="household_power_consumption.txt", header=TRUE, sep = ";")
f <-transform (e,Date = as.Date(Date,"%d/%m/%Y"))
g <- f[(f$Date <= "2007-02-02")&(f$Date >= "2007-02-01"),]
h <- transform(g,Global_active_power=as.numeric(Global_active_power),Global_reactive_power=as.numeric(Global_reactive_power),Voltage=as.numeric(Voltage),Global_intensity=as.numeric(Global_intensity),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3))
i <- transform(h,Global_active_power=Global_active_power/1000)
png(filename = "plot2.png",
    +     width = 480, height = 480, units = "px")
plot(i$Global_active_power,ylab="Global Active Power (kilowatts)", type="l", xaxt='n')
axis(side=1,at=c(0,1400,2800),labels=c("Thu","Fri","Sat"))
dev.off()