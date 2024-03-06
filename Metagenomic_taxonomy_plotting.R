##Author: Andrew Martin
##Date: 3/5/2024
##Purpose: Make nice plots of data from MetaPhlan

#packages------------------------------------------------------------------------
install.packages(c("gplots", "viridis"))
library(gplots)
library(viridis)

#Import data---------------------------------------------------------------------

#Plot Heatmap--------------------------------------------------------------------
m <- as.matrix(Averaged_pooled_abundance_table[, -1])
rownames(m) <- Averaged_pooled_abundance_table$Species
#plot heatmap without strain dendogram
heatmap(m,Rowv = NA,col=magma(300))

#Plot stacked barplot------------------------------------------------------------

#remove all rows (species) that make up <3% of any sample
new_df <- Averaged_pooled_abundance_table[rowSums(Averaged_pooled_abundance_table[, -1] > 3) > 0, ]

#relative abundance

#adjust margins
par(mar=c(4, 3, 3, 12), xpd=TRUE)
par(las=2)
barplot(m, main = "Relative Abundance",col = rainbow(9))
legend("topright", inset = c(-0.67, 0), title = "Species",legend= c(as.vector(new_df$Species))
       , horiz=FALSE,fill=rainbow(9),cex=0.8)

#axis(1, at = 1:ncol(m), labels = FALSE, tick = FALSE)
#text(1:ncol(m), par("usr")[3] - 0.5, labels = new_df$Species, srt = 90, adj = 1, xpd = TRUE, cex = 0.8)

#total abundance
barplot()

#Plot alpha and beta diversity---------------------------------------------------

#plot relative and total abundance-----------------------------------------------