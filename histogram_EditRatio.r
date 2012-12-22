library(ggplot2)
library(reshape)

editRatio_ALL <- read.table("/Volumes/BI/sandbox/EditingRatio_AG_ALL")
edit_df <- melt(editRatio_ALL$V5)

g <- ggplot (
  edit_df,
  aes ( x = value )
  ) +
  labs( 
    title = "Histogram of A-to-G editing level",
    y = "Frequency",
    x = "Editing ratio"
    ) +
  geom_histogram (
    binwidth = 0.01,
    alpha = 0.8,
    fill = "red",
    )

plot(g)
ggsave( filename=(paste("Editing_ratio.png")), plot=g, width=6, height=4, dpi = 300 )
