## Plot4.R
## Load required libraries
library(ggplot2) ## for ggplot
library(gridExtra)

plot4 <- function(sourcePath) {
  ## Load the plot script files
  source(paste(sourcePath,"/plot1.R",sep="")) 
  source(paste(sourcePath,"/plot2.R",sep="")) 
  source(paste(sourcePath,"/plot3.R",sep="")) 
  source(paste(sourcePath,"/plot5.R",sep="")) 
  plot1 <- plot1(sourcePath)
  plot2 <- plot2(sourcePath)
  plot3 <- plot3(sourcePath)
  plot5 <- plot5(sourcePath)
  ## arrange the plots into a single composition
  graph <- arrangeGrob(plot1, plot2, plot3, plot5, nrow=2, ncol=2)
  ## Save the plot and return the plot
  ggsave(file=paste(sourcePath,"/figure/plot4.png", sep=""), plot=graph, dpi=480)
  return(graph)
}
