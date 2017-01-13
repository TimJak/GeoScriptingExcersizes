#Koen Veenenbos & Tim Jak, Team JakVeenenbos
#January 2017

#Create the same area for both Landsat files
LEXT <- intersect(LC8_cloudfree, LT5_cloudfree)

#Crop the LC8 and LT5 to the correct extend
EXTLC8 <- crop(LC8_cloudfree, LEXT)
EXTLT5 <- crop(LT5_cloudfree, LEXT)

#Calculate the ndvi for the different years
NDVILC8 <- (EXTLC8[[2]] - EXTLC8[[1]]) / (EXTLC8[[2]] + EXTLC8[[1]])
NDVILT5 <- (EXTLT5[[2]] - EXTLT5[[1]]) / (EXTLT5[[2]] + EXTLT5[[1]])

#Calculating the differns between the years
result <- (NDVILC8 - NDVILT5)