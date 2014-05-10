## Plot2.R
## Load required libraries
library(ggplot2) ## for ggplot
library(scales) ## for date scales

plot2 <- function(sourcePath) {
  period <- read.csv(paste(sourcePath,"/tidy.csv",sep=""),stringsAsFactors=FALSE)
  ## read the date / time information
  period$TimeStamp <- strptime(period$TimeStamp, "%Y-%m-%d %H:%M:%S")
  graph <- ggplot(period, aes(x=TimeStamp, y=Global_active_power)) +
    scale_x_datetime(breaks= "1 day", labels = date_format("%a")) +  ## per day with short weekday labels
    geom_line() + 
    xlab("") + ## remove x axis label
    ylab("Global Active Power (kilowatts)") 
  ## next save the result to a png file and return the plot
  ggsave(file=paste(sourcePath,"/figure/plot2.png", sep=""), plot=graph, dpi=480)
  return(graph)
}
