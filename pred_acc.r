library(ggplot2)
library(reshape)

data <- read.table("pred_acc.txt", header=F, sep=":")
df <- melt(data)

g <- ggplot(
  df,
  aes( y = data$V2[1],
       x = data$V2[2]
  )
  ) + geom_point(colour = "orange",
                 size = 6
                 ) + ylim(0,1) + xlim(0,1) + 
                   labs (title="Comparison of previous identified editing site in dmel",
                         y = "Recall",
                         x = "Precision")
plot(g)
ggsave( filename=(paste("PrecisioRecall_plot.png")), plot=g, width=6, height=4, dpi = 300 )
