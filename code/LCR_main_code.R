# 00a Document metadata ####
# Info: this is the main R script file for my LCR final project on L2 development and future constructions.

# 00ba commonly reused commands (commented versions) ####
# rm(list=ls())  # removes all variables from environment


# Initial setup and key commands ####
x<-read.table(file.choose(), header=TRUE, sep="\t", comment.char="")


#import full dataset
# this is tibble readr package
library(readr)
xPELIC <- read_delim("data_raw/PELIC.cleaned.final.meta tagged 221118 2228.txt", 
                     delim = "\t", escape_double = FALSE, 
                     na = "NA", trim_ws = TRUE)
head(xPELIC)

xPELIC.colnames <-(colnames(xPELIC)); xPELIC.colnames


# Only iff you want to delete all the variables that are there in the environment what you can do is you can use the “rm” with an argument “list” is equal to “ls” followed by a parenthesis. 

# Section 01:DCA analysis ####
source("https://www.stgries.info/teaching/groningen/coll.analysis.r")
library(collostructions)

# p2
goingto.will.p2 <- read.table("DCA_p2.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p2)
p2future <- collex.dist(goingto.will.p2); p2future

# p3
goingto.will.p3 <- read.table("DCA_p3.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p3)
p3future <- collex.dist(goingto.will.p3); p3future
head(goingto.will.p3)
tail(goingto.will.p3)

# p4
goingto.will.p4 <- read.table("DCA_p4.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p4)
p4future <- collex.dist(goingto.will.p2); p4future
head(goingto.will.p4)
tail(goingto.will.p4)

# p5
goingto.will.p5 <- read.table("DCA_p5.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p5)
p5future <- collex.dist(goingto.will.p5); p5future
head(goingto.will.p5)
tail(goingto.will.p5)

# Section 02:name ####


# Section 03:name ####


# Section 04:name ####


# Section 05:name ####


# Section 06:name ####


# Section 07:name ####


# Section 09:name ####

