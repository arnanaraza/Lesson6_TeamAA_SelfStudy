library(rgdal)
getwd()
## Write to KML; below we assume a subdirectory data within the current 
#  working directory.
dir.create("data", showWarnings = FALSE) 
writeOGR(mypointsdf, file.path("data","mypointsGE.kml"), 
         "mypointsGE", driver="KML", overwrite_layer=TRUE)
writeOGR(mylinesdf, file.path("data","mylinesGE.kml"), 
         "mylinesGE", driver="KML", overwrite_layer=TRUE)