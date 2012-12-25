library(ggplot2)
library(reshape)

### Plotting overview of all base substitution type for each samples
Initial_set <- read.table("./Initial_set.txt", header = TRUE)
Final_set   <- read.table("./FinalFiteredSet.txt", header = TRUE)

# Plottting initial set
init_df <- melt(Initial_set)
g_init  <- ggplot(
  init_df,
  aes(
    x    = variable, 
    y    = value,      
    fill = Type
    )
  ) + geom_bar() +
  scale_fill_brewer("RNA-seq condition", palette = "Oranges") +
  labs (
    title = "All possible editing types in the initial candidate set",
    y     = "Mismatch count",
    x     = ""
    )
ggsave(filename = (paste("Initial_call.png")), plot = g_init, width = 6.1, height = 6, dpi = 300)

# Plotting filtered set
fin_df <- melt(Final_set)
g_filt <- ggplot(
  fin_df,
  aes(
    x    = variable,
    y    = value,      
    fill = Type
    )
  ) + geom_bar() +
  scale_fill_brewer("RNA-seq condition", palette = "Oranges") +
  labs(
    title = "Filnal filtered set",
    y     = "Mismatch count",
    x     = ""
    )
ggsave(filename = (paste("Final_Filted_call.png")), plot = g_filt, width = 6.1, height = 6, dpi = 300)
