# ------------------------------------------------------------------------
## script name:
## Author: Emilio Bruna (embruna@ufl.edu)
## Date Created: 2021-02-02
## script description: Some examples of how to use the Tidyverse and BaseR 
## for data clean-up

# step-by-step -----------------------------------------------
# FIRST THING: STEP AWAY FROM THE COMPUTER
# 1. Look at data set and make a list of the things you want to change
# 2. After that, make an outline of how you will do this with code.
#    There are often multiple ways to do the same thing, so an outline 
#    will help figure out whihc is best.
#    For instance: 
#     1. Import table 1
#     2. Correct column headings in Table 1
#     3. Import table 2
#     4. Correct column headings in Table 2
#     5. bind Table 1 and Table 2 Together
#     
#     is less efficient than 
#     1. Import table 1
#     2. Import table 2
#     3. Bind Table 1 and Table 2 Together
#     4. Correct the column headings in the Table 
#     
#     BUT there might be situations where you have to do them separately.

# 3. Reminder: # allows comments in the script that won't be read as commands 
# 3. Reminder: Set up a project with folders, put raw data in folders
# 4. Create a new .R file
# 5. Add key info to the .R file 
# 6. Add the "Steps" to the .R as Sections with shift-opt-R
# 7. the command `sessionInfo()` will tell you the verison of R you are using,
#    all the packages you have loaded, and other useful information.

# -------------------------------------------------------------------------
# load Packages:  (un-comment as required)
library(tidyverse)

# load the data -----------------------------------------------------------
# load the file with 'read_csv'
class_data <- read_csv("./class_outlines/wk4_reproducibility/demo_data.csv")

# When we loaded the data into R, it got stored as an object of class tibble, 
# which is a special kind of data frame. A data frame is the representation of
# data in the format of a table where the columns are vectors that all have the
# same length. Because columns are vectors, each column must contain a single 
# type of data (e.g., characters, integers, factors).


# overview of the dataframe -----------------------------------------------

# you can see the size of the df

# `dim(class_data)` returns a vector with the number of rows in the 1st element,
# and the number of columns as the 2nd element (the dimensions of the object)
dim(class_data)

# nrow(class_data) - returns the number of rows
nrow(class_data)

# ncol(class_data) - returns the number of columns
ncol(class_data)

# look at the top few rows with 'head'
head(class_data)

# open it an look at it with 'view' or 2x click
view(class_data)

# Inspect the data with 'glimpse'
glimpse(class_data)
# or
str(class_data)


# get a list of the column names ------------------------------------------

# names(surveys) - returns the column names 
names(class_data)
# colnames() does the same thing for dataframes
colnames(class_data)


# Change 'data type' of a column to `factor`------------------------------------


# as.factor() or factor()
as.factor(class_data$roof)
factor(class_data$roof)
# Why didn't these work? Because you need to assign the change to the variable 
# remember <- is the way we say "assign X to Y", in this case "Assign format
# `factor` to `class_data$roof`
class_data$roof <- as.factor(class_data$roof)

# Change column data types - ordered factors
class_data$size
as.factor(class_data$size)
ordered(class_data$size, levels = c("small", "large"))
# same thing...need to assign the change.
class_data$size <- ordered(class_data$size, levels = c("small", "large"))
levels(class_data$size)

# converting numbers from factor to numeric can get complicated
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct] # Preferred



# How many levels of a factor are there? ----------------------------------

# R uses NA to represent missing values
# can do these things `the Base R way` and `the tidyverse way`

# How many different roof types are there?
levels(class_data$floor)
# why null? hadn't converted yet
class_data$floor<-as.factor(class_data$floor)
levels(class_data$floor)
# the tidyverse way
distinct(class_data,floor)

# how many categories are there?
nlevels(class_data$floor)
# The tidyverse way.  Notice a difference in the output?
distinct(class_data,floor) %>% count()

# How many in each category?
summary(class_data$floor)
# the tidyverse way
class_data %>% group_by(floor) %>% summarise(n())


# what is the range of values in a column? --------------------------------

# How long a period does the dataset cover?
range(class_data$year)




# How to convert NA to `missing` ------------------------------------------
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



# how to correct a factor level (e.g., if misspelled?) --------------------

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


# other useful commands ---------------------------------------------------

# finally, a few others I find very useful when data cleaning. 
# I usually do these first on all columns to make life easier


# convert to lower case ---------------------------------------------------

class_data$floor
class_data$floor<-tolower(class_data$floor)
# note that this converts to character, so have to change back to factor
class_data$floor<-as.factor(class_data$floor)
class_data$floor



# change column names -----------------------------------------------------

# Change column name `floor` to `floor_type`



# you could do it by identifying the column numerically (this is base-R)
names(class_data)
colnames(class_data)[4] <- "floor_type1"
names(class_data)

# BUT I don't recommend this because if you change the order of columns without
# realizing it, you will change the name of the wrong column! Use the 
# tidyverse way of changing columns.


names(class_data)
# dataframe <- rename(dataframe, "new column name" = "old column name")
class_data <- rename(class_data, "floor_type"="floor_type1")
names(class_data)




# remove spaces before and after text -------------------------------------

# White space will drive you crazy, especially if around numbers
class_data <- read.csv("./class_outlines/wk4_reproducibility/demo_data.csv")
class_data$data_collector
class_data$data_collector<-trimws(class_data$data_collector)
# read_csv trim_ws is default=TRUE
# read.csv trim_ws is default=FALSE





# save your corrected file as a csv ---------------------------------------

# Now save the clean file as a csv
write_csv(class_data,"./data_clean/clean_data_20210205")


# load your clean file for more analyses ----------------------------------

# Which we can reload for subsequent analyses
data_clean <- read_csv("./data_clean/clean_data_20210204")


# follow-up exercises -----------------------------------------------------


# 1. Take the raw_data, find any thing that needs to be corrected
# (spelling mistakes, etc)

# 2. convert any "NA" to "missing"

# 3. convert factor levels in 'roof' and 'wall' to codes to make easier to read

# 4 convert 'rooms' to factor, then back to numeric

# save as a csv

# 5 submit your r code as homework 4


  




