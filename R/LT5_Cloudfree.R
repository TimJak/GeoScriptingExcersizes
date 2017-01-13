#Koen Veenenbos & Tim Jak, Team JakVeenenbos
#January 2017

#Downloading the file doesn't work, please make sure this file is in the ./Data directory
#download.file(url ="https://dl.dropboxusercontent.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz", destfile = "./data/LT5.tar", method = "auto")

#Untar the file and put it in map LT5
untar('Data/LT51980241990098-SC20150107121947.tar.gz', exdir='Data/LT5')

#List the .tif files from LT5
LT5_list <- list.files("data/LT5", pattern = glob2rx("*.tif"), full.names = TRUE)

#Stack the list from LT5
LT5_st <- stack(LT5_list)

#Select mask, band 3 and band 4
LT5_sel <- raster::subset(LT5_st, c(1,6,7))

#Cloud function for LT5
CloudLT5 <- function(x, y){
  x[y != 0] <- NA
  return(x)
}

#Create a mask from the cloud layer
LT5_fmask <- LT5_sel[[1]]

#Create a variable with band 4 and 5
LT5_band34 <- dropLayer(LT5_sel, 1)

#Remove cloud cover
LT5_cloudfree <- overlay(x=LT5_band34, y=LT5_fmask, fun=CloudLT5)
