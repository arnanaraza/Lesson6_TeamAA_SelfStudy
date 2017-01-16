library(sp)
library(rgdal)
(simple_line <- Line(coords))

## An object of class "Line"
(lines_obj <- Lines(list(simple_line), "1"))

## An object of class "Lines"
(spatlines <- SpatialLines(list(lines_obj), proj4string=prj_string_WGS))

## An object of class "SpatialLines"
(line_data <- data.frame(Name = "straight line", row.names="1"))
str(line_data)

## An object of class "SpatialLinesDataFrame"
(mylinesdf <- SpatialLinesDataFrame(spatlines, line_data))
str(mylinesdf)
spplot(mylinesdf, col.regions = "blue", 
       xlim = bbox(mypointsdf)[1, ]+c(-0.01,0.01), 
       ylim = bbox(mypointsdf)[2, ]+c(-0.01,0.01),
       scales= list(draw = TRUE), sp.layout=list(mypointsdf, pch=19))
