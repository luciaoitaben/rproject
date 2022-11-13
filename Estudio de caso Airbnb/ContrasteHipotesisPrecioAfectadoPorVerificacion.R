
Pec1 <- subset(Pec1, subset=price<=500)
t.test(price~host_identity_verified, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=Pec1)

