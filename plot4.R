## This function read a csv file for input data 
## This function create a 4 plots in 1 file plot4.png as output as per project1 requirements.
plot4<-function()
	{
 	## Common code for all the plots 
	## Reads data from the input household_power_consumption file
	data<-read.csv("household_power_consumption.txt",sep=";")
	## Subset the data frame based on dates as per assignment
	data<-subset(data,as.character(data$Date)=="1/2/2007"|as.character(data$Date)=="2/2/2007")
	## remove "?" from the Global_active_power column
	data<-subset(data,as.character(data$Global_active_power)!="?")
	## remove "?" from the Global_reactive_power column
	data<-subset(data,as.character(data$Global_reactive_power)!="?")
	## remove "?" from the Voltage column
	data<-subset(data,as.character(data$Voltage)!="?")
	## remove "?" from the columns
	data<-subset(data,as.character(data$Sub_metering_1)!="?")
	data<-subset(data,as.character(data$Sub_metering_2)!="?")
	data<-subset(data,as.character(data$Sub_metering_3)!="?")
	## concatenate Date and Time to Date column and changes its format to DateTime
	data$Date<-strptime(as.character(paste(data$Date, data$Time, sep=",")), format="%d/%m/%Y,%H:%M:%S")
	## Starting the plotting here - 4 plots
	## define the file name and its width in pixels
	png("plot4.png",width = 480, height = 480)
	## define layout for the output png file
	par(mfrow=c(2,2))
	## plot the graph set Y-axis label define graph type
	plot(data$Date,as.numeric(as.character(data$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
	## plot the graph set Y-axis label define graph type - Voltage
	plot(data$Date,as.numeric(as.character(data$Voltage)), type = "l", xlab = "", ylab = "Voltage")
	## plot the graph set Y-axis label define graph type
	plot(data$Date, as.numeric(as.character(data$Sub_metering_1)),type = "n", xlab = "",ylab = "Energy sub metering")
	## Plot line for Sub_metering_1 column values
	lines(data$Date, as.numeric(as.character(data$Sub_metering_1)),col="black")
	## Plot line for Sub_metering_2 column values
	lines(data$Date, as.numeric(as.character(data$Sub_metering_2)),col="red")
	## Plot line for Sub_metering_3 column values
	lines(data$Date, as.numeric(as.character(data$Sub_metering_3)),col="blue")
	## Add legends to this graph
	legend( x="topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),col=c("black","red","blue"), lwd=1, lty=1,bty="n")
	## plot the graph set Y-axis label define graph type
	##plot(data$Date,as.numeric(as.character(data$Global_reactive_power)), type = "l", xlab = "", ylab = "Global_reactive_power")
	## set the device off
	dev.off()
}

