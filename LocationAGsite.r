library(ggplot2)
library(reshape)

locationSite <- read.table("./result_data/Location_AGsite.txt", header=T)
LS_df        <- melt(locationSite)
LS_df$Type <- factor(LS_df$Type, c("Active", "Tun", "Recovery_80m", "Recovery_3h", "Control"))

g <- ggplot(
  LS_df,
  aes(
    x    = Type,
    y    = value,
    fill = variable
    )
  ) +
  geom_bar(
    width = 0.8
    ) +
  labs( 
    #title = "",
    y     = "Percent",
    x     = "" 
    ) +
  scale_fill_discrete(
    name = "",
    breaks=c( "UTR", "Intron", "Exon" )
    ) + 
  theme(
    legend.position   = "right",
    legend.background = element_rect( fill = NA ))

#plot( g )
ggsave( filename=(paste("Location_AG_sites.eps")), plot=g, width=6.8, height=4, dpi=300, path="./figure/" )
