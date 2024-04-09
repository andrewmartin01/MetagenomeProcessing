##Author: Andrew Martin
##Date: 3/5/2024
##Purpose: Make nice plots of data from MetaPhlan

#clear environment
rm(list = ls())

#packages------------------------------------------------------------------------
install.packages(c("gplots", "viridis"))
library(gplots)
library(viridis)

#PCA analysis
install.packages("corrr")
install.packages("ggcorrplot")
install.packages("FactoMineR")
install.packages("factoextra")


#Import data---------------------------------------------------------------------
library(readxl)
Averaged_pooled_abundance_table <- read_excel("C:/Users/andre/Downloads/Averaged_pooled_abundance_table.xlsx")

#Plot Heatmap--------------------------------------------------------------------
colnames(Averaged_pooled_abundance_table) <- c("Species","KA1","KA2","KA3","KA4","KA5","KA6","KA7","KA8","KA9","KA10","KA11","mAN1","mAN2","mAN3","mAN4","mAN5","mAN6","mAN7","mAN8","mAN9","mAN10","mAN11")
m <- as.matrix(Averaged_pooled_abundance_table[, -1])
rownames(m) <- Averaged_pooled_abundance_table$Species
#plot heatmap without strain dendogram
heatmap(m,Rowv = NA,col=magma(300))

legend(legend=magma(300))

#Plot stacked barplot------------------------------------------------------------

#remove all rows (species) that make up <3% of any sample
new_df <- m[rowSums(Averaged_pooled_abundance_table[, -1] > 3) > 0, ]

#relative abundance

#adjust margins
par(mar=c(4, 3, 3, 12), xpd=TRUE)
par(las=2)
barplot(m, main = "Relative Abundance",col = rainbow(9))
legend("topright", inset = c(-0.67, 0), title = "Species",legend= c(as.vector(Averaged_pooled_abundance_table$Species[0:9]))
       , horiz=FALSE,fill=rainbow(9),cex=0.8)

#axis(1, at = 1:ncol(m), labels = FALSE, tick = FALSE)
#text(1:ncol(m), par("usr")[3] - 0.5, labels = new_df$Species, srt = 90, adj = 1, xpd = TRUE, cex = 0.8)

#paired barplot
par(mar=c(5,5,5,5))
rowmean.KA<-rowMeans(m[,1:11])
rowmean.mAN<-rowMeans(m[,12:22])
paired.df<-data.frame(rowmean.KA,rowmean.mAN)
colnames(paired.df)<-c("KA","mAN")

#looks like shit
#heatmap(as.matrix(paired.df),col=rainbow(300),Colv=NA,Rowv = NA)

#log fold change
log2FoldChange.df<-data.frame(log2(paired.df$KA),log2(paired.df$mAN))
log2FoldChange.df<-data.frame(Averaged_pooled_abundance_table$Species,log2FoldChange.df$log2.paired.df.KA.-log2FoldChange.df$log2.paired.df.mAN.)



barplot(log2FoldChange)
#total abundance
barplot()

#Plot alpha and beta diversity---------------------------------------------------

#plot relative and total abundance-----------------------------------------------