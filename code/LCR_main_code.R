# 00a Document metadata ####
# Info: this is the main R script file for my LCR final project on L2 development and future constructions.

# 00ba commonly reused commands (commented versions) ####
# rm(list=ls())  # removes all variables from environment


# Initial setup and key commands ----
x<-read.table(file.choose(), header=TRUE, sep="\t", comment.char="")


#import full dataset ----
# this is tibble readr package
library(readr)
xPELIC <- read_delim("data_raw/PELIC.cleaned.final.meta tagged 221118 2228.txt", 
                     delim = "\t", escape_double = FALSE, 
                     na = "NA", trim_ws = TRUE)
head(xPELIC)

xPELIC.colnames <-(colnames(xPELIC)); xPELIC.colnames


# Only iff you want to delete all the variables that are there in the environment what you can do is you can use the “rm” with an argument “list” is equal to “ls” followed by a parenthesis. 

# Section 01:DCA analysis ----
source("https://www.stgries.info/teaching/groningen/coll.analysis.r")
library(collostructions)
install.packages("ggplot2")
library(ggplot2)

plot(goingto.will.p3)

# proficiency level 2 data loading ----
goingto.will.p2 <- read.table("DCA_p2.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p2)
p2future <- collex.dist(goingto.will.p2); p2future

  # proficiency level 2 data loading plot ----
  plot(log2(p2future[,2]+p2future[,4]), p2future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p2future[,2]+p2future[,4]), p2future$COLL.STR.LOGL, p2future$COLLEX, font=3, col = "blueviolet")


# proficiency level 3 data loading  ---- 
goingto.will.p3 <- read.table("DCA_p3.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p3)
p3future <- collex.dist(goingto.will.p3); p3future

head(p3future)

tail(p3future)

  # proficiency level 3 data plot ----
  plot(log2(p3future[,2]+p3future[,4]), p3future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p3future[,2]+p3future[,4]), p3future$COLL.STR.LOGL, p3future$COLLEX, font=3, col = "darkorange3")

# proficiency level 4 data load ----
goingto.will.p4 <- read.table("DCA_p4.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p4)
p4future <- collex.dist(goingto.will.p4); p4future
head(p4future)
tail(p4future)

  # proficiency level 4 data plot ----
  plot(log2(p4future[,2]+p4future[,4]), p4future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p4future[,2]+p4future[,4]), p4future$COLL.STR.LOGL, p4future$COLLEX, font=3, col = "darkgreen")



# proficiency level 5 data load ----
goingto.will.p5 <- read.table("DCA_p5.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p5)
p5future <- collex.dist(goingto.will.p5); p5future
head(p5future)
tail(p5future)

  # proficiency level 5 data plot ----
  plot(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, p5future$COLLEX, font=3, col = "darkblue")

  
  

# ggplot layer test v01  ----
ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX)) + # this just establishes the (aes - asthetics) x and y axes; plus sign means keep looking
  geom_point() # this tells ggplot to put a point for the data

?geom_point # we can use this to review the ways of configuring geometric points


  
# ggplot layer test v02  ----  
ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX, col = ASSOC)) + # adding color based on association direction
    geom_point() # no changes from v01
  

# ggplot layer test v03  ----  
  ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX, col = ASSOC, size = SIGNIF)) + # adding color based on association direction
    geom_point() # no changes from v01


# ggplot layer test v04  ----  
  ggplot(p3future, aes(x = SIGNIF, y = COLLEX, col = ASSOC, size = COLL.STR.LOGL)) + # adding color based on association direction
    geom_point() # no changes from v01


  # ggplot layer test v05  ----  
  ggplot(p3future, aes(x = ASSOC, y = COLLEX, col = SIGNIF, size = COLL.STR.LOGL)) + # adding color based on association direction
    geom_point() # no changes from v01



















# plus the script generates a plot with what I think are the most useful results that can be computed given the limited input - ideally, one would include dispersion and uncertainty intervals as discussed in Gries (2019c, 2022c, d, in progress e)

# meaningless color backup
#plot(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, type="n",
#     xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
#grid(); abline(h=0, lty=2); abline(v=0, lty=2)
#text(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, p5future$COLLEX, font=1, #col = c("red", "blue"))


# improved backup
#plot(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, type="n",
#     xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
#grid(); abline(h=0, lty=2); abline(v=0, lty=2)
#text(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, p5future$COLLEX, font=1)

# backup plot
#plot(log2(p5future[,2]+p5future[,3]), p5future$LOGODDSRATIO, type="n",
#     xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
#grid(); abline(h=0, lty=2); abline(v=0, lty=2)
#text(log2(p5future[,2]+p5future[,3]), p5future$LOGODDSRATIO, p5future$WORD, font=3)

# Association (cxn-to-word), i.e., deltaP(cxn|w), see Gries & Ellis (2015: 240)

# SIGNIF	
# Significance level. 
## ***** = significant at p < .00001, 
## **** = significant at p < .0001, 
## *** at p < .001, 
## ** at p < .01, * at p < .05, and 
# ns is not significant (but tendency is given by the difference between OBS and EXP, i.e. as returned in ASSOC). Association measures without significance tests have SIGNIF == na.



# Section 02:name ####


# Section 03:name ####


# Section 04:name ####


# Section 05:name ####


# Section 06:name ####


# Section 07:name ####


# Section 09:name ####

