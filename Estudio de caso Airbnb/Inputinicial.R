
load("C:/Users/lucia/OneDrive/Escritorio/Máster logística UOC/Métodos cuantitativos/MIC_20221_PEC1.xlsx")
editDataset(Dataset)
Pec1 <- readXL("C:/Users/lucia/OneDrive/Escritorio/Máster logística UOC/Métodos cuantitativos/MIC_20221_PEC1.xlsx",
   rownames=FALSE, header=TRUE, na="", sheet="dades", stringsAsFactors=TRUE)
summary(Pec1)
library(abind, pos=16)
library(e1071, pos=17)
numSummary(Pec1[,"price", drop=FALSE], statistics=c("mean", "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))
numSummary(Pec1[,"price", drop=FALSE], statistics=c("mean", "sd", "IQR", "quantiles", "cv", "skewness"), 
  quantiles=c(0,.25,.5,.75,1), type="2")

