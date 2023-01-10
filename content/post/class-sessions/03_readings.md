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

1.  Tesi, W. 2020. An Outdated Version of Excel Led the U.K. to Undercount COVID-19 Cases. Slate. [[read online]](https://slate.com/technology/2020/10/u-k-covid-19-spike-caused-by-microsoft-excel-error.html) or {{% staticref "course-materials/readings/tesi2020.pdf" "newtab" %}}[download pdf]{{% /staticref %}}
        
        
2. Stolberg et al. 2020. CDC Test Counting Error Leaves Epidemiologists ‘Really Baffled’. NY Times.  [[read online]](https://www.nytimes.com/2020/05/22/us/politics/coronavirus-tests-cdc.html?referringSource=articleShare) or {{% staticref "course-materials/readings/Stolberg_2020_NYT.pdf" "newtab" %}}[download pdf]{{% /staticref %}}
        

3.  Broman, K. W., and Woo, K. H. (2018). Data organization in spreadsheets. The American Statistician, 72(1), 2-10.  [[read online]](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989) or {{% staticref "course-materials/readings/Broman_and_Woo_2018.pdf" "newtab" %}}[download pdf]{{% /staticref %}}

4.  Johnson, B. D., Dunlap, E., and Benoit, E. (2010). Organizing "mountains of words" for data analysis, both qualitative and quantitative. Substance Use & Misuse, 45(5), 648-70.  [[read online]](https://www.tandfonline.com/doi/abs/10.3109/10826081003594757?journalCode=isum20) or {{% staticref "course-materials/readings/Johnson_etal_2010.pdf" "newtab" %}}[download pdf]{{% /staticref %}}


### Computer Resources

1. **Please bring your computer**. If you need to borrow a laptop or get access to a computer let me know.
    
2. You will need a **spreadsheet program** such as MS Excel or LibreOffice installed on your comouter. You can use the program of your choice, but the exercises are optimized for MS Excel. UF students can download the Microsoft Office suite free of charge [here](https://it.ufl.edu/services/gatorcloud-microsoft-office-online); if you don't want to install Excel you can use the online version for free ([see this tutorial video on how to do so](https://youtu.be/ePrGRj9o7sU)). LibreOffice is a free and open source package similar to (and compatible with) MS Office. It can be downloaded [here](https://www.libreoffice.org/).

3. The paper by Broman and Woo on how to organize data in spreadsheets is *especially* important; it may well be one of the more helpful papers you read while a student. Really.

4. It is also time to install two other pieces of software. We won't use them until Week 4, but it is worth installing them now to make sure they are working smoothly:  
    
    (i) **the R programming language**: You can download the version of R for your computer operating system [here](https://cran.rstudio.com/); it's free.
    
      * **_For Mac computers_** click on 'Download R for (Mac) OS X', then chose the version of R for your operating system, i.e., macOS 10.13 (High Sierra), OS X 10.11 (El Capitan), Mac OS X 10.9 (Mavericks), etc.  
      * **_For PC computers_**: click on Download R for Windows, then click 'base' or 'install R for the first time'.  
      * **_For Linux_**: click on 'Download R for Linux'; after which you are on your own. Then again you use Linux, so you probably don't need my help anyway.  
      * **_If you need help:_** watch [this video tutorial](https://www.linkedin.com/learning/learning-r-2/installing-r?u=41282748) or contact me. _Note that the tutorial requires you be a UF affiliate and either on campus or logged to the UF network via VPN_.   
        
    (ii) **RStudio**: the software used to work with R. There are other 'environments' one can use for R programming, but RStudio is by far the most widely used and useful. 

      * We use the 'Free Open-Source Desktop Version', which [you can download here](https://rstudio.com/products/rstudio/download/#download). Choose the version for your computer operating system and install as you would any other software. 
      * **If you need help**: watch [this video tutorial](https://www.linkedin.com/learning/learning-r-2/installing-rstudio?u=41282748) or contact me. _Note that the tutorial requires you be a UF affiliate and either on campus or logged to the UF network via VPN_. 
    
    (iii) **Verify the installations** worked by opening RStudio to see if it opens properly. If you are really motivated, you can also install the `Tidyverse` library by starting RStudio and at the console typing `install.packages("tidyverse")`.


updated `r format(Sys.time(), %B, %Y')`


