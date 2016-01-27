## ----load-libraries-1, results='hide', echo=FALSE------------------------

library(raster)
library(rgdal)



## ----demonstrate-no-data-blaco, echo=FALSE-------------------------------
#demonstration code below - not being taught - just demonstrating no data values
# Use stack function to read in all bands
RGB_stack <- stack("NEON_RemoteSensing/HARV/HARV_RGB_Ortho.tif")

## ----demonstrate-no-data, echo=FALSE-------------------------------------
#reassign cells with 0,0,0 to NA
#this is simply demonstration code - we will not teach this.
f <- function(x) {
  x[rowSums(x == 0) == 3, ] <- NA
  x}

newRGBImage <- calc(RGB_stack, f)


par(col.axis="white",col.axis="white",col.lab="white",tck=0)
# Create an RGB image from the raster stack
plotRGB(newRGBImage, r = 1, g = 2, b = 3,
        axes=TRUE, main="Raster Data\nHarvard Forest")
box(col="white")

#Resample image to show grid cell size when plotting
resampleFactor <- 50  # For test, subsample incoming image by factor of 10
CoarseRGBImage <- aggregate(newRGBImage,fact=resampleFactor,fun=mean)

par(col.axis="white",col.axis="white",col.lab="white",tck=0)
# Create an RGB image from the raster stack
plotRGB(CoarseRGBImage, r = 1, g = 2, b = 3,
        axes=TRUE, main="Resampled (factor of 50) of Raster Data\nHarvard Forest")
box(col="white")