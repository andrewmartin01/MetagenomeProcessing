#static 3D plot
install.packages("scatterplot3d")
library(scatterplot3d)
#vector of colors corresponding to treatment
treatmentColor <- c("red","red","red","red","red","red","red","red","red","red","red","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue","blue")
scatterplot3d(x=X3D_PCA_Plotting$PC1,y=X3D_PCA_Plotting$PC2,z=,X3D_PCA_Plotting$PC3,color=treatmentColor)


#Interactive 3D plot
install.packages("plotly")
library("plotly")

plot_ly(data = X3D_PCA_Plotting,x=X3D_PCA_Plotting$PC1,y=X3D_PCA_Plotting$PC2,z=X3D_PCA_Plotting$PC3,color = X3D_PCA_Plotting$Treatment) %>%
  add_markers()%>%
  layout(scene = list(xaxis = list(title = "PC1 (21.84%)"),
                      yaxis = list(title = "PC2 (16.17%)"),
                      zaxis = list(title = "PC3 (12.88%)"),
                      aspectmode = "cube"),
         title = "PCA Scores")



#Clustering on the 2D plot
X2D_PCA_Plotting<-X3D_PCA_Plotting[,-3]#only need 2 dimensions
X2D_PCA_Plotting<-X2D_PCA_Plotting[,-3]#only need 2 dimensions

fviz_nbclust(X2D_PCA_Plotting, kmeans, method = 'wss')#determine number of clusters needed
fviz_nbclust(X2D_PCA_Plotting, kmeans, method = 'silhouette')
fviz_nbclust(X2D_PCA_Plotting, kmeans, method = 'gap_stat')#2 clusters optimal

kmeans_metaphlan <-kmeans(X2D_PCA_Plotting,centers=2)
fviz_cluster(kmeans_metaphlan, data = X2D_PCA_Plotting)
#resulting 2 clusters shows that there is clearly one sample that is an outgroup