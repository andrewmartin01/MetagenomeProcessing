
#install packages
install.packages("ecodist")


# Loading package 
library(ClusterR) 
library(cluster) 
library(ecodist)
library(vegan)


#import data---NEED TO FIX
merged_abundance_table_weighted.unifrac<-read.table(file = "C:/Users/andre/Downloads/merged_abundance_table_weighted-unifrac.tsv", sep = '\t', header=TRUE)
merged_abundance_table_unweighted.unifrac<-read.table(file = "C:/Users/andre/Downloads/merged_abundance_table_unweighted-unifrac.tsv", sep = '\t', header=TRUE)
merged_abundance_table_aitchison<-read.table(file = "C:/Users/andre/Downloads/merged_abundance_table_aitchison.tsv", sep = '\t', header=TRUE)
merged_abundance_table_bray.curtis<-read.table(file = "C:/Users/andre/Downloads/merged_abundance_table_bray-curtis.tsv", sep = '\t', header=TRUE)
merged_abundance_table_jaccard<-read.table(file = "C:/Users/andre/Downloads/merged_abundance_table_jaccard.tsv", sep = '\t', header=TRUE)



#aitchison
aitchison <- pco(as.dist(merged_abundance_table_aitchison))
aitchison_eigenvalues1<-aitchison$values[1]/sum(aitchison$values)*100
aitchison_eigenvalues2<-aitchison$values[2]/sum(aitchison$values)*100
plot(x=aitchison$vectors[,1],y=aitchison$vectors[,2],main = "Aitchison Distance PCoA",xlab= paste("PCo1 ","(",round(aitchison_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PCo2 ","(",round(aitchison_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")
clusplot(merged_abundance_table_aitchison ,main = "Aitchison Distance PCA", clus = c(1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2))
  #making the df for plotting of the PCoA with ellipses
  Treatment<- c("KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN")
  aitchison.df<-data.frame(aitchison$vectors[,1],aitchison$vectors[,2],Treatment)
  colnames(aitchison.df)<-c("PCoA1","PCoA2","Treatment")
  #png(filename = "C:/Users/andre/OneDrive/Documents/Beta_diversity_plotting/Aitchison_Distance.png")
  ggplot(mapping=aes(x=aitchison$vectors[,1],y=aitchison$vectors[,2],color=Treatment,shape=Treatment))+
    geom_point(size=3)+stat_ellipse()+theme_bw()+ggtitle("Aitchison Distance PCoA")+
    theme(plot.title = element_text(hjust = 0.5))+
    xlab(label=paste("PC1 ","(",round(aitchison_eigenvalues1,digits = 1),"%)",sep=""))+
    ylab(label=paste("PC2 ","(",round(aitchison_eigenvalues2,digits = 1),"%)",sep=""))
    
  #dev.off()
  #PERMANOVA
  #p=0.001
  adonis2(as.dist(merged_abundance_table_aitchison)~Treatment,method = "aitchison")
  
  #ANCOM

#bray-curtis
bray_curtis <- pco(as.dist(merged_abundance_table_bray.curtis))
bray_curtis_eigenvalues1<-bray_curtis$values[1]/sum(bray_curtis$values)*100
bray_curtis_eigenvalues2<-bray_curtis$values[2]/sum(bray_curtis$values)*100
plot(x=bray_curtis$vectors[,1],y=bray_curtis$vectors[,2],main = "Bray-Curtis Distance PCoA",xlab= paste("PCo1 ","(",round(bray_curtis_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PCo2 ","(",round(bray_curtis_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("top", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")
clusplot(merged_abundance_table_bray.curtis ,main = "Bray-Curtis Distance PCA", clus = c(1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2))
#making the df for plotting of the PCoA with ellipses
Treatment<- c("KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN")
bray_curtis.df<-data.frame(bray_curtis$vectors[,1],bray_curtis$vectors[,2],Treatment)
colnames(bray_curtis.df)<-c("PCoA1","PCoA2","Treatment")
#png(filename = "C:/Users/andre/OneDrive/Documents/Beta_diversity_plotting/Bray_Curtis_Distance.png")
ggplot(mapping=aes(x=bray_curtis$vectors[,1],y=bray_curtis$vectors[,2],color=Treatment,shape=Treatment))+
  geom_point(size=3)+stat_ellipse()+theme_bw()+ggtitle("Bray-Curtis Distance PCoA")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab(label=paste("PC1 ","(",round(bray_curtis_eigenvalues1,digits = 1),"%)",sep=""))+
  ylab(label=paste("PC2 ","(",round(bray_curtis_eigenvalues2,digits = 1),"%)",sep=""))

  #dev.off()
  #PERMANOVA
  #p=0.073
  adonis2(as.dist(merged_abundance_table_bray.curtis)~Treatment,method = "bray")


#jaccard
jaccard <- pco(as.dist(merged_abundance_table_jaccard))
jaccard_eigenvalues1<-jaccard$values[1]/sum(jaccard$values)*100
jaccard_eigenvalues2<-jaccard$values[2]/sum(jaccard$values)*100
plot(x=jaccard$vectors[,1],y=jaccard$vectors[,2],main = "Jaccard Distance PCoA",xlab= paste("PCo1 ","(",round(jaccard_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PCo2 ","(",round(jaccard_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")
clusplot(merged_abundance_table_jaccard ,main = "Jaccard Distance PCA", clus = c(1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2))
#making the df for plotting of the PCoA with ellipses
Treatment<- c("KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN")
jaccard.df<-data.frame(jaccard$vectors[,1],jaccard$vectors[,2],Treatment)
colnames(jaccard.df)<-c("PCoA1","PCoA2","Treatment")
#png(filename = "C:/Users/andre/OneDrive/Documents/Beta_diversity_plotting/Jaccard_Distance.png")
ggplot(mapping=aes(x=jaccard$vectors[,1],y=jaccard$vectors[,2],color=Treatment,shape=Treatment))+
  geom_point(size=3)+stat_ellipse()+theme_bw()+ggtitle("Jaccard Distance PCoA")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab(label=paste("PC1 ","(",round(jaccard_eigenvalues1,digits = 1),"%)",sep=""))+
  ylab(label=paste("PC2 ","(",round(jaccard_eigenvalues2,digits = 1),"%)",sep=""))


  #dev.off()
  #PERMANOVA
  #p=0.017
  
  adonis2(as.dist(merged_abundance_table_jaccard)~Treatment,method = "jaccard")


#unifrac weighted
unifrac_weighted <- pco(as.dist(merged_abundance_table_weighted.unifrac))
unifrac_weighted_eigenvalues1<-unifrac_weighted$values[1]/sum(unifrac_weighted$values)*100
unifrac_weighted_eigenvalues2<-unifrac_weighted$values[2]/sum(unifrac_weighted$values)*100
plot(x=unifrac_weighted$vectors[,1],y=unifrac_weighted$vectors[,2],main = "Unifrac Weighted Distance PCoA",xlab= paste("PCo1 ","(",round(unifrac_weighted_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PCo2 ","(",round(unifrac_weighted_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")
clusplot(merged_abundance_table_weighted.unifrac ,main = "Unifrac Weighted Distance PCA", clus = c(1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2))
#making the df for plotting of the PCoA with ellipses
Treatment<- c("KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN")
unifrac_weighted.df<-data.frame(unifrac_weighted$vectors[,1],unifrac_weighted$vectors[,2],Treatment)
colnames(unifrac_weighted.df)<-c("PCoA1","PCoA2","Treatment")
#png(filename = "C:/Users/andre/OneDrive/Documents/Beta_diversity_plotting/Unifrac_Weighted_Distance.png")
ggplot(mapping=aes(x=unifrac_weighted$vectors[,1],y=unifrac_weighted$vectors[,2],color=Treatment,shape=Treatment))+
  geom_point(size=3)+stat_ellipse()+theme_bw()+ggtitle("Unifrac Weighted Distance PCoA")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab(label=paste("PC1 ","(",round(unifrac_weighted_eigenvalues1,digits = 1),"%)",sep=""))+
  ylab(label=paste("PC2 ","(",round(unifrac_weighted_eigenvalues2,digits = 1),"%)",sep=""))

#dev.off()

#unifrac unweighted
unifrac_unweighted <- pco(as.dist(merged_abundance_table_unweighted.unifrac))
unifrac_unweighted_eigenvalues1<-unifrac_unweighted$values[1]/sum(unifrac_unweighted$values)*100
unifrac_unweighted_eigenvalues2<-unifrac_unweighted$values[2]/sum(unifrac_unweighted$values)*100
plot(x=unifrac_unweighted$vectors[,1],y=unifrac_unweighted$vectors[,2],main = "Unifrac Unweighted Distance PCoA",xlab= paste("PCo1 ","(",round(unifrac_unweighted_eigenvalues1,digits = 2),"%)",sep=""),ylab = paste("PCo2 ","(",round(unifrac_unweighted_eigenvalues2,digits = 2),"%)",sep=""),
     col=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red","red","red","red"),pch=16,cex=1.5)
grid(lty = 1)
legend("topright", legend = c("KA", "mAN"), fill = c("blue", "red"), title = "Treatment")
clusplot(merged_abundance_table_unweighted.unifrac ,main = "Unifrac Unweighted Distance PCA", clus = c(1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2))
#making the df for plotting of the PCoA with ellipses
Treatment<- c("KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","KA","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN","mAN")
unifrac_unweighted.df<-data.frame(unifrac_unweighted$vectors[,1],unifrac_unweighted$vectors[,2],Treatment)
colnames(unifrac_unweighted.df)<-c("PCoA1","PCoA2","Treatment")
#png(filename = "C:/Users/andre/OneDrive/Documents/Beta_diversity_plotting/Unifrac_unweighted_Distance.png")
ggplot(mapping=aes(x=unifrac_unweighted$vectors[,1],y=unifrac_unweighted$vectors[,2],color=Treatment,shape=Treatment))+
  geom_point(size=3)+stat_ellipse()+theme_bw()+ggtitle("Unifrac Unweighted Distance PCoA")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab(label=paste("PC1 ","(",round(unifrac_unweighted_eigenvalues1,digits = 1),"%)",sep=""))+
  ylab(label=paste("PC2 ","(",round(unifrac_unweighted_eigenvalues2,digits = 1),"%)",sep=""))

#dev.off()

