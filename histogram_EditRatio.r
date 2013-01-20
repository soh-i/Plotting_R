library(ggplot2)
library(reshape)

editRatio_ALL <- read.table("/Volumes/BI/sandbox/EditingRatio_AG_ALL")
edit_df <- melt(editRatio_ALL$V5*100)

g <- ggplot (
  edit_df,
  aes( x = value )
  ) +
  labs( 
    #title = "",
    y     = "Frequency",
    x     = "Editing level (%)"
    ) +
  geom_histogram(
    binwidth = 1,
    alpha    = 1,
    fill     = "orange",
    colour   = "black",
    size     = 0.1
    )

plot( g )
ggsave( filename=(paste("Editing_ratio.eps")), plot=g, width=6, height=4, dpi=300, path="./figure/" )
