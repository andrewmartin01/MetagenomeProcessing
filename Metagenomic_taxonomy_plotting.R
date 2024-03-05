##Author
##Date
##Purpose

#packages------------------------------------------------------------------------
install.packages(c("gplots", "viridis"))
library(gplots)
library(viridis)

#import data---------------------------------------------------------------------

#Plot Heatmap--------------------------------------------------------------------
m <- as.matrix(Averaged_pooled_abundance_table[, -1])
rownames(m) <- Averaged_pooled_abundance_table$Species
#plot heatmap without strain dendogram
heatmap(m,Rowv = NA,col=magma(300))




#Plot alpha and beta diversity---------------------------------------------------

#plot relative and total abundance-----------------------------------------------