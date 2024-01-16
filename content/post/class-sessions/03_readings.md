---
title: 'Readings: Week 3'
author: R package build
slug: readings-week-03
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
type: book
weight: 5
---

---

{{% callout note %}}

## **Objectives and Competencies for this session:**

  * Be able to identify different categories of data   
  * Learn best practices for data entry
  * Recognize and avoid common problems with data entry and formatting in spreadsheets
  * Learn and be able to implement 'Tidy' format for data tables in spreadsheets
  * Identify problems with and approaches for proper handling of dates in spreadsheets
  * Learn how to export data from spreadsheets in open format

{{% /callout %}}

## **Pre-Class Preparation:**
 
### **Readings**

1.  Tesi, W. 2020. An Outdated Version of Excel Led the U.K. to Undercount COVID-19 Cases. Slate. [[read online]](https://slate.com/technology/2020/10/u-k-covid-19-spike-caused-by-microsoft-excel-error.html) or {{% staticref "uploads/readings/tesi2020.pdf" "newtab" %}}[download pdf]{{% /staticref %}}
        
        
2. Stolberg et al. 2020. CDC Test Counting Error Leaves Epidemiologists ‘Really Baffled’. NY Times.  [[read online]](https://www.nytimes.com/2020/05/22/us/politics/coronavirus-tests-cdc.html?referringSource=articleShare) or {{% staticref "uploads/readings/Stolberg_2020_NYT.pdf" "newtab" %}}[download pdf]{{% /staticref %}}
        

3.  Broman, K. W., and Woo, K. H. (2018). Data organization in spreadsheets. The American Statistician, 72(1), 2-10.  [[read online]](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989) or {{% staticref "uploads/readings/Broman_and_Woo_2018.pdf" "newtab" %}}[download pdf]{{% /staticref %}} __This paper is *especially* important; it may well be one of the more helpful papers you read while a student. Really.__


4.  Johnson, B. D., Dunlap, E., and Benoit, E. (2010). Organizing "mountains of words" for data analysis, both qualitative and quantitative. Substance Use & Misuse, 45(5), 648-70.  [[read online]](https://www.tandfonline.com/doi/abs/10.3109/10826081003594757?journalCode=isum20) or {{% staticref "uploads/readings/Johnson_etal_2010.pdf" "newtab" %}}[download pdf]{{% /staticref %}}. 

### Computer Resources

1. **Please bring your computer**. If you need to borrow a laptop or get access to a computer let me know.
    
2. **You will need access to a spreadsheet program** (e.g., MS Excel, LibreOffice, Google Sheets). You can use the program of your choice, but the exercises are optimized for MS Excel. UF students can download the Microsoft Office suite free of charge [here](https://it.ufl.edu/services/gatorcloud-microsoft-office-online); if you don't want to install Excel you can use the online version for free ([see this tutorial video on how to do so](https://youtu.be/ePrGRj9o7sU)). LibreOffice is a free and open source package similar to (and compatible with) MS Office. It can be downloaded [here](https://www.libreoffice.org/). If you are using an online version (e.g., Excel from Office 365, Google Sheets) you will need to know how to save the files on your desktop - at least for the first few weeks of class. 

3. **It is time to install `R` and `RStudio`**. We won't use them until Week 4, but it is worth installing them now to make sure they are working smoothly:  
    
    (i) **the R programming language**: You can download the version of R for your computer operating system [here](https://cran.rstudio.com/); it's free.
      * **_If you need help:_** watch [this video tutorial](https://www.linkedin.com/learning/learning-r-2/installing-r?u=41282748) or contact me. _Note that the tutorial requires you be a UF affiliate and either on campus or logged to the UF network via VPN_.   
        
    (ii) **RStudio** is the interface program we use to work with R. There are other 'environments' for R programming, but RStudio is by far the most widely used and useful. 

      * We use the 'Free Open-Source Desktop Version', which [you can download here](https://rstudio.com/products/rstudio/download/#download). Choose the version for your computer operating system and install as you would any other software. 
      * **If you need help**: watch [this video tutorial](https://www.linkedin.com/learning/learning-r-2/installing-rstudio?u=41282748) or contact me. _Note that the tutorial requires you be a UF affiliate and either on campus or logged to the UF network via VPN_. You can also 
      
    (iii) **Verify the installations** worked by opening RStudio to see if it opens properly. If you are really motivated, you can also install the `Tidyverse` library by starting RStudio and at the console typing `install.packages("tidyverse")`.


4. If you are interested in getting a jump-start learning how to use R, or would like some refresher training, I recommend the following: 

      (i) The LinkedIn Learning course by Barton Poulson is an excellent introduction that assumes no prior programming experience. [You can find it here](https://www.linkedin.com/learning/r-for-data-science-analysis-and-visualization/using-the-exercise-files?u=41282748).
      
      (ii) If you prefer a "written" course, the R for Reproducible Analysis course from The Carpentries is also very good. [You can find it here](https://swcarpentry.github.io/r-novice-gapminder/index.html).  
