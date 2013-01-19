library(ggplot2)
library(reshape)

editRatio_ALL <- read.table("/Volumes/BI/sandbox/EditingRatio_AG_ALL")
edit_df <- melt(editRatio_ALL$V5)
#plot(editRatio_ALL$V5*100, type="b", xlab="Editing sites (ranked)", ylab="Editing level (%)", pch=20, lwd=3, col="orange")

df <- data.frame(value=(1:107), variable=editRatio_ALL$V5*100)
g<- ggplot (
  df,
  aes ( x = value,
      y = variable )
  ) + geom_point (size = 3, col="orange" ) +
    geom_line ( size = 0.0, col="orange" ) + 
    labs( title = "",
          x = "Editing sites (ranked)",
          y = "Editing level (%)" )

plot(g)
ggsave( filename=(paste("ranked_editing.png")), plot=g, width=6, height=4, dpi = 300 )

