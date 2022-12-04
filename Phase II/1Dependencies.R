
Dataset <- 
  readXL("C:/Users/lucia/OneDrive/Escritorio/Máster logística UOC/Métodos cuantitativos/PEC2/MIC_PEC2_20221.xlsx", 
  rownames=FALSE, header=TRUE, na="", sheet="MIC_PEC2_20221", stringsAsFactors=TRUE)
bedsmenosque7 <- subset(Dataset, subset=beds<7)
pricelessthan350 <- subset(bedsmenosque7, subset=<350)
pricemenosde350 <- subset(bedsmenosque7, subset=<350)
nuevodataset <- subset(bedsmenosque7, subset=<350)
pricemenosque350 <- subset(bedsmenosque7, subset=price<350)
library(lattice, pos=16)
library(survival, pos=16)
library(Formula, pos=16)
library(ggplot2, pos=16)
library(Hmisc, pos=16)
rcorr.adjust(pricemenosque350[,c("beds","price")], type="pearson", use="complete")
rcorr.adjust(pricemenosque350[,c("accommodates","bathrooms","bedrooms","price")], type="pearson", use="complete")

