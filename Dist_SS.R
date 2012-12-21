library(ggplot2)
library(reshape)

DistfromSpliceSite <- read.table("/Volumes/BI/RNA_editing/Dist_spliceSite_all.list", header=F)
distSS_df <- melt(DistfromSpliceSite$V1)

g <- ggplot (
  distSS_df,
  aes ( x = value )
) +
  labs( 
    title = "Distance from splice sites of putative editing sites",
    y = "Frequency",
    x = "Relative position(bp)"
  ) +
    geom_histogram (
      binwidth = 10,
      alpha = 0.8,
      fill = "blue" 
      ) + xlim (-1000, 1000)

plot(g)
ggsave( filename=(paste("Distance_SS.png")), plot=g, width=6, height=4, dpi = 300 )
