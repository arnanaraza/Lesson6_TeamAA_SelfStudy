## Load the sp and rgdal packages
library(sp)
library(rgdal)
setwd("/home/ubuntu/Lesson6_TeamAA/")
## Coordinates of two points identified in Google Earth, for example:
pnt1_xy <- cbind(5.6660, 51.9872)   # enter your own coordinates
pnt2_xy <- cbind(5.6643, 51.9668)   # enter your own coordinates

## Combine coordinates in single matrix
coords <- rbind(pnt1_xy, pnt2_xy)

## Make spatial points object
prj_string_WGS <- CRS("+proj=longlat +datum=WGS84")
mypoints <- SpatialPoints(coords, proj4string=prj_string_WGS)

## Create and display some attribute data and store in a data frame
mydata <- data.frame(cbind(id = c(1,2), 
                           Name = c("my first point", 
                                    "my second point")))

## Make spatial points data frame
mypointsdf <- SpatialPointsDataFrame(
  coords, data = mydata, 
  proj4string=prj_string_WGS)

mypointsplot<-spplot(mypointsdf, zcol="id", col.regions = c("red", "blue"), 
       xlim = bbox(mypointsdf)[1, ]+c(-0.01,0.01), 
       ylim = bbox(mypointsdf)[2, ]+c(-0.01,0.01),
       scales= list(draw = TRUE))

## Play with the spplot function!
## What is needed to make the following work?
spplot(mypointsdf, col.regions = c(1,2)) #add zcol, attribute argument
