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

The code below is for {{< icon name="r-project" pack="fab" >}}. You may use any scripted language you wish, but I may not be able to provide feedback.

## 2. Download the data we will be using in class

1. Open the messy data file `demo_data.csv` by following [this link](https://raw.githubusercontent.com/BrunaLab/LAS6292_DataManagement/master/instructor-materials/class-sessions/04-reproducibility/examples/demo_data.csv)
1. the data will open as a tab in your web browser in `.csv` format; save them to the `data_raw` folder by going to 'File' on the menu bar of your web browser and selecting 'Save page as' from the drop-down menu.
1. save the file to the `data_raw` folder. 

<!-- ![Download Files by following the link and clicking this button.](raw_download.png){width=50%} -->

## 3. Data Cleaning: Overview

1. _Characteristics of clean data set include:_

   * Free of duplicate rows/values
   * Error-free (correct misspellings, eliminate special characters)
   * correct data type for analysis
   * outliers identified and dealt in the correct way
   * “tidy" data structure

2. _Take your data from `messy` to `clean` in 5 steps_  
    
   *  Familiarize yourself with the data set
   *  Check for structural errors
   *  Check for data irregularities
   *  Decide how to deal with missing values

## 4. Data Cleaning: Practice

### 1. Review the Data Set

1. Review the `.csv` file 
2. What things do you see that need to be corrected? 
3. Make a list of the what you think needs to be corrected and the steps necessary to identify and implement each correction. Some of the things to look out for include: 
    
    * Numeric values stored as character data types
    * Factors stred as characters
    * Duplicate rows
    * Spelling mistakes
    * inconsistent formatting (eg., codes, capitalizations)
    * White spaces
    * Missing data
    * Zeros instead of null values
    * Special characters (e.g. commas in numeric values instead of decimals)
    * column headings with spaces between words or that start with numerals 
    
4. It is often useful to make an outline of the different steps. Note that there might be differetn ways to do the same thing, so an outline will help figure out which is best. For instance: 

  >**_Option 1_**   
    1. Import table 1   
    2. Correct column headings in Table 1  
    3. Import table 2  
    4. Correct column headings in Table 2  
    5. Bind Table 1 and Table 2 Together  

  >**_is less efficient than_** 

  >**_Option 2_**  
    1. Import table 1  
    2. Import table 2   
    3. Bind Table 1 and Table 2 Together   
    4. Correct the column headings in the Table    

      
### 2. Import & Edit Data

1. Create a new `.r` file and save it as `cleanup_code` in your `code` folder
2. Annotate your code and key info: session info(), name and what for, etc. Add the "Steps" to the .R as Sections with shift-cmd-r (Mac) or shift-alt-r (PC).
3. Load `tidyverse` library, import the data, and do some manipulations.


### 3. Code

1. The R code we used in class can be downloaded here:  {{% staticref "uploads/wk4_live_coding.R" "newtab" %}}Demo R Code{{% /staticref %}} You can copy and paste it into your own R script.


### 4. Assignment

1. There is no assignment to submnit this week, but I expect you to run the code and be able to answer the questions at the end.

