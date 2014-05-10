## Plot1.R
library(ggplot2) ## for ggplot
library(scales) ## for date scales
library(reshape2) # for melt
library(plyr) # for colwise

plot1 <- function(sourcePath) {
  period <- read.csv(paste(sourcePath,"/tidy.csv",sep=""),stringsAsFactors=FALSE)
  graph <- ggplot(period, aes(x=Global_active_power)) +
    geom_histogram(aes(fill="red",colour="black"),binwidth = .5) + 
    xlab("Global Active Power (kilowatts)") +
    ylab("Frequency") +
    labs(title = "Global Active Power") +
    theme(legend.position = "none") 
  ## next save the result to a png file
  ggsave(file=paste(sourcePath,"/figure/plot1.png", sep=""), plot=graph, dpi=480)
  return(graph)
}

