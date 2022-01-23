---
title: 'In-class Activities: Week 3'
author: R package build
date: '2022-01-17'
slug: in-class-week-3
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
---

<!-- Note: to rendr as pdf delete the \newline -->
<!-- # **LAS 6292 WEEK 2 ASSIGNMENT: Data Storage and Backup**  -->
---

## **Breakout 1: Group Discussion**  

Much of your future as a researcher will be spent cleaning and correcting data, but you can reduce the time spent on this task (and the associated stress) considerably by implementing some good practices from the start. To start developing these good habits we will to take a look at some spreadsheets, identify the things that people should **_not_** be doing with them, and then determining what they should be doing instead.

1. Download the following three spreadsheets. To download the files, click the links and then the `download` button (shown below) on the right-hand side.  


{{< figure src="download_button.png" caption=" " numbered="false" >}}



  * `SAFI_messy.xlsx`: [download link](https://github.com/BrunaLab/LAS6292_DataManagement/blob/03dd47f3b52a9bf32be643cf34bafcce6566e555/static/course-materials/class-sessions/03-spreadsheets/examples/SAFI_messy.xlsx).
  * `unity-portal-data.xlsx`: [download link](https://github.com/BrunaLab/LAS6292_DataManagement/blob/03dd47f3b52a9bf32be643cf34bafcce6566e555/static/course-materials/class-sessions/03-spreadsheets/examples/untidy-portal-data.xlsx).
  * `dates.xlsx`: [download link](https://github.com/BrunaLab/LAS6292_DataManagement/blob/03dd47f3b52a9bf32be643cf34bafcce6566e555/static/course-materials/class-sessions/03-spreadsheets/examples/dates.xlsx)
  

2. Open `SAFI_messy.xlsx` and look at how the data are have been entered and organized. Now discuss the following questions. Keep in mind the `tidy` principles about which you read in Broman and Woo (2018).

    a. What problems can you identify with the way these data are entered/organized?
    
    b. How would you correct each of these issues? Could these data easily be imported into a programming language or a database in its current form?

3. Do the same with `unity-portal-data.xlsx`: review the data and discuss questions a & b.

4. Dates, or things that look like dates, are especially problematic in Excel. Open the file `dates.xlsx` and enter the following dates into the column labeled `date_1`. Be sure to type them in exactly as they are written:
    
    * `7-2-21`
    * `2 july 2021`
    * `july 2, 2021`
    * `july 2,2021` [no space between the comma and 2021]
    * `07-02-21`
    * `7/2/21`
    * `Jan 5, 1900`
    * `Dec 5, 1899`  
    
    a. Is the value in the cell the same as what you typed in?
    b. Why would these issues be a problem for data organization and analysis? 
    
5. Next enter the dates above into the column labeled `date_2`. Again, be sure to type them in exactly as they are written.
    
    a. what was different about the way the data are recorded? 
    b. can you figure out why?
  
  
6. What would you do to enter dates into Excel in a way that avoids the issues observed above? 

7. Export the `SAFI_messy.xlsx` as a .csv file with the name `SAFI_messy.csv`; you'll have to click the "OK" when warning box pops up.  Now reopen it. What happened? You can find a guide to saving your file in .csv format and why that is a good idea [on this website](https://datacarpentry.org/spreadsheet-ecology-lesson/05-exporting-data/index.html).

## **Breakout 1: Returning results** 

## **Break**  

## **In-class Exercise** (can work on this in groups but each person submits their own)  

**The goal of this breakout** is to learn some ways to minimize the number of mistakes when entering data. **First**, watch the following video (11 min) on ['Data Validation in Excel'](https://www.youtube.com/watch?v=nMxl1_NAcxc). **Second**, open this web page on ['Quality Assurance and Control in Excel'](https://datacarpentry.org/spreadsheet-ecology-lesson/04-quality-control/). It covers the same material, so it's a handy reference to have open during the exercise. (*Note: while we are using Excel for this exercise, see "Tools" below for how to do the same in Google Sheets*).   

**Exercise:** Set up a `tidy` sheet for entering the Portal Data we reviewed in Breakout 1 

1. Create a spreadsheet in Excel for data entry. It should have five columns, in which you will be recording (1) the date of observations,  (2) the site in which the observations were conducted, (3) the species captured, (4) the mass of each animal, and (5) the length of each animal. 

2. Set the following data validation criteria to prevent invalid data from getting entered:

    a. The Date column should be set so that it does *not* convert dates to other formats.
    b. Use data validation so that Site can only be one of the following A1, A2, B1, B2. 
    c. Set the error message on this validation criteria to provide information on what the valid values are.
    c. Use data validation so that Species can only be one of the following: *Dipodomys spectabilis*, *Dipodomys ordii*, *Dipodomys merriami*. 
    d. Set the error message on this validation criteria to provide information on what the valid values are.
    d. Use data validation so that Mass can only be a decimal greater than or equal to zero but less than or equal to 500. 
    e. Set the error message on this validation criteria to provide information on what the valid values are.
    f. Length should be an integer (i.e., a whole number) between 1 and 10. 
    g. Set the error message on this validation criteria to provide information on what the valid values are.

3. Check that the validation rules and data formatting are working by entering some data in the cells

4. Save this file as `data_entry_form.xlsx` and submit it via the Canvas website as 'homework-wk3'.

### Grading Rubric: 

**50:** Assignment completed with data validation correctly programmed with useful error messages  
**40:** Most data validation properly programmed; some require instructor follow-up  
**30:** Many of the validation parameters need corrections, error messages not useful  
**20:** Incorrect data are able to be entered in all categories; Instructor follow-up required  
