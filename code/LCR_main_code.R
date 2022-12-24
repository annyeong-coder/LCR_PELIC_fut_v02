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

install.packages(c("zipfR", "languageR", "rpart", "chron", "Hmisc", "Matrix", "lme4", "coda", "e1071", "ape", "tidyverse")) # list from Baayen's 2008

library("zipfR"); library("languageR"); library("rpart");library("chron"); library("Hmisc"); library("Matrix"); library("lme4"); library("coda"); library("e1071"); library("ape"); library("tidyverse")

mynewdataframe <- read.table(file.choose(), header=TRUE, sep="\t"); mynewdataframe

# Only iff you want to delete all the variables that are there in the environment what you can do is you can use the “rm” with an argument “list” is equal to “ls” followed by a parenthesis. 

# Section 01:DCA analysis ----
source("https://www.stgries.info/teaching/groningen/coll.analysis.r")
install.packages("tidyverse")
library("tidyverse")
library(collostructions)
install.packages("ggplot2")
library(ggplot2)

plot(goingto.will.p3)

# proficiency level 2 data loading ----
goingto.will.p2 <- read.table("DCA_p2.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p2)
p2future <- collex.dist(goingto.will.p2); p2future
p2future[p2future$SIGNIF!="ns",]

# displaying focused data sets then saving them
p2future[p2future$SIGNIF!="ns" & p2future$ASSOC=="WILL",] # displays ns significance for WILL  
p2future[p2future$SIGNIF!="ns" & p2future$ASSOC=="GOING_TO",] # displays ns significance for GOING_TO

p2sigWILL<- c(p2future[p2future$SIGNIF!="ns" & p2future$ASSOC=="WILL",]) # displays ns significance for WILL  
p2sigBGT <- c(p2future[p2future$SIGNIF!="ns" & p2future$ASSOC=="GOING_TO",]) # displays ns significance for GOING_TO

write.table(p2sigWILL, "data_processed/p2sigWILL2.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)
write.table(p2sigBGT, "data_processed/p2sigBGT.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)
write.table(p2future, "data_processed/p2futureNSall.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)


  # proficiency level 2 data loading plot ----
  plot(log2(p2future[,2]+p2future[,4]), p2future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p2future[,2]+p2future[,4]), p2future$COLL.STR.LOGL, p2future$COLLEX, font=3, col = "blueviolet")

  
  
  

# proficiency level 3 data loading  ---- 
goingto.will.p3 <- read.table("DCA_p3.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p3)
p3future <- collex.dist(goingto.will.p3); p3future
p3future[p3future$SIGNIF!="ns",]

# displaying focused data sets then saving them
p3future[p3future$SIGNIF!="ns" & p3future$ASSOC=="WILL",] # displays ns significance for WILL  
p3future[p3future$SIGNIF!="ns" & p3future$ASSOC=="GOING_TO",] # displays ns significance for GOING_TO

p3sigWILL<- c(p3future[p3future$SIGNIF!="ns" & p3future$ASSOC=="WILL",]) # displays ns significance for WILL  
p3sigBGT <- c(p3future[p3future$SIGNIF!="ns" & p3future$ASSOC=="GOING_TO",]) # displays ns significance for GOING_TO

write.table(p3sigWILL, "data_processed/p3sigWILL2.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)
write.table(p3sigBGT, "data_processed/p3sigBGT.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)

  # proficiency level 3 data plot ----
  plot(log2(p3future[,2]+p3future[,4]), p3future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p3future[,2]+p3future[,4]), p3future$COLL.STR.LOGL, p3future$COLLEX, font=3, col = "darkorange3")

  
# proficiency level 4 data load ----
goingto.will.p4 <- read.table("DCA_p4.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p4)
p4future <- collex.dist(goingto.will.p4); p4future; 
p4future[p4future$SIGNIF!="ns",]

# displaying focused data sets then saving them
p4future[p4future$SIGNIF!="ns" & p4future$ASSOC=="WILL",] # displays ns significance for WILL  
p4future[p4future$SIGNIF!="ns" & p4future$ASSOC=="GOING_TO",] # displays ns significance for GOING_TO

p4sigWILL<- c(p4future[p4future$SIGNIF!="ns" & p4future$ASSOC=="WILL",]) # displays ns significance for WILL  
p4sigBGT <- c(p4future[p4future$SIGNIF!="ns" & p4future$ASSOC=="GOING_TO",]) # displays ns significance for GOING_TO

write.table(p4sigWILL, "data_processed/p4sigWILL2.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)
write.table(p4sigBGT, "data_processed/p4sigBGT.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)

  # proficiency level 4 data plot ----
  plot(log2(p4future[,2]+p4future[,4]), p4future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p4future[,2]+p4future[,4]), p4future$COLL.STR.LOGL, p4future$COLLEX, font=3, col = "darkgreen")



# proficiency level 5 data load ----
goingto.will.p5 <- read.table("DCA_p5.csv", header = TRUE, sep = "\t", quote = "\"")
head(goingto.will.p5)
p5future <- collex.dist(goingto.will.p5); p5future
p5future[p5future$SIGNIF!="ns",]

# displaying focused data sets then saving them
p5future[p5future$SIGNIF!="ns" & p5future$ASSOC=="WILL",] # displays ns significance for WILL  
p5future[p5future$SIGNIF!="ns" & p5future$ASSOC=="GOING_TO",] # displays ns significance for GOING_TO

p5sigWILL<- c(p5future[p5future$SIGNIF!="ns" & p5future$ASSOC=="WILL",]) # displays ns significance for WILL  
p5sigBGT <- c(p5future[p5future$SIGNIF!="ns" & p5future$ASSOC=="GOING_TO",]) # displays ns significance for GOING_TO

write.table(p5sigWILL, "data_processed/p5sigWILL2.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)
write.table(p5sigBGT, "data_processed/p5sigBGT.txt", quote=FALSE, sep="\t", row.names=F, col.names=T)


  # proficiency level 5 data plot ----
  plot(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, type="n",
       xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
  grid(); abline(h=0, lty=2); abline(v=0, lty=2)
  text(log2(p5future[,2]+p5future[,4]), p5future$COLL.STR.LOGL, p5future$COLLEX, font=3, col = "darkblue")


# write significant results to csv file
  write.csv(p2future[p2future$SIGNIF!="ns",],"p2futuresigresults.csv", row.names=FALSE)
  write.csv(p3future[p3future$SIGNIF!="ns",],"p3futuresigresults.csv", row.names=FALSE)
  write.csv(p4future[p4future$SIGNIF!="ns",],"p4futuresigresults.csv", row.names=FALSE)
  write.csv(p5future[p5future$SIGNIF!="ns",],"p5futuresigresults.csv", row.names=FALSE)
    
  

# ggplot layer test v01  ----
ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX)) + # this just establishes the (aes - asthetics) x and y axes; plus sign means keep looking
  geom_point() # this tells ggplot to put a point for the data

?geom_point # we can use this to review the ways of configuring geometric points


  
# ggplot layer test v02  ----  
ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX, col = ASSOC)) + # adding color based on association direction
    geom_point() # no changes from v01
  

# ggplot layer test v03a  ----  
  ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX, col = ASSOC, size = SIGNIF)) + # doesn't like size being attached to discrete variables
    geom_point() # no changes from v01

# ggplot layer test v03b  ----  
  ggplot(p3future, aes(x = COLL.STR.LOGL, y = COLLEX, col = ASSOC, shape = SIGNIF)) + # shape works okay for discrete, but chart is too small, or at least the preview - this would be a lot better if I could eliminate the non-significant results
    geom_point() # no changes from v01
  

# ggplot layer test v04  ----  
  ggplot(p3future, aes(x = SIGNIF, y = COLLEX, col = ASSOC, size = COLL.STR.LOGL)) + # decent; arranges by signifigance on x axis, the COLL strength by size is intuitive, as is the ASSOC directional pull.
    geom_point() # no changes from v01


  # ggplot layer test v05  ----  
  ggplot(p3future, aes(x = ASSOC, y = COLLEX, col = SIGNIF, size = COLL.STR.LOGL)) + # test again
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

