# file incomplete
I realized I was distracting myself with curiousity,rather than doing actual productive analysis using already known tools and techniques.

## orginal source links:
  link one original post. READ: https://juliasilge.com/blog/you-must-allow-me/
  link two follow up post: https://juliasilge.com/blog/if-i-loved-nlp-less/

## (R code) check installed packages
.libPaths()                                        # Get path using .libPaths function
my_packages <- as.data.frame(installed.packages()[ , c(1, 3:4)])            # Apply installed.packages()
my_packages <- my_packages[is.na(my_packages$Priority), 1:2, drop = FALSE]  # Keep NA rows
rownames(my_packages) <- NULL ; my_packages                                              # Rename rows


## (R code) install files and dependencies
install.packages("dplyr","stringr", "syuzhet", "ggplot2", "viridis", dependencies = TRUE)

library(dplyr)
library(stringr)
library(syuzhet)
library(ggplot2)
library(viridis)



