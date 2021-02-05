# ------------------------------------------------------------------------
## script name:
## Author: Emilio Bruna (embruna@ufl.edu)
## Date Created: 2021-02-02
## script description:
##
# -------------------------------------------------------------------------
## Options
# options(scipen = 6, digits = 4) 
# I prefer to view outputs in non-scientific notation
# -------------------------------------------------------------------------
## Packages:  (uncomment as required)
library(tidyverse)
# -------------------------------------------------------------------------
## load functions into memory
##


# step-by-step of live-code demo ------------------------------------------
# 
# 1. Outline what you want to do with code, 
#   Look at dataset and find the things you want to change
# 2. Quick tour of the RStudio windows
# 3. Quick reminder that # allows comments
# 3. Set up a project with folders, put raw data in folders
# 4. new .R file
# 5. Add key info to .R file 
# 6. Add the "Steps" to the .R as headings
# 7. load packages
# 8. sessionInfo() 

# Introduce the RStudio window and tools

# Introduce Sections with shift-opt-R and how can use them to map corrections

# Introduce the importance of commenting.

# Load packages

library(tidyverse)

# load the file with 'read_csv'
class_data <- read_csv("./class_outlines/wk4_reproducibility/demo_data.csv")

# When we loaded the data into R, it got stored as an object of class tibble, 
# which is a special kind of data frame. A data frame is the representation of
# data in the format of a table where the columns are vectors that all have the
# same length. Because columns are vectors, each column must contain a single 
# type of data (e.g., characters, integers, factors).

# you can see the size of the df

# dim(class_data) - returns a vector with the number of rows in the first element,
# and the number of columns as the second element (the dimensions of the object)
dim(class_data)
# nrow(class_data) - returns the number of rows
nrow(class_data)
# ncol(class_data) - returns the number of columns
ncol(class_data)
# names(surveys) - returns 
# the column names (synonym of colnames() for data.frame objects)

names(class_data)
colnames(class_data)

# look at the top few rows with 'head'
head(class_data)

# open it an look at it with 'view' or 2x click
view(class_data)

# Inspect the data with 'glimpse'
glimpse(class_data)
# or
str(class_data)

# Change column data types
# as.factor() or factor()

as.factor(class_data$roof)
factor(class_data$roof)
class_data$roof<-as.factor(class_data$roof)

# Change column data types - ordered factors
class_data$size
as.factor(class_data$size)
ordered(class_data$size, levels = c("small", "large"))
class_data$size <- ordered(class_data$size, levels = c("small", "large"))
levels(class_data$size)


# converting numbers from factor to numeric can get complicated
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct] #preferred

# Is there missing data? (R uses NA to represent missing values.)?
# How many different roof types are there?
levels(class_data$floor)
# why null? hadn't converted yet
class_data$floor<-as.factor(class_data$floor)
levels(class_data$floor)
# the tidyverse way
distinct(class_data,floor)

# how many categories
nlevels(class_data$floor)
# The tidyverse way.  Notice a difference in the output?
distinct(class_data,floor) %>% count()

# How many in each category?
summary(class_data$floor)
# the tidyverse way
class_data %>% group_by(floor) %>% summarise(n())

# How long a period does the dataset cover?
range(class_data$year)


# Change factors: 
# convert NA to "missing"
class_data$floor[is.na(class_data$floor)] <- "missing"
# throws error. this is because NA is not a factor right now.
# two approaches. Add 'missing' as a factor, then change NAs to missing
# OR
# change to character, replace, and the convert backs
class_data$floor<-as.character(class_data$floor)
class_data$floor[is.na(class_data$floor)] <- "missing"
class_data$floor<-as.factor(class_data$floor)
levels(class_data$floor)

# OR the tidyverse way 
class_data$floor<-fct_explicit_na(class_data$floor, 'missing')

# What about correcting a factor level?
class_data$floor<-as.character(class_data$floor)
class_data$floor[class_data$floor=="errth"] <- "earth"
class_data$floor<-as.factor(class_data$floor)
levels(class_data$floor)

class_data$floor<-as.factor(class_data$floor)
levels(class_data$floor)

# OR the tidyverse way
class_data$floor<-recode(class_data$floor, earth = "EARTH")
class_data$floor<-recode(class_data$floor, earth = "EARTH", cement = "CEMENT")

# You can use recode() directly with factors; it will preserve the existing 
# order of levels while changing the values. Alternatively, you can 
# use recode_factor() , which will change the order of levels to match the 
# order of replacements.



# finally, a few others I find very useful when data cleaning. 
# I usually do these first on all columns to make life easier

class_data$floor
class_data$floor<-tolower(class_data$floor)
# note that this converts to character, so have to change back to factor
class_data$floor<-as.factor(class_data$floor)
class_data$floor


# White space will drive you crazy, especially if around numbers
class_data <- read.csv("./class_outlines/wk4_reproducibility/demo_data.csv")
class_data$data_collector
class_data$data_collector<-trimws(class_data$data_collector)
# read_csv trim_ws is default=TRUE
# read.csv trim_ws is default=FALSE

# Now save the clean file to 
write_csv(class_data,"./data_clean/clean_data_20210205")

# Which we can reload for subsequent analyses
data_clean <- read_csv("./data_clean/clean_data_20210204")

# lke make plots


# NOW YOUR TURN - fisnish these corrections

# 1. Take the raw_data, find any thing that needs to be corrected
# (spelling mistakes, etc)

# 2. convert any "NA" to "missing"

# 3. convert factor levels in 'roof' and 'wall' to codes to make easier to read

# 4 convert 'rooms' to factor, then back to numeric

# save as a csv

# 5 submit your r code as homework 4


  




