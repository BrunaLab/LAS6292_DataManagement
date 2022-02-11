---
title: 'In-class Activities - Week 6'
author: R package build
date: '2022-02-11'
slug: class-week-6
categories:
  - In-Class Assignment
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2022-02-11T11:00:42-05:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

## QA/QC 2: Using OpenRefine to clean data

OpenRefine is a powerful, free, and open source tool that is used to work with and clean messy data.  We will be working through some of OpenRefine's basic features, after which you will trying them onm your own on a new data set.

**_Notes:_**

1. This is the url for accessing OpenRefine if a new tab/window doesn't open: http://127.0.0.1:3333/

2. To download the data file for the tutorial to your computer [click this link](https://ndownloader.figshare.com/files/11502815). (url: https://ndownloader.figshare.com/files/11502815)



### **intro to OR**

### **Working with OR**

### **Filtering and Sorting**
     
### Break

### **Examining Numbers**

### **Using Scripts, Exporting, and Saving**

### **Wrap-up, Questions**  

## **Assignment**

Now it's your turn. Use Open Refine to clean up this data set. After you create a Project, edit the data as follows:

1. Correct and standardize the names of the countries in which the rodents were captured. 

2. The column `scientificName` contains two pieces of information (the Genus _and_ species of each animal). Split this into two columns, rename them as `genus` and `species`, and then correct and standardize the data in each column as needed. NB: You may run into an obstacle when you try to rename the columns. How can you get around it?

3. Save the clean data as a CSV file on your desktop.

4. Extract and save your steps (i.e., 'operation history' as JSON. Save this as a text file. 

5. _Bonus Brainteaser:_ Many of the cells in the column for the Latin bonomial are blank. How might you go about filling them in based on the column with the abbreviation?

6. **Submission:** Submit your clean .csv and the JSON text file as `week6_hw` on Canvas.  

### Grading Rubric: 

Data corrected and JSON file can be used on another data set: 50  
Most data correction properly programmed; some require instructor follow-up: 40  
Many of the corrections missing, JSON file unable to process new data : 30  
Instructor follow-up required to implement most changes: 20  

# Sources for this lesson 

1. Data Carpentry: [Data Cleaning with OpenRefine for Social Scientists	](https://datacarpentry.org/openrefine-socialsci/). 

<!-- Peter Smyth, Geoff LaFlair, Lachlan Deer, Tracy Teal, Karen Word, François Michonneau, & Erin Becker. (2018, May 20). datacarpentry/openrefine-socialsci: OpenRefine Social Sciences Release, May 2018 (v3). Zenodo. https://doi.org/10.5281/zenodo.1250074 -->
<!-- 2. The repository with the data and metadata used in the lesson:  [SAFI_Survey](https://figshare.com/articles/dataset/SAFI_Survey_Results/6262019) -->

2. Data Carpentry: [Data Cleaning with OpenRefine for Ecologists](https://datacarpentry.org/OpenRefine-ecology-lesson/04-scripts/index.html)


# Additional Tools and Resources

*  [Open Refine](https://openrefine.org/) Homepage. Includes the [user's manual](https://docs.openrefine.org/) and links to [more tutorials](https://openrefine.org/documentation.html).

*  [Environmental Data Initiative OpenRefine Tutorial](https://environmentaldatainitiative.org/webinars-events/previous-edi-events/how-to-clean-and-format-data-using-r-packages-datamaid-dplyr-openrefine-excel/)

* Video Tutorials: Cleaning Data with OpenRefine [Video Tutorial No. 1](https://www.youtube.com/watch?v=nORS7STbLyk) and [Video Tutorial No. 2](https://www.youtube.com/watch?v=xZlz4ISgNBc)

*  [JHU Library Cleaning Data with OpenRefine](https://libjohn.github.io/openrefine/index.html)

* The Programming Historian Website: [Cleaning Data with OpenRefine](https://doi.org/10.46430/phen0023) (by Seth van Hooland, Ruben Verborgh, and Max De Wilde).

* Guides for writing OpenRefine commands with General Refine Expression Language
    
    * [OpenRefine GREL](https://docs.openrefine.org/manual/expressions/#grel-general-refine-expression-language)
    * a really good [GREL Guide](https://guides.library.illinois.edu/openrefine/grel) from the Univ Illinois
    * Even better: [OpenRefine cheatsheets](https://code4libtoronto.github.io/2018-10-12-access/GoogleRefineCheatSheets.pdf), including for GREL commands.

*  The [rrefine package](https://cran.r-project.org/web/packages/rrefine/vignettes/rrefine-vignette.html) allows you to do some OpenRefine tasks from within R. 

* The UF Library teaches a number of excellent workshops, including one on using OpenRefine. You can check when the next one will be held (or request one) [here](https://ufl.libcal.com/calendar/workshops/?cid=11693&t=d&d=0000-00-00&cal=11693,5125,8858&inc=0)

