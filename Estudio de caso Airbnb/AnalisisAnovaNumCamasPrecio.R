
library(abind, pos=16)
library(e1071, pos=17)
numSummary(Pec1[,"price", drop=FALSE], groups=Pec1$beds_text, statistics=c("mean", "sd", "IQR", "quantiles", "cv"),
   quantiles=c(0,.25,.5,.75,1))
Pregunta2 <- subset(Pec1, subset=price <=500)
Pregunta2 <- within(Pregunta2, {
  gender <- factor(gender, labels=c('Hombre','Mujer'))
})
with(Pregunta2, Hist(beds, scale="frequency", breaks="Sturges", col="darkgray"))
with(Pregunta2, Hist(beds, scale="frequency", breaks="Sturges", col="darkgray"))
with(Pregunta2, Hist(price, scale="frequency", breaks="Sturges", col="darkgray"))
with(Pregunta2, Dotplot(beds, bin=FALSE))
indexplot(Pregunta2[,'beds', drop=FALSE], type='h', id.method='y', id.n=2)
library(aplpack, pos=18)
with(Pregunta2, stem.leaf(beds, na.rm=TRUE))
Boxplot( ~ beds, data=Pregunta2, id=list(method="y"))
with(Pregunta2, qqPlot(beds, dist="norm", id=list(method="y", n=2, labels=rownames(Pregunta2))))
with(Pregunta2, Barplot(beds_text, xlab="beds_text", ylab="Frequency", label.bars=TRUE))
library(colorspace, pos=19)
with(Pregunta2, piechart(gender, xlab="", ylab="", main="gender", col=rainbow_hcl(2), scale="percent"))
Pregunta2 <- subset(Pregunta2, subset=beds < 7)
AnovaModel.1 <- lm(price ~ beds_text, data=Pregunta2, contrasts=list(beds_text ="contr.Sum"))
Anova(AnovaModel.1)
Tapply(price ~ beds_text, mean, na.action=na.omit, data=Pregunta2) # means
Tapply(price ~ beds_text, sd, na.action=na.omit, data=Pregunta2) # std. deviations
xtabs(~ beds_text, data=Pregunta2) # counts

