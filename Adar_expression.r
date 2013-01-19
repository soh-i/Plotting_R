library(ggplot2)
library(reshape)

adar_fpkm <- read.table( "./result_data/Adar_yok.fpkm", header=T )
adar_df   <- melt( adar_fpkm )

g <- ggplot(
  adar_df,
  aes( x    = variable,
       y    = value,
       fill = YOKOZUNA_ADAR
       )
  ) +
  geom_bar(
    width = 0.5,
    alpha = 1,
  ) +
  ylim( 0, 80 ) + 
  labs(
    #title = "",
    y     = "FPKM",
    x     = ""
    ) +
  theme( legend.position = "none" )
  

plot(g)
ggsave( filename=(paste("Adar_expression_yok.eps")), plot=g, width=6, height=4, dpi = 300, path="./figure/" )

      
