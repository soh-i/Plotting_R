library(ggplot2)
library(reshape)

locationSite <- read.table("./result_data/Location_AGsite.txt", header=T)
LS_df        <- melt(locationSite)
LS_df$Type <- factor(LS_df$Type, c("Active", "Tun", "Recovery_80m", "Recovery_3h", "Control"))
LS_df$variable <- factor(LS_df$variable, c("UTR", "Intron", "Exon"))

g <- ggplot(
  LS_df,
  aes(
    x    = Type,
    y    = value,
    fill = variable
    )
  ) +
  geom_bar(
    stat="identity",
    width = 0.7
    ) +
  ylim( 0, 106 ) + 
  labs( 
    #title = "",
    y     = "Percent",
    x     = "" 
    ) +
  scale_fill_discrete(
    name = "",
    labels=c( "UTRs", "Intron", "Exon" )
    ) + 
  theme(
    legend.position   = "right",
    legend.background = element_rect( fill=NA )
  ) +
  annotate(
    "text",
    x     = 1.3,
    y     = 105,
    size  = 4,
    label = paste( "p-value = 0.8704" )
    )

plot( g )
ggsave( filename=(paste("Location_AG_sites.eps")), plot=g, width=6.8, height=4, dpi=300, path="./figure/" )
