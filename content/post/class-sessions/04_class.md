---
title: 'In-class Activities: Week 4'
author: R package build
date: '2022-01-17'
slug: class-week-04
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-01-17T18:15:49-05:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
type: book
weight: 8
---

<!-- Note: to rendr as pdf delete the \newline -->
<!-- # **LAS 6292 WEEK 2 ASSIGNMENT: Data Storage and Backup**  -->
---

### **Topic 1: Intro to Reproducibility:** (10 Min)

* Why should we practice ‘Reproducible research’?: 

  <!-- Introduce reproducibility and why it is important; answer any student questions -->

### **Breakout:** (15 min)

* Program my lunch

<!-- http://static.zerorobotics.mit.edu/docs/team-activities/ProgrammingPeanutButterAndJelly.pdf -->
<!-- https://www.youtube.com/watch?v=HXl5f2azATU  -->

### **Returning results:** (30 min)

### **Break** (10 min)

### **Coding Corrections: Intro**  (20 min)

1. We're going to practice the routine for reproducible data correction (but the ideas and approach apply to writing computer code for any thing else). To keep track of progress, we will try the following: 
    
    `I need some help` = raise hand or pink post-it.   
    `I'm good` = Blue post-it or thumbs up

2. Lets first set up an RStudio Project called `demo_data_correction`. Inside of the project create the following three folders: 

    `raw_data`  
    `clean_data`  
    `r_scripts`  

3. Open the messy data file `demo_data.csv`: by following [this link](https://github.com/BrunaLab/LAS6292_DataManagement/blob/05dd4970756f635a41bdefbff4ef0e18183639ae/content/course-materials/class-sessions/04-reproducibility/examples/demo_data.csv) and clicking the **"Raw"** button on the right hand side above the data.

![the 'raw' button.](raw_button.png){width=50%}

4. The data will open as a tab in your web browser.  They will be in `*.csv` format; save the data to the `data_raw` folder by going to 'File' on the menu bar of your web browser and selecting 'Save page as' from the drop-down menu.

4. Open the `*.csv` file and look over the data. What things do you see that need to be corrected? 

5. **Step Away From The Computer.** Map out what needs to be done in a logical series of steps. Are there any things that are consistent across multiple columns? If you have time, count the steps it would take for you to make these changes in Excel. 

### **Coding Corrections: Implement the Changes** (60 min)


1. Let's do it: Live coding some corrections and data manipulations.  

  1. New .r file
  2. importance of annotating your code
  5. navigating the Rstudio gui
  1. add key info: session info(), name and what for, etc.
  6. Load tidyverse
  7. import csv
  8. make changes
      * add column
      * change tolower
      * save as csv
      * sweep the environment, restart r, rerun to make sure it works
      * read colnmaes
      * change column names
      * get summary of data types str, glimpse
      * change Data Types
      * change to a column to lower 
      * change a column to upper
      * order factor
      * add a column
      * add a calculation
      * Export clean data

**KEY MESSAGES:** (1) Keep raw data raw (2) annotate. lots.

### **Coding Corrections: Now do it on your own** (time remaining)

<!-- https://dataoneorg.github.io/Education/lessons/09_analysis/09_analysis.pdf -->
<!-- https://www.dataquest.io/blog/load-clean-data-r-tidyverse/  -->

Now we're going to start doing it on our own, with your data sets. 

1. Make an Rstudio project with subfolders

2. Put the data in the folder. If it is online data and you aren't sure how to download it, that's fine! Create an R script in which you note where it is and the format. Save this in the `r_scripts` folder

3. Start the process of identifying the corrections and  rearranging that needs to be done with your data. No need to code it yet, but make a list of it a .r file. We will look this over and divide it into logical blocks of steps.

4. When done, you submit a screen shot of the Rstudio project. If you have any r scripts submit them as well. Submit this via Canvas.

### Grading Rubric: 

**50:** RStudio Project Created with all folders in correct location, with data or files detailing where data are located and data correction steps needed.
**35:** RStudio Project created but without folders, incomplete information on data and data correction
**20:** No RStudio Project, limited information on the data


## Tools & Resources

1. The Carpentries' R workshops (self-paced or taught in-person) are excellent, I use many of their materials in class: 
  
    * [R for Social Scientists](https://datacarpentry.org/r-socialsci/)
    * [Data Analysis and Visualization in R for Ecologists](https://datacarpentry.org/R-ecology-lesson/)


1. Hadley Wickham wrote a book on using the tidyverse and the [online version is FREE](https://r4ds.had.co.nz/). This is a phenomenal resource on using R to import, tidy, and visualize data. 

2. [RStudio Cheat Sheets](https://rstudio.com/resources/cheatsheets/): help with commands for using the different `tidyverse` packages, RStudio shortcuts and tricks, help with R commands, and more. You definitely want the ones for Data Import, Work with Strings, Factors, Data Transformation, and Base R.

3. Where and How to ask for help  

    * Hadley Wickham's advice on [how to write a good reproducible example]((http://adv-r.had.co.nz/Reproducibility.html)) for getting help with R
    * [how to post good questions on StackOverflow](https://www.r-bloggers.com/2011/01/three-tips-for-posting-good-questions-to-r-help-and-stack-overflow/)
    * The UF [R-users listserv](http://www.r-gators.com/listserv/) is *very* user friendly and a great place to post requests for help. 

1. [Ten simple rules for biologists learning to program](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005871)

4. Lot's more on the course's ['Resources' page](https://las6292.netlify.app/docs/resources/) 

## Additional (interesting) Reading

1. Lewis, Keith P., Eric Vander Wal, and David A. Fifield. 2018. Wildlife biology, big data, and reproducible research. Wildlife Society Bulletin 42(1): 172-179.  

1. White EP, Baldridge E, Brym ZT, Locey KJ, McGlinn DJ, Supp SR.  2013.  Nine simple ways to make it easier to (re)use your data. Ideas in Ecology and Evolution. 6(2):1-10.  

1. [The humanities have a ‘reproducibility’ problem](https://talkinghumanities.blogs.sas.ac.uk/2019/07/09/the-humanities-have-a-reproducibility-problem/)

1. [The humanities do not need a replication drive](https://www.cwts.nl/blog?article=n-r2v2a4&title=the-humanities-do-not-need-a-replication-drive)

1. [Reproducible Research: A primer for the social sciences](http://benmarwick.github.io/CSSS-Primer-Reproducible-Research)

1. [Replicability and replication in the humanities](https://researchintegrityjournal.biomedcentral.com/articles/10.1186/s41073-018-0060-4)

1. [Towards reproducible science in the digital humanities](https://dhh.uni.lu/2020/05/19/towards-reproducible-science-in-the-digital-humanities-how-to-publish-your-data-and-code-alongside-your-research-with-the-help-of-zenodo/)

1. [The possibility and desirability of replication in the humanities](https://www.nature.com/articles/s41599-018-0149-x)

1. [Reproducible Research: A Retrospective](https://www.annualreviews.org/doi/10.1146/annurev-publhealth-012420-105110#_i18)

**_For when you feel more comfortable with R and programming_**

1. Bryan, J. (2018). Excuse me, do you have a moment to talk about version control? The American Statistician, 72(1), 20-27.

1. Wilson, Greg, Jennifer Bryan, Karen Cranston, Justin Kitzes, Lex Nederbragt, and Tracy K. Teal. Good enough practices in scientific computing. PLoS Computational Biology 13, no. 6 (2017): e1005510.  
