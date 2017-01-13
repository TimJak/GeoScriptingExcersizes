#Koen Veenenbos & Tim Jak, Team JakVeenenbos
#January 2017

#Downloading the file doesn't work, please make sure this file is in the ./Data directory
#download.file(url ="https://dl.dropboxusercontent.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz", destfile = "./data/LC8.tar", method = "auto")

#Untar the file and put it in map LC8
untar('Data/LC81970242014109-SC20141230042441.tar.gz', exdir='Data/LC8')

#List the .tif files from LC8
LC8_list <- list.files("data/LC8", pattern = glob2rx("*.tif"), full.names = TRUE)

#Stack the list from LC8
LC8_st <- stack(LC8_list)

#Select mask, band 4 and band 5
LC8_sel <- raster::subset(LC8_st, c(1,5,6))

#Cloud function for LC8
CloudLC8 <- function(x, y){
  x[y != 0] <- NA
  return(x)
}

#Create a mask from the cloud layer
LC8_fmask <- LC8_sel[[1]]

#Create a variable with band 4 and 5
LC8_band45 <- dropLayer(LC8_sel, 1)

#Remove cloud cover
LC8_cloudfree <- overlay(x=LC8_band45, y=LC8_fmask, fun=CloudLC8)
