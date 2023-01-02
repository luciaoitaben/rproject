
Dataset <- 
  readXL("C:/Users/lucia/OneDrive/Escritorio/Máster logística UOC/Métodos cuantitativos/PEC3/MIC_PEC3_20221.xlsx", 
  rownames=FALSE, header=TRUE, na="", sheet="MIC_PAC3_21221", stringsAsFactors=TRUE)
local({
  .FA <- 
  factanal(~accommodates+bathrooms+bedrooms+beds+price+review_accuracy+review_checkin+review_cleanliness+review_communication+review_location,
   factors=2, rotation="varimax", scores="regression", data=Dataset)
  print(.FA)
  Dataset <<- within(Dataset, {
    F2 <- .FA$scores[,2]
    F1 <- .FA$scores[,1]
  })
})
library(abind, pos=16)
library(e1071, pos=17)
numSummary(Dataset[,c("F1", "F2"), drop=FALSE], groups=Dataset$neighbourhood, statistics=c("mean", "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))
numSummary(Dataset[,c("F1", "F2"), drop=FALSE], groups=Dataset$neighbourhood, statistics=c("mean"), quantiles=c(0,.25,.5,.75,1))
Dataset <- subset(Dataset, subset=price<350)
numSummary(Dataset[,c("accommodates", "bathrooms", "bedrooms", "beds", "price"), drop=FALSE], groups=Dataset$neighbourhood, statistics=c("mean"), quantiles=c(0,.25,.5,.75,1))
Ejercicio3.1 <- readXL("C:/Users/lucia/OneDrive/Escritorio/Máster logística UOC/Métodos cuantitativos/PEC3/Ejercicio3.1.xlsx", rownames=FALSE, header=TRUE, na="", sheet="Sheet1", stringsAsFactors=TRUE)
HClust.1 <- hclust(dist(model.matrix(~-1 + accommodates+bathrooms+bedrooms+beds+price+review_accuracy+review_checkin+review_cleanliness+review_communication+review_location, Ejercicio3.1)) , method= "ward")
plot(HClust.1, main= "Cluster Dendrogram for Solution HClust.1", xlab= "Observation Number in Data Set Ejercicio3.1", sub="Method=ward; Distance=euclidian")
summary(as.factor(cutree(HClust.1, k = 2))) # Cluster Sizes
by(model.matrix(~-1 + accommodates + bathrooms + bedrooms + beds + price + review_accuracy + review_checkin + review_cleanliness + review_communication + review_location, Ejercicio3.1), as.factor(cutree(HClust.1, k = 2)), 
  colMeans) # Cluster Centroids
biplot(princomp(model.matrix(~-1 + accommodates + bathrooms + bedrooms + beds + price + review_accuracy + review_checkin + review_cleanliness + review_communication + review_location, Ejercicio3.1)), xlabs = 
  as.character(cutree(HClust.1, k = 2)))

