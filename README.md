# LCR_PELIC_fut_v02 ####
Updated version of LCR_PELIC_future_v02

v02 My second attempt at an official Git repository for my LCR final project out L2 development and will/going to.
My first attempt at an official Git repository for my LCR final project out L2 development and will/going to.  

##
This one is "v02", which I created first at Github using my browswer, then went and created a new R project in Rstudio.

This is the second version of v02.  Initial commit on laptop. Successful so far.


# Notes to self about progress ####

## Need to create subsets based on key factors. Below assumes "proficiency" is the most important for analysis.

### Option 1: Make separate CSVs - one  for each proficiency levels (2-5)
  Strengths: easier conceptually for me, less R code. More backup files. Smaller datasets each time they are searched and analyzed. Can be exported again to files that can be analyzed through AntConc.
  Weaknesses: More backup files; possibly unnecessary. More code later? More excel work. NEEDS to be saved as an environmental variable (or at least code) before closing R studio.



### Option 2: Import entire dataset (as a single file), then subset in R
  Strengths: No further Excel work; all in R. Subsets can exported later, changed, fixed, changed.
  Weaknesses: less intuitive for me than Excel.
  
##### Process in R
  1. Plan subsets
    Rows based on values in the 4 levels in the proficiency column. prof2:prof4.
    Subset each subset (prof2:prof4) based on Going To inclusions.
    Subset each subset (prof2:prof4) based on Will inclusions.
    
  2. Look up subsetting functions.
  3. Write R code in editor.
  4. Test run, fix.
  5. Run and subset as an R-internal Dataset.
  6. Assign the subset to a variable.
  
# Gries Model: ####
  
  Data to be entered:
- analysis you want to perform: 2
- distinctive categories: 1 (for "2 alternatives")
- input format: 2 (frequency table)
- do want the results of (two-tailed!) Fisher-Yates exact tests: no
- load the tab-delimited input file: <2b.csv> (example input file for a distinctive collexeme analysis of a few verbs and the ditransitive vs. the prepositional dative in the ICE-GB)
output file: <2b_out.csv>
plus the script generates a plot with what I think are the most useful results that can be computed given the limited input - ideally, one would include dispersion and uncertainty intervals as discussed in Gries (2019c, 2022c, d, in progress e)
