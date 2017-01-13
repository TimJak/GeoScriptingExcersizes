#Koen Veenenbos & Tim Jak, Team JakVeenenbos
#January 2017

#load libraries
library(rgdal)
library(raster)

#Source locations
source("R/LC8_Cloudfree.R")
source("R/LT5_Cloudfree.R")
source("R/ndvi.R")

#Plot result NDVI
plot(result)

# Write result to the output directory
writeRaster(x=result, filename='output/result.tif', datatype='FLT4S', overwrite=TRUE)
