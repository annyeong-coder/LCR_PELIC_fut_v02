# LCR_PELIC_fut_v02 ####
Updated version of LCR_PELIC_future_v02

v02 My second attempt at an official Git repository for my LCR final project out L2 development and will/going to.
My first attempt at an official Git repository for my LCR final project out L2 development and will/going to.  

##
This one is "v02", which I created first at Github using my browswer, then went and created a new R project in Rstudio.

This is the second version of v02.  Initial commit on laptop.


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
