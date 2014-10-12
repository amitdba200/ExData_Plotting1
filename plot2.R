## This function read a csv file for input data 
## converts Date and time strings to DateTime using strptime
## This function create a plot file plot2.png as output as per project1 requirements.
plot2<-function()
	{
	## Reads data from the input household_power_consumption file
	data<-read.csv("household_power_consumption.txt",sep=";")
	## Subset the data frame based on dates as per assignment
	data<-subset(data,as.character(data$Date)=="1/2/2007"|as.character(data$Date)=="2/2/2007")
	## remove "?" from the Global_active_power column
	data<-subset(data,as.character(data$Global_active_power)!="?")
	## concatenate Date and Time to Date column and changes its format to DateTime
	data$Date<-strptime(as.character(paste(data$Date, data$Time, sep=",")), format="%d/%m/%Y,%H:%M:%S")
	## define the output file name and its width in pixels
 	png("plot2.png",width = 480, height = 480)
	## plot the graph set Y-axis label define graph type
	plot(data$Date,as.numeric(as.character(data$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
	## set the device off
	dev.off()
	}

