library(animation)
library(geneplotter)

#true mean
trueMean<-1
alternativeMean<-2
n<-15

#sample 15 data points from a gamma with shape=1 and scale=1
samplePopulation1<-rnorm(n,trueMean,1)
samplePopulation2<-rnorm(n,alternativeMean,1)

tVector1<-numeric()
tVector2<-numeric()

#saveGIF({#uncomment this line to produce animated gif
  #animation options
  options<-ani.options(nmax=250, interval=0.2)
  
  for(i in 1:ani.options("nmax")){
  
    par(mfrow=c(2,2))
    
    plot(function(x) dnorm(x, trueMean, 1), -5, 10, main="True Ho", ylab="Density", xlab="Size", col="dark green", lwd=2)
    abline(v=1, col="green", lwd=3)
    plot(function(x) dnorm(x, alternativeMean, 1), -5, 10, main="False Ho", ylab="Density", xlab="Size", col="dark blue", lwd=2)
    abline(v=1, col="green", lwd=3)
    
    #calculate t value
    
    t1<-(mean(samplePopulation1)-trueMean)/(sd(samplePopulation1)/sqrt(n))
    t2<-(mean(samplePopulation2)-trueMean)/(sd(samplePopulation2)/sqrt(n))
    
    tVector1<-c(tVector1, t1)
    tVector2<-c(tVector2, t2)
      
    hist(tVector1, main="Histogram of t values when sampling from Ho")
    hist(tVector2, main="Histogram of t values when sampling from Ha")
    title("Testing population mean is equal to 1. n=15", outer=T, line=-1)
    ani.pause()
    
    samplePopulation1<-rnorm(n,trueMean,1)
    samplePopulation2<-rnorm(n,alternativeMean,1)
  }
#}, movie.name = "T_Test.gif", ani.width=800, ani.height=600)#uncomment this line to produce animated gif

#clean plotting screen
dev.off()

tVector<-c(tVector1,tVector2)
hist(tVector, prob=T, ylim=c(0,0.8), main="Histogram of t values when sampling from Ho and Ha",xlab="value of t")
lines(density(tVector), col="blue")
title("Testing population mean is equal to 1", outer=T, line=-1)
abline(v=0, lty=2, lwd=4, col="blue")
abline(v=mean(tVector1), lty=1, lwd=2, col="green")
text(mean(tVector1)+0.5,0.06,"Ho")
abline(v=mean(tVector2), lty=1, lwd=2, col="red")
text(mean(tVector2)+0.5,0.06,"Ha")

curve(dt(x, 9), add=T, lwd=3, col="green")
abline(v=qt(c(0.025),9), col="green")
abline(v=qt(c(0.975),9), col="green")

tgroup<-c(rep("Ho", ani.options("nmax")),rep("Ha", ani.options("nmax")))
multidensity(tVector~tgroup, main="t values under true and false Ho", lwd=3, xlab="T", ylab="Probability")
