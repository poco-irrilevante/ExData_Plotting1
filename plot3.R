## Plot3.R
## Load required libraries
library(ggplot2) ## for ggplot
library(scales) ## for date scales
library(reshape2) # for melt
library(plyr) # for colwise

plot3 <- function(sourcePath) {
  ## Load the previously created tidy dataset
  period <- read.csv(paste(sourcePath,"/tidy.csv",sep=""),stringsAsFactors=FALSE)
  ## show the structure of the data
  str(period)
  ## melt the data
  period <- period[,5:8] ## only last four variables are required.
  period <- melt(period, names(period)[4], names(period)[1:3])
  
  ## convert the date/time string information
  period$TimeStamp <- strptime(period$TimeStamp, "%Y-%m-%d %H:%M:%S")
  
  ## first create a plot on the screen using ggplot
  graph <- ggplot(period, aes(x=TimeStamp, y=value,colour=variable)) +
    scale_x_datetime(breaks= "1 day", labels = date_format("%a")) +  ## per day with short weekday labels
    geom_line() + 
    xlab("") + ## remove x axis label
    ylab("Energy Sub metering") + ## set y axis label
    ## theme_classic() + ## basic theme to mimic plot
    theme(legend.position=c(.8,.8)) + ## legend top right
    theme(legend.title=element_blank())   ## remove legend title
    
  ## next save the result to a png file
  ggsave(file=paste(sourcePath,"/figure/plot3.png", sep=""), plot=graph, dpi=480)
  return(graph)
}
