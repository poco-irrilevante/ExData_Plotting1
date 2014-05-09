## Plot2.R
period <- read.csv("~/Courses/R-ExploratoryDataAnalysis/Data/ExData_Plotting1/tidy.csv",stringsAsFactors=FALSE)
## Check the data using str, head and tail
str(period)
head(period)
tail(period)
## read the date / time information
period$TimeStamp <- strptime(period$TimeStamp, "%Y-%m-%d %H:%M:%S")
## first create a plot on the screen
plot(period$TimeStamp,period$Global_active_power,  type="n", xlab=format(period$TimeStamp,"%a"), ylab="Global Active Power (kilowatts)")
lines(period$TimeStamp,period$Global_active_power)
## next save the result to a png file
dev.copy(png,filename="~/Courses/R-ExploratoryDataAnalysis/Data/ExData_Plotting1/figure/plot2.png", width = 480, height = 480)
dev.off()
