## This function read a csv file for input data 
## This function create a plot file plot1.png as output as per project1 requirements.
plot1<-function()
	{
	## Reads data from the input household_power_consumption file
	data<-read.csv("household_power_consumption.txt",sep=";")
	## Subset the data frame based on dates as per assignment
	data<-subset(data,as.character(data$Date)=="1/2/2007"|as.character(data$Date)=="2/2/2007")
	## remove "?" from the Global_active_power column
	data<-subset(data,as.character(data$Global_active_power)!="?")
	## define the file name and its width in pixels
	png("plot1.png",width = 480, height = 480)
	## plot the histogram set X-axis label and histogram title
	hist(as.numeric(as.character(data$Global_active_power)),xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red")
	## set the device off
	dev.off()
}

