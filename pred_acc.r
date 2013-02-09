library(ggplot2)
library(reshape)

plot_data <- read.table("./result_data/pred_acc.txt", header=T, sep="\t")
plot_data[,1] <- c("In this study", "G-test","Non-filtering")

g <- ggplot(
  plot_data,
  aes(
    x      = Precision,
    y      = Recall, 
    )) +
  geom_point(
    aes(
      shape  = Type,
      colour = Type
      ),
    size = 5
    ) +
  ylim( 0, 1 ) +
  xlim( 0, 1 ) + 
  labs(
    #title="Comparison of previous identified editing site in dmel",
    y      = "Recall",
    x      = "Precision"
  ) +
  theme(
    legend.background = element_rect( fill=NA )
    ) +
  annotate(
    # F-mesure of Non-filtering
    "text",
    x     = 0.1,
    y     = 0.68,
    size  = 4,
    label = paste( "0.05" )
  ) +
  annotate(
    # F-mesure of In this study
    "text",
    x     = 0.28,
    y     = 0.037,
    size  = 4,
    label = paste( "0.06" )
  ) +
  annotate(
    # F-mesure of In this study
    "text",
    x     = 0.1,
    y     = 0.0048,
    size  = 4,
    label = paste( "0.006" )
  )

plot(g)
ggsave( filename=(paste("PrecisioRecall_plot.eps")), plot=g, width=6, height=4, dpi = 300, path="./figure/" )
