library(ggplot2)
library(reshape)

locationSite <- read.table("Location_AGsite.txt", header=T)
LS_df <- melt(locationSite)

g <- ggplot(
  LS_df,
  aes( x = Type,
       y = value,
       fill = variable
       )
  ) +
    geom_bar ( alpha = 0.8,
               width = 0.5
             ) +
    ylim(0,40) + 
    labs ( 
        title = "Location A-to-G editing sites",
        y = "Frequency",
        x = "" 
        ) + scale_fill_brewer("", palette="Set1")

plot(g)
ggsave( filename=(paste("Location_AG_sites.png")), plot=g, width=6, height=4, dpi = 300 )