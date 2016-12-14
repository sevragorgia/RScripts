#need to finish this.


library(ape)

#upload tree

#define pairs of taxa to determine MRCA

Tetrac<-c(35, 49)

ages<-c()

for(tree in 1:length(astrid_trees)){

ages<-c(ages, branching.times(astrid_trees[[tree]])[as.character(getMRCA(astrid_trees[[tree]], tip=c(1,41))[[1]])])

}

mean(ages)*100
sd(ages)*100
median(ages)*100

hist(ages)

