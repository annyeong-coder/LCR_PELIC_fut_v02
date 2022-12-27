# intial packages ----
install.packages("tidyverse")
install.packages("ggstatsplot")
install.packages("dplyr")
install.packages("ggplot2")
library(ggplot2)
library(tidyverse)
library(ggstatsplot)
library(dplyr)
install.packages("FSA")
library(FSA)


##########################################################
# complexity measures
#group	Output Order	Index Name	In Text Name	Reference Corpus
#Clause Complexity	1	cl_av_deps	dependents per clause	Clause Complexity
#Clause Variety	2	cl_ndeps_std_dev	dependents per clause (standard deviation)	Clause Variety
#Syntactic Sophistication	2	acad_av_construction_freq	average construction frequency - academic	COCA Academic
#Syntactic Sophistication	13	acad_av_construction_freq_type	average construction frequency (types only) - academic	COCA Academic
#Syntactic Sophistication	145	acad_av_construction_freq_stdev	average construction frequency - academic (standard deviation)	COCA Academic
##########################################################

### reminders
# change column names
#Example 1 - Rename second column to c2


## import data SC (syntactic complexity) csv if not allready
## Nope!
#SC_ALL_p2 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_ALL_results_p2.csv")
#SC_ALL_p3 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_ALL_results_p3.csv")
#SC_ALL_p4 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_ALL_results_p4.csv")
#SC_ALL_p5 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_ALL_results_p5.csv")

#SC_BGT_p2 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_BGT_results_p2.csv")
#SC_BGT_p3 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_BGT_results_p3.csv")
#SC_BGT_p4 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_BGT_results_p4.csv")
#SC_BGT_p5 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_BGT_results_p5.csv")

#SC_WLL_p2 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_WLL_results_p2.csv")
#SC_WLL_p3 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_WLL_results_p3.csv")
#SC_WLL_p4 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_WLL_results_p4.csv")
#SC_WLL_p5 <- read.csv("D:/R/LCR_PELIC_fut_v02/data/TAASSC_WLL_results_p5.csv")
#rm(SC_ALL_p2,SC_ALL_p3,SC_ALL_p4,SC_ALL_p5,SC_ALL_p,SC_BGT_p2,SC_BGT_p3,SC_BGT_p4,SC_BGT_p5,SC_WLL_p2,SC_WLL_p3,SC_WLL_p4,SC_WLL_p5)


## import compiled data SC (syntactic complexity) csv if not allready
  SC_ALL_combined <- read.csv("D:/R/LCR_PELIC_fut_v02/data/SC_ALL_results_all.csv")
  SC_BGT_combined <- read.csv("D:/R/LCR_PELIC_fut_v02/data/SC_BGT_results_all.csv")
  SC_WLL_combined <- read.csv("D:/R/LCR_PELIC_fut_v02/data/SC_WLL_results_all.csv")

# colnames(my_dataframe)[2] ="c2"
#colnames(SC_ALL_combined)[1] ="SC_ALL_Plvl"
#colnames(SC_BGT_combined)[1] ="SC_BGT_Plvl"
#colnames(SC_WLL_combined)[1] ="SC_WLL_Plvl"

# in the following order, set up the Kruskal-Wallis test
# 1 cl_av_deps	dependents per clause
# 2 cl_ndeps_std_dev	dependents per clause (standard deviation)
# 3 acad_av_construction_freq	average construction frequency - academic
# 4 acad_av_construction_freq_type	average construction frequency (types only) - academic
# 5 acad_av_construction_freq_stdev	average construction frequency - academic (standard deviation)


###reminder select columns (and assigning a name)----
    # R base - Select columns by name
    # df[,"name"]
    
    # R base - Select columns from list
    # df[,c("name","gender")]
    
    # R base - Select columns by index position
    # df[,c(2,3)]





#### Summary data----
    # summary data all ----
    summary(SC_ALL_combined)
    
    # summary data BGT ----
    summary(SC_BGT_combined)
    
    # summary data WLL ----
    summary(SC_WLL_combined)




## SC_ALL_combined
SC_all_dependents <- SC_ALL_combined[,c(1,3)] #cl_av_deps	dependents per clause
# SC_all_dependents_SD <- SC_ALL_combined[,c(1,4)] #cl_ndeps_std_dev	dependents per clause (standard deviation)
# SC_all_con_freq <- SC_ALL_combined[,c(1,5)] #acad_av_construction_freq	average construction frequency
# SC_all_con_freq_type <- SC_ALL_combined[,c(1,6)] #acad_av_construction_freq_type	average construction frequency
# SC_all_con_freq_SD <- SC_ALL_combined[,c(1,7)] #acad_av_construction_freq_stdev	average construction frequency




## SC_BGT_combined 
SC_BGT_dependents <- SC_BGT_combined[,c(1,3)] #cl_av_deps	dependents per clause
# SC_BGT_dependents_SD <- SC_BGT_combined[,c(1,4)] #cl_ndeps_std_dev	dependents per clause (standard deviation)
# SC_BGT_con_freq <- SC_BGT_combined[,c(1,5)] #acad_av_construction_freq	average construction frequency
# SC_BGT_con_freq_type <- SC_BGT_combined[,c(1,6)] #acad_av_construction_freq_type	average construction frequency
# SC_BGT_con_freq_SD <- SC_BGT_combined[,c(1,7)] #acad_av_construction_freq_stdev	average construction frequency



## SC_WLL_combined
SC_WLL_dependents <- SC_WLL_combined[,c(1,3)] #cl_av_deps	dependents per clause
# SC_WLL_dependents_SD <- SC_WLL_combined[,c(1,4)] #cl_ndeps_std_dev	dependents per clause (standard deviation)
# SC_WLL_con_freq <- SC_WLL_combined[,c(1,5)] #acad_av_construction_freq	average construction frequency
# SC_WLL_con_freq_type <- SC_WLL_combined[,c(1,6)] #acad_av_construction_freq_type	average construction frequency
# SC_WLL_con_freq_SD <- SC_WLL_combined[,c(1,7)] #acad_av_construction_freq_stdev	average construction frequency



######################## Kruskal-Wallis model ----
### this asks (p0): 
#perform Kruskal-Wallis Test demo
# kruskal.test(height ~ group, data = df) 

# Kruskal-Wallis rank sum test

# data:  height by group
# Kruskal-Wallis chi-squared = 6.2878, df = 2, p-value = 0.04311

######################## Kruskal-Wallis interpretation ----
#The Kruskal-Wallis Test uses the following null and alternative hypotheses:
  
#  The null hypothesis (H0): The median is equal across all groups.
#The alternative hypothesis: (HA): The median is not equal across all groups.

# In this case, the test statistic is 6.2878 and the corresponding p-value is 0.0431.

# Since this p-value is less than 0.05, we can reject the null hypothesis that the median plant growth is the same for all three fertilizers.

# This means we have sufficient evidence to conclude that the type of fertilizer used leads to statistically significant differences in plant growth.

#### Dunn's Test demo -----

#perform Dunn's Test with Bonferroni correction for p-values
# dunnTest(pain ~ drug,
#         data=data,
#         method="bonferroni")

# Dunn (1964) Kruskal-Wallis multiple comparison
#p-values adjusted with the Bonferroni method.

#Comparison          Z     P.unadj       P.adj
#1      A - B -0.8890009 0.374002602 1.000000000
#2      A - C -3.2258032 0.001256197 0.003768591
#3      B - C -2.3368023 0.019449464 0.058348393

# At α = .05, drugs A and C are the only two drugs that are statistically significantly different from each other (adjusted p-value = .003768).




######################## Kruskal-Wallis mine ----
## this asks: are the (medians of) dependents per clause equal for each group?
####################### Dunn's mine ----


# Null H: all dependents are equal. p-value less than .05 means: the p-levels are not equal
kruskal.test(cl_av_deps ~ SC_ALL_Plvl, data = SC_all_dependents) 

dunnTest(cl_av_deps ~ SC_ALL_Plvl,
         data=SC_all_dependents,
         method="bonferroni")


kruskal.test(cl_av_deps ~ SC_BGT_Plvl, data = SC_BGT_dependents) #cl_av_deps

dunnTest(cl_av_deps ~ SC_BGT_Plvl,
         data=SC_BGT_dependents,
         method="bonferroni")



kruskal.test(cl_av_deps ~ SC_WLL_Plvl, data = SC_WLL_dependents) #cl_av_deps

dunnTest(cl_av_deps ~ SC_WLL_Plvl,
         data=SC_WLL_dependents,
         method="bonferroni")




#library(ggstatsplot)
# ggbetweenstats(
#  data = SC_BGT_p3,
#  x = filename,
#  y = cl_av_deps,
# type = "nonparametric", # ANOVA or Kruskal-Wallis
#  plot.type = "box",
#  pairwise.comparisons = TRUE,
#  pairwise.display = "significant",
#  centrality.plotting = FALSE,
#  bf.message = FALSE
#)

# boxplot by prof_level all combined
ggplot(SC_ALL_combined) +
  aes(x = SC_ALL_combined$SC_ALL_Plvl, y = SC_ALL_combined$cl_av_deps, fill = SC_ALL_combined$SC_ALL_Plvl) +
  geom_boxplot() +
  theme(legend.position = "none")

# boxplot by prof_level BGT combined
ggplot(SC_BGT_combined) +
  aes(x = SC_BGT_combined$SC_BGT_Plvl, y = SC_BGT_combined$cl_av_deps, fill = SC_BGT_combined$SC_BGT_Plvl) +
  geom_boxplot() +
  theme(legend.position = "none")


# boxplot by prof_level WLL combined
ggplot(SC_WLL_combined) +
  aes(x = SC_WLL_combined$SC_WLL_Plvl, y = SC_WLL_combined$cl_av_deps, fill = SC_WLL_combined$SC_WLL_Plvl) +
  geom_boxplot() +
  theme(legend.position = "none")


