library(ggplot2)
library(reshape)

plot_data <- read.table("./result_data/pred_acc.txt", header=T, sep="\t")
plot_data[,1] <- c("In this study", "G-test","Initial call")

g <- ggplot(
  plot_data,
  aes(
    x      = Precision,
    y      = Recall,
    colour = factor(Type),
    )) +
  geom_point(
    size = 6
    ) +
  ylim( 0, 1 ) +
  xlim( 0, 1 ) + 
  labs(
    #title="Comparison of previous identified editing site in dmel",
    y      = "Recall",
    x      = "Precision",
    colour = ""
  ) +
  theme(
    legend.background = element_rect( fill=NA )
    )

plot(g)
ggsave( filename=(paste("PrecisioRecall_plot.eps")), plot=g, width=6, height=4, dpi = 300, path="./figure/" )
