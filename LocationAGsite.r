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
  geom_bar() +
  labs ( 
    #title = "Location A-to-G editing sites",
    y     = "Percent",
    x     = "" 
    ) + #scale_fill_brewer( "", palette="Set1" ) +
      scale_fill_discrete( name = "",
                           labels=c( "UTR", "Intron", "Exon")
                           #labels=c("Active", "Tun", "Recovery_80m", "Recivery_3h", "Control")
                           ) +
      theme ( legend.position = "right" ) +
      theme(legend.background = element_rect(fill = NA))

plot( g )
ggsave( filename=(paste("Location_AG_sites.png")), plot=g, width=6.8, height=4, dpi = 300 )
