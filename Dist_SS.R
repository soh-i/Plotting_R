library(ggplot2)
library(reshape)

# Plotting for "Distance from splice sites of putative editing sites"

MergedDist <- read.table( "/Volumes/BI/RNA_editing/Merged_dist.list", header=T, sep="\t" )
df <- melt( MergedDist )

g <- ggplot(
  df,
  aes( x=value, fill=variable )
) +
  labs( 
    title = "",
    y = "Frequency",
    x = "Relative position (bp)"
    ) +
  geom_histogram(
    binwidth = 10,
    alpha    = 1,
    position = "dodge"
    ) +
  xlim ( -1000, 1000 ) +
  scale_fill_discrete (
    name = "",
    labels = c( "Control site", "A-to-G site" )
    ) + 
  theme(
    legend.position      = c( 0.95, 0.95 ),
    legend.justification = c( 1, 1 ),
    legend.background    = element_rect( fill=NA )
  )

plot( g )
ggsave( filename=( paste( "Distance_SS.eps" ) ), plot=g, width=6, height=4, dpi=300, path="./figure/" )

