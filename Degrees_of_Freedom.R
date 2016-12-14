#degrees of freedom demo

plot(function(x) dt(x, 2), -8, 8, main="t(mean=1,sd=1)", ylab="Probability", xlab="T", lwd=2, col="blue")
abline(v=qt(c(0.025),2), col="blue")
abline(v=qt(c(0.975),2), col="blue")
       
curve(dt(x, 9), add=T, col="red")
abline(v=qt(c(0.025),9), col="red")
abline(v=qt(c(0.975),9), col="red")


