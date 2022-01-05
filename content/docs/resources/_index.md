---
date: "2018-09-09T00:00:00Z"
icon: tools
icon_pack: fas
linktitle: Resources
summary: Learn how to use Wowchemy's docs layout for publishing online courses, software
  documentation, and tutorials.
title: Resources for Data Collection & Management
type: book
weight: 5
---
## File Formats, Naming conventions, Storage, and Security




## UF Data Storage Solutions

[GatorCloud](https://it.ufl.edu/services/gatorcloud-onedrive-uf)   
Read why I suggest NOT using MS One Drive [here](http://brunalab.org/blog/2015/07/24/onedrive-notes/)  
[UF Dropbox for Education](https://education.ufl.edu/educational-research/9729): [FAQ](https://cloud.it.ufl.edu/uf-dropbox/frequently-asked-questions/), and [signup information](https://cloud.it.ufl.edu/wp-content/uploads/2017/07/How-to-Obtain-Access-to-UF-Dropbox-for-Education.pdf), including How advisors can submit request for students to get a Dropbox account.


## File Types / Extensions / Formats

[Common Windows File Extensions (NMU IT)](https://it.nmu.edu/docs/common-windows-file-extensions )  
[Common File Extensions (PC Net)](https://pc.net/extensions/)  
[List of Open File Formats (Wikipedia)](https://en.m.wikipedia.org/wiki/List_of_open_formats)  
[File formats-Best Practices (Stanford Library)](https://library.stanford.edu/research/data-management-services/data-best-practices/best-practices-file-formats)  
[Library of Congress](http://www.loc.gov/preservation/resources/rfs/data.html)    

## File Names - Best Practices 

[Michigan Library](https://guides.lib.umich.edu/datamanagement/files)  
[Stanford Library](https://library.stanford.edu/research/data-management-services/data-best-practices/best-practices-file-naming)  
[Smithsonian](https://library.si.edu/sites/default/files/tutorial/pdf/filenamingorganizing20180227.pdf)  


## Data Security

[UF Office of Information Security and Compliance](https://security.ufl.edu/wp-content/uploads/2012/12/data-security-handouts.pdf)  
[Cyber Safeguards for UF](https://security.ufl.edu/learn-information-security/protect-yourself/data/)    
[UF IRB](http://irb.ufl.edu/index/data/1981-2.html)  
[UF Data Classification Policy](https://it.ufl.edu/policies/information-security/data-classification-policy/)  
[UF Office of Information Security and Compliance](https://security.ufl.edu/wp-content/uploads/2012/12/data-security-handouts.pdf)   

## Data Storage  & Backup

### Best Practices

[Penn Library](https://guides.library.upenn.edu/datamgmt/storage)
[Stanford Library Guidelines](https://library.stanford.edu/research/data-management-services/storage-and-backup)
 
### Tools for Automating Data Uploading:  

http://tinyurl.com/y9bz8suj  
http://tinyurl.com/y9bz8suj 

### Automated Backup

[SpiderOak](https://spideroak.com/)

### Backup Integrity:
[Data One](https://www.dataone.org/best-practices/ensure-integrity-and-accessibility-when-making-backups-data)  
Ensure integrity and accessibility when making backups of data  
Using Checksums to verify data integrity  

### File Syncing
[MacDropAny](https://www.macupdate.com/app/mac/37029/macdropany)  
[MultCloud](https://www.multcloud.com/)

### File Organization
[Software Carpentry](https://swcarpentry.github.io/r-novice-gapminder/02-project-intro/)   
[Open Science Framework](https://osf.io/) 

### Bulk Renaming of files:

[Adobe Bridge]  
[Bulk Rename](http://www.bulkrenameutility.co.uk/Main_Intro.php)  
[Renamer 5 (macOS)](https://renamer.com/)  
[PSRenamer](http://www.powersurgepub.com/products/psrenamer/index.html)   


## R Programming

### Essential

1. Hadley Wickham wrote a book on using the tidyverse and the [online version is FREE](https://r4ds.had.co.nz/). This is a phenomenal resource on using R to import, tidy, and visualize data. 

2. [RStudio Cheat Sheets](https://rstudio.com/resources/cheatsheets/): help with commands for using the different `tidyverse` packages, RStudio shortcuts and tricks, help with R commands, and more. You definitely want the ones for Data Import, Work with Strings, Factors, Data Transformation, and Base R.

3. Where and How to ask for help  

    * Hadley Wickham's advice on [how to write a good reproducible  
    example]((http://adv-r.had.co.nz/Reproducibility.html)) for getting help with R  
    * [how to post good questions on StackOverflow](https://www.r-bloggers.com/2011/01/three-tips-for-posting-good-questions-to-r-help-and-stack-overflow/)  
    * The UF [R-users listserv](http://www.r-gators.com/listserv/) is *very* user friendly and a great place to post requests for help. 



### Tutorials and Books

1. [R Essential Training: Wrangling and Visualizing Data](https://www.linkedin.com/learning/r-essential-training-wrangling-and-visualizing-data/navigating-the-rstudio-environment?u=41282748)

2. [Software Carpentry: Using RStudio for Project Organization & Management](https://swcarpentry.github.io/r-novice-gapminder/02-project-intro/)

3. [Swirl](https://swirlstats.com/)

4. [R Bootcamp](https://r-bootcamp.netlify.app/)

5. Kieran Healy's [*Data Visualization: a practical introduction*](https://socviz.co/) is my favorite introductory (yet super-comprehensive) book on data visualization with R. If you scroll down to the bottom of the page yu can download the datasets and code used to make the figures in the book, which makes life much easier.

6. [So. Many. Resources.](https://paulvanderlaken.com/2017/08/10/r-resources-cheatsheets-tutorials-books/)

7. [ROpenSci](https://ropensci.org/): tools for accessing, manipulating, and visualizing open data

# Specific Problems in Data Cleaning and Managemnt

1. [Handling dates and times in R](https://course.naturecast.org/docs/r-time-series-data/r_tutorial/)

2. Text Mining: [`tidytext`](https://juliasilge.github.io/tidytext/) package

3. Working with Qualtrics survey data with the [`qualtRics`](https://docs.ropensci.org/qualtRics/) package

4. Optical Character Recognition (OCR): extract text from images: [`tesseract`](https://docs.ropensci.org/tesseract/) package

5. Extract text & metadata from pdf files: [`pdftools`](https://docs.ropensci.org/pdftools/) package

6. Image processing in R: the [`magick`](https://cran.r-project.org/web/packages/magick/vignettes/intro.html) package


### Discipline-specific Resources

1. [`historydata`](https://github.com/ropensci/historydata) package: Sample data sets for historians learning R. They include population, institutional, religious, military, and prosopographical data suitable for mapping, quantitative analysis, and network analysis.

2. [*The Programming Historian*](https://programminghistorian.org/) Website: wide range of topics, from text analysis to OpenRefine


### Advanced R Topics

1. [`DataCurator`](https://github.com/qcif/data-curator) package: 'a simple desktop data editor to help describe, validate and share usable open data'.

2. [RegExr](https://regexr.com/): online tool to learn, build, & test Regular Expressions (RegEx / RegExp) 

2. [`knitr`](https://kbroman.org/knitr_knutshell/pages/overview.html) overview: reproducible documents witg R

3. Make [slide presentations with R](https://rmarkdown.rstudio.com/lesson-11.html)

[The qualtRics R package by ROpenSci](https://docs.ropensci.org/qualtRics/)   
[How to clean messy data in R](https://rfortherestofus.com/2019/12/how-to-clean-messy-data-in-r/)  
[rrefine package](https://cran.r-project.org/web/packages/rrefine/vignettes/rrefine-vignette.html)  

## Open Refine
[Open Refine](https://openrefine.org/)  
[the Carpentry Open Refine Lesson](https://datacarpentry.org/OpenRefine-ecology-lesson/04-scripts/index.html)   
[EDI Open Refine lessons](https://environmentaldatainitiative.org/webinars-events/previous-edi-events/how-to-clean-and-format-data-using-r-packages-datamaid-dplyr-openrefine-excel/)  




## Data Archives

[Qualitative Data Repository](https://qdr.syr.edu/)

## Learning R   
[Swirl](https://swirlstats.com/)


## DMPs

[Sample DMP for the Humanities](https://guides.library.ucla.edu/c.php?g=180580%20&p=1189056)   


## Text Extraction and Organization

[Plan for extraction and organization](https://towardsdatascience.com/organizing-your-first-text-analytics-project-ce350dea3a4a)   


## XML
[What is XML?](https://dh.obdurodon.org/what-is-xml.xhtml)    

## Form Design
[Best Practice for Form Design](https://medium.com/nextux/form-design-best-practices-9525c321d759)