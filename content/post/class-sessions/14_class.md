---
title: 'In-class Activities - Week 14'
author: R package build
date: '2022-02-11'
slug: class-week-14
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
weight: 24
---

# Automated Data Extraction 

![Efficiency Calculator, via [xkcd](https://xkcd.com/1205/)](https://imgs.xkcd.com/comics/is_it_worth_the_time.png)  

### Part 1: Scraping Data from Tables on Websites

1. Import Wikipedia tables into Google Sheets.  
  a. Open Wikipedia page of [List of Countries by Population (UN)](https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations))  
  b. Open a Google Sheet, click on cell **A1**, and then enter this in the 'Function Bar':
    >`=ImportHtml("https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)", "table", 1)`
    
    c. **Explanation:** the URL is the page for the entry, and `,1` at the end indicates what table on that page you want to import. _Be sure to include the quotation marks around the "URL" and "table"_.  
  
  
2. Scrape tables from websites into **R** with `rvest` (Live Coding).  

    a. Scraping a table from a generic webpage: [link to code used in class](https://gist.github.com/embruna/0614e25e6113f7d491f6ba826af87e04).   

    b. A tutorial on Importing a Wikipedia table to R can be found [here](https://kyleake.medium.com/wikipedia-data-scraping-with-r-rvest-in-action-3c419db9af2d).  

### Part 2: Downloading Books & Text Mining (Live Coding)

1. Download from Project Gutenberg, Text Extraction, Sentiment Analysis, and Visualizations: [link to code used in class](https://gist.github.com/embruna/20a42d68d3c56047fbffc585feb64fd1)


### Part 3: Extract data from published figures 

1. [Web Plot Digitizer](https://automeris.io/WebPlotDigitizer/) to extract data from several figures that differ in quality and content. Download the following three figures and we will extract the data from them using WPD:

    * [Bar Graph](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/sample_images_for_OCR/for_web_plot_digitizer/bar.png) from [Jiang _et al._ (2021)](https://doi.org/10.1080/15298868.2019.1657937) 
    * [Simple Scatter Plot](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/sample_images_for_OCR/for_web_plot_digitizer/pereira1.png) from [Pereira (2018)](https://doi.org/10.1590/0101-41614843tzp)
    * [Complex scatter plot](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/sample_images_for_OCR/for_web_plot_digitizer/pereira2.png) from [Pereira (2018)](https://doi.org/10.1590/0101-41614843tzp)






### Part 4: Extract data from pdfs/images with OCR

_**For submission to Canvas**_: [SmallPDF](https://smallpdf.com/), [OCR2Edit](https://www.ocr2edit.com/), and [pdf2go](https://www.pdf2go.com/) are three widely used sites that allow you to use Optical Character Recognition (OCR) to extrat text and numbers from `.pdf` or image files (i.e., `.tiff`, `.jpg`). Use these websites to:

  1. Extract text from these pdfs and images  
      * [ha_data.pdf](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_csv/ha_data.pdf)
      * [ha_pdf_of_excel.pdf](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_csv/ha_pdf_of_excel.pdf)
      * [pdf_of_excel.pdf](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_csv/pdf_of_excel.pdf)
      * [pic_of_invoice_jpg.jpeg](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_csv/pic_of_invoice_jpg.jpeg)
      * [pic_of_table_jpg.jpeg](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_csv/pic_of_table_jpg.jpeg)

  2. Import the data from these images and pdf's into an excel sheet  
  
      * [handwriting_pdf.pdf](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_text/handwriting_pdf.pdf)  
      * [text_photo_3.jpeg](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_text/text_photo_3.jpeg)  
     * [typed_text_1.jpeg](https://github.com/BrunaLab/LAS6292_DataManagement/blob/master/instructor-materials/class-sessions/14-automated-data-extraction/ocr_files_for_class/ocr_to_text/typed_text_1.jpeg)     
    
3. Compare the results: are some ties better than others at certain kinds of images? How much does image quality matter? 

4. Upload the OCR scans and your (brief) conclusions to Canvas. 

3. ***Bonus (if time permits)*** 
   
   * Try using google's OCR to import into google Docs ([tutorial](https://www.klippa.com/en/blog/information/google-docs-ocr/)). Note also [Google's AI OCR](https://cloud.google.com/use-cases/ocr).  
    
   * Try with your [iPhone](https://support.apple.com/en-us/HT212630) or [Android phone](https://www.usatoday.com/story/tech/tips/2022/05/08/iphone-android-use-smartphone-as-scanner/9674231002/).  


### OPTIONAL: Learning R Markdown

What is R Markdown? Short version: it's a way to convert your R Markdown file (with text and code) into any one of several output formats including: HTML, PDF, MS Word, slides for presentations (Beamer, HTML5 slides), books, dashboards, scientific articles, and websites. You can find the [complete overview here](https://rmarkdown.rstudio.com/). A gallery of the different things you can do with R Markdown [can be found here](https://rmarkdown.rstudio.com/gallery.html).

How does it work? 

> "When you knit the document, R Markdown sends the .Rmd file to knitr, http://yihui.name/knitr/, which executes all of the code chunks and creates a new markdown (.md) document which includes the code and its output. The markdown file generated by knitr is then processed by pandoc, http://pandoc.org/, which is responsible for creating the finished file. The advantage of this two step workflow is that you can create a very wide range of output formats""

#### 1. Tutorials & Resources

 - HW's tutorial is [here](https://r4ds.had.co.nz/r-markdown.html)
 - a [PC-specific tutorial](https://medium.com/@sorenlind/create-pdf-reports-using-r-r-markdown-latex-and-knitr-on-windows-10-952b0c48bfa9)
 - a [MacOS specific tutorial](https://medium.com/@sorenlind/create-pdf-reports-using-r-r-markdown-latex-and-knitr-on-macos-high-sierra-e7b5705c9fd) 
 - [This one](https://ourcodingclub.github.io/tutorials/rmarkdown/) is really comprehensive, probably the best of the group.
 - Actually, I like [this one](https://ucsbcarpentry.github.io/R-markdown/02-intro/index.html) even better 
 - R Markdown Cheat Sheet: [Download here](https://posit.co/resources/cheatsheets/)
 - LaTeX Cheat Sheet: [Download here](https://posit.co/resources/cheatsheets/) from the "Contributed" tab

#### 2. Install the following packages: 

- [`bookdown`](https://pkgs.rstudio.com/bookdown/)
- [`knitr`](https://github.com/yihui/knitr) (an overview is [here](https://yihui.org/knitr/))

#### 3. If you want to render to pdf, you will also need to install some additional tools: 

- [Pandoc](https://github.com/jgm/pandoc/releases). After installation, you should add the path of the Pandoc executable to the system PATH.
- A TeX distribution. For PC You can use [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/download); for [MacTeX](https://tug.org/mactex/mactex-download.html) base on your platform. 
- Just in case, here is [TexShop](https://pages.uoregon.edu/koch/texshop/)
- Note: TeX Live is designed to be cross-platform (running on Unix, MacOS, and Windows), MacTeX includes Mac-specific utilities and front-ends (such as TeXShop and BibDesk).
- Suggestions for the YAML (including latex packages and commands) to start customizing your pdf: [link to sample YAML](https://gist.github.com/embruna/dae2ff1f1c4b56ab0193fd29d22ba8af)  
- If you are writing a scientific paper, the [`rticles` package](https://pkgs.rstudio.com/rticles/) provides a suite of custom R Markdown templates for different journals. It is really convenient and easy to use.
- Even more useful is the [`papaja` package](https://github.com/crsh/papaja). This provides a template for preparing journal articles in the APA style, and is very customizable (it's the default I use for most of my papers).
- You can easily insert citations in your R Markdown document using the [`citr` package](https://github.com/crsh/citr). You can insert citations directly with the RStudio add-in and link to [Zotero libraries](https://www.zotero.org/).



<!--- ## Grading Rubric: ---->


