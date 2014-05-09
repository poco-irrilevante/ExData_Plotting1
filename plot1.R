## Plot1.R
period <- read.csv("~/Courses/R-ExploratoryDataAnalysis/Data/ExData_Plotting1/tidy.csv")
str(period)
## first on the screen
hist(period$Global_active_power,main="Global active power", col="red", xlab="Global Active Power (kilowatts)")
## next save the result to a png file
dev.copy(png,filename="~/Courses/R-ExploratoryDataAnalysis/Data/ExData_Plotting1/figure/plot1.png", width = 480, height = 480)
dev.off()
