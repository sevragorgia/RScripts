LakePoing_data<-read.csv("/home/sergio/Repos/rScripts/Notebooks/LakePoing_PhysicoChemData.csv", head=T)


summary(LakePoing_data)

summary(LakePoing_data$Turbidity)

hist(LakePoing_data$DistanceFromCoastLine)
hist(LakePoing_data$Depth)
hist(LakePoing_data$Temperature)
hist(LakePoing_data$Turbidity)
hist(LakePoing_data$NitrateConcentration)
hist(LakePoing_data$PhosphateConcentration)
hist(LakePoing_data$pH)
hist(LakePoing_data$DissolvedOxygen)
hist(LakePoing_data$ChlorophylConcentration)

plot(LakePoing_data$DistanceFromCoastLine)
plot(LakePoing_data$NitrateConcentration)
plot(LakePoing_data$PhosphateConcentration)



