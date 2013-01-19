library(ggplot2)
library(reshape)

### Plotting overview of all base substitution type for each samples
Initial_set <- read.table( "./result_data/Initial_set.txt", header=TRUE )
Final_set   <- read.table( "./result_data/FinalFiteredSet.txt", header=TRUE )

# Plottting initial set
init_df      <- melt( Initial_set )
init_df$Type <- factor( init_df$Type, c("Active", "Tun", "Recovery_80min", "Recovery_3h") )

g_init <- ggplot(
  init_df,
  aes(
    x    = variable, 
    y    = value,
    fill = Type
    )
  ) + geom_bar() +
  scale_fill_brewer(
    name   = "RNA-seq condition",
    breaks = c( "Recovery_3h", "Recovery_80min", "Tun", "Active" )) +
  labs(
    #title = "",
    y     = "Mismatch count",
    x     = ""
    )
#plot( g_init )
ggsave( filename=(paste( "Initial_call.eps" )), plot=g_init, width=8, height=4, dpi=300, path="./figure/" )

# Plotting filtered set
fin_df      <- melt( Final_set )
fin_df$Type <- factor( fin_df$Type, c( "Active", "Tun", "Recovery_80min", "Recovery_3h" ))

g_filt <- ggplot(
  fin_df,
  aes(
    x    = variable,
    y    = value,      
    fill = Type
    )
  ) + geom_bar() +
  scale_fill_brewer(
    name   = "RNA-seq condition",
    breaks = c( "Recovery_3h", "Recovery_80min", "Tun", "Active" )) +
  labs(
    #title = "Filnal filtered set",
    y     = "Mismatch count",
    x     = ""
  )

ggsave( filename=(paste( "Final_Filted_call.eps" )), plot=g_filt, width=8, height=4, dpi=300, path="./figure/" )


