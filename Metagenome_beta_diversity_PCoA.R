install.packages("ecodist")

library("ecodist")


#could also add clustering but maybe not for now

#aitchison
aitchison <- pco(as.dist(merged_abundance_table_aitchison))
aitchison_eigenvalues1<-aitchison$values[1]/sum(aitchison$values)*100
aitchison_eigenvalues2<-aitchison$values[2]/sum(aitchison$values)*100
plot(x=aitchison$vectors[,1],y=aitchison$vectors[,2],main = "Aitchison Distance PCoA",xlab= paste("PC1 ","(",round(aitchison_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PC2 ","(",round(aitchison_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")

#bray-curtis
bray_curtis <- pco(as.dist(merged_abundance_table_bray.curtis))
bray_curtis_eigenvalues1<-bray_curtis$values[1]/sum(bray_curtis$values)*100
bray_curtis_eigenvalues2<-bray_curtis$values[2]/sum(bray_curtis$values)*100
plot(x=bray_curtis$vectors[,1],y=bray_curtis$vectors[,2],main = "Bray-Curtis Distance PCoA",xlab= paste("PC1 ","(",round(bray_curtis_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PC2 ","(",round(bray_curtis_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("top", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")

#jaccard
jaccard <- pco(as.dist(merged_abundance_table_jaccard))
jaccard_eigenvalues1<-jaccard$values[1]/sum(jaccard$values)*100
jaccard_eigenvalues2<-jaccard$values[2]/sum(jaccard$values)*100
plot(x=jaccard$vectors[,1],y=jaccard$vectors[,2],main = "Jaccard Distance PCoA",xlab= paste("PC1 ","(",round(jaccard_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PC2 ","(",round(jaccard_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")

#unifrac weighted
unifrac_weighted <- pco(as.dist(merged_abundance_table_weighted.unifrac))
unifrac_weighted_eigenvalues1<-unifrac_weighted$values[1]/sum(unifrac_weighted$values)*100
unifrac_weighted_eigenvalues2<-unifrac_weighted$values[2]/sum(unifrac_weighted$values)*100
plot(x=unifrac_weighted$vectors[,1],y=unifrac_weighted$vectors[,2],main = "Unifrac Weighted Distance PCoA",xlab= paste("PC1 ","(",round(unifrac_weighted_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PC2 ","(",round(unifrac_weighted_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")

#unifrac unweighted
unifrac_unweighted <- pco(as.dist(merged_abundance_table_unweighted.unifrac))
unifrac_unweighted_eigenvalues1<-unifrac_unweighted$values[1]/sum(unifrac_unweighted$values)*100
unifrac_unweighted_eigenvalues2<-unifrac_unweighted$values[2]/sum(unifrac_unweighted$values)*100
plot(x=unifrac_unweighted$vectors[,1],y=unifrac_unweighted$vectors[,2],main = "Unifrac Unweighted Distance PCoA",xlab= paste("PC1 ","(",round(unifrac_unweighted_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PC2 ","(",round(unifrac_unweighted_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")

