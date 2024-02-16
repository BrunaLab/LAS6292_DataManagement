---
title: 'In-class Activities - Week 6'
author: R package build
date: '2022-02-11'
slug: class-week-06
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
type: book
weight: 12
---

## QA/QC 2: Using OpenRefine to clean data

{{< figure src="noam_tweet.png" id="noam" caption="How many ways can you spell the word..." height="30%">}}.


OpenRefine is a powerful, free, and open source tool that is used to work with and clean messy data.  We will be working through some of OpenRefine's basic features, after which you will trying them onm your own on a new data set.

**_Note:_** This is the url for accessing OpenRefine if a new tab/window doesn't open: [http://127.0.0.1:3333/](http://127.0.0.1:3333/)

#### **1. Intro to OR**

#### **2. Working with OR**
1. Download the data file for the tutorial to your computer [click this link](https://ndownloader.figshare.com/files/11502815). 

#### **3. Filtering and Sorting**
     
### **Break**

#### **5. Examining Numbers**

#### **6. Using Scripts, Exporting, and Saving**

#### **7. Wrap-up, Questions**  

## **Assignment**

Now it's your turn. [Download this csv file](https://las6292.netlify.app/uploads/exercises/portal_rodents_or_short.csv) and use OpenRefine to clean it up. After you create a Project, edit the data as follows:

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

## OpenRefine Home

*  [Open Refine](https://openrefine.org/) Homepage. Includes the [user's manual](https://docs.openrefine.org/) and links to [more tutorials](https://openrefine.org/documentation.html).


## Tutorials

* OpenRefine curates a list of tutorials (including youtube videos and online posts). I recommend starting with this list, which you can [find here](https://openrefine.org/external_resources).
* Environmental Data Initiative [OpenRefine Tutorial](https://environmentaldatainitiative.org/webinars-events/previous-edi-events/how-to-clean-and-format-data-using-r-packages-datamaid-dplyr-openrefine-excel/)
* Cleaning Data with OpenRefine Video Tutorials: 
    * [Video Tutorial No. 1](https://www.youtube.com/watch?v=nORS7STbLyk)
    * [Video Tutorial No. 2](https://www.youtube.com/watch?v=xZlz4ISgNBc)
*  JHU Library: [Cleaning Data with OpenRefine](https://libjohn.github.io/openrefine/index.html)
* The Programming Historian Website: [Cleaning Data with OpenRefine](https://doi.org/10.46430/phen0023).

## GREL Cheatsheets

* Belinda Weaver's [GREL Cheatsheet with examples](https://github.com/weaverbel/teachingfiles/blob/master/grel_value_replace.md) 
* [OpenRefine GREL Manual](https://docs.openrefine.org/manual/expressions/#grel-general-refine-expression-language)
* A really good [GREL Guide](https://guides.library.illinois.edu/openrefine/grel) from the Univ Illinois
* Even better: code4lib Toronoto's [OpenRefine cheatsheets](https://code4libtoronto.github.io/2018-10-12-access/GoogleRefineCheatSheets.pdf), including for GREL commands.
* Datenschule's [OR Cheatsheets](https://datenschule.de/files/downloads/workshops/CheatSheet-Open-Refine.pdf)

## R Tools

* The [rrefine package](https://cran.r-project.org/web/packages/rrefine/vignettes/rrefine-vignette.html) allows you to do some OpenRefine tasks from within R, such as import, export, apply data cleaning operations, or delete a project in OpenRefine directly from R. In other words, it's for repeating operations in R *after* you've worked with OpenRefine.
