library(animation)

#sample 15 data points from a gamma with shape=1 and scale=1
meanVector1<-c(mean(rgamma(15,1,1)))

meanVector2<-c(mean(rgamma(15,3,1)))

saveGIF({
  #animation options
  options<-ani.options(nmax=250)
  
  for(i in 1:ani.options("nmax")){
    
    par(mfrow=c(2,2))
    
    plot(function(x) dgamma(x, 1, 1), 0, 10, main="Gamma(shape=1,scale=1)", ylab="Density", xlab="Size", col="dark green", lwd=2)
    plot(function(x) dgamma(x, 2, 1), 0, 10, main="Gamma(shape=3,scale=1)", ylab="Density", xlab="Size", col="dark blue", lwd=2)
    
    hist(meanVector1, main="Histogram of means from gamma(1,1)")
    hist(meanVector2, main="Histogram of means from gamma(3,1)")
    ani.pause()
  
    meanVector1<-c(meanVector1, mean(rgamma(15,1,1)))
    meanVector2<-c(meanVector2, mean(rgamma(15,3,1)))
  }
}, interval=0.2, movie.name = "Central_Teorem.gif", ani.width=800, ani.height=600)


