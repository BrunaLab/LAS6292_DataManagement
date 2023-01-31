# ------------------------------------------------------------------------
## script name:
## Author: Emilio Bruna (embruna@ufl.edu)
## Date Created: 2021-02-02
## Date Updated: 2022-01-25
## script description: Some examples of how to use the Tidyverse and BaseR 
## for data clean-up


# link to posit cloud project: https://posit.cloud/content/5320635
# remind students to make a permanent copy ( [+] save a permanent copy)

library(tidyverse)
# load the file with `read_csv`. 
# BE SURE TO POINT TO THE RIGHT LOCATION IN YOUR R STUDIO PROJECT 
# ./ is the "root folder" where your .Rproj file is located
demo <- read_csv("./course-materials/class-sessions/04-reproducibility/examples/demo_data.csv")

# This is a good time to go over the difference between `base R` and `Tidyverse`
glimpse(demo)
str(demo)

# You can also get an idea of the size of the df / tibble
# `dim(demo)` returns a vector with the number of rows in the 1st element,
# and the number of columns as the 2nd element (the dimensions of the object)
dim(demo)
# nrow(demo) - returns the number of rows
nrow(demo)
# ncol(demo) - returns the number of columns
ncol(demo)
# look at the top few rows with 'head'
head(demo)
# You'll note the `tidyverse` version is usually easier to read

# open it an look at it with 'view' or 2x click the name in 
view(demo)

# get a list of the column names ------------------------------------------
names(demo)
# or 
colnames(demo)  #for dataframes


# how do you look at individual columns? 
demo$year
# what is the range of values in a column `year`? --------------------------
range(demo$year)


### 3. Make changes

# 1. read and edit column names

names(demo)
# dataframe <- rename(dataframe, "new column name" = "old column name")
# `survey_year`: shorten to `year`
demo <- rename(demo, "year"="survey_year")
names(demo)
# `type_of_house_roof`: shorten to `roof`
demo <- rename(demo, "roof"="type_of_house_roof")
# `2020_kids`: change to `kids_2020`
demo <- rename(demo, "kids_2020"="2020_kids")
names(demo)

# 2. how many levels in factor?
levels(demo$roof)
unique(demo$roof)
demo$roof<-as.factor(demo$roof)
levels(demo$roof)

# 3. Correct the roof types

# by correcting spelling with gsub 
demo$roof<-gsub("mabati_sloping", "mabatisloping", demo$roof)

# The tidyverse way 
demo$roof<-recode(demo$roof, Grass = "grass")

# note that this would simpler if you just converted everything to lower case!
demo$roof<-tolower(demo$roof)

# 4. correct the data type of roof

demo$floor<-as.factor(demo$floor)

# 5. make `size` an ordered factor

# Change column data types to ordered factor
demo$size
as.factor(demo$size)
ordered(demo$size, levels = c("small", "large"))
# same thing...need to assign the change.
demo$size <- ordered(demo$size, levels = c("small", "large"))
levels(demo$size)

# 6. convert to roof to codes: `GR`, `MB`  
demo$roof

demo<- demo %>% mutate(roof = case_when(roof == "grass" ~ 'g',
                                        roof == "mabatisloping" ~ 'm',
                                        TRUE ~ roof))

# throws an error becauise there is an NA. two ways to deal with this: 

# a. replace the NAs:

demo <- demo %>% replace_na(list(roof = "missing"))

# b. change the cvvalue of what to repalce the NAs with 

demo<- demo %>% mutate(roof = case_when(roof == "grass" ~ 'g',
                                        roof == "mabatisloping" ~ 'm',
                                        TRUE ~ "missing"))

# 7. Add a column

demo$country<- "kenya"

# or 
demo<- demo %>% mutate(country = "kenya")


### 4. Export & verify clean data

# 1. save as a `.csv` file in the `data_clean` folder


write_csv(demo, "./data_clean/demo_clean.csv")

# Opening the clean `.csv` with excel to verify the changes are there

demo_clean<-read_csv("./data_clean/demo_clean.csv")




# How to convert NA to `missing` ------------------------------------------
demo$floor[is.na(demo$floor)] <- "missing"
# throws error. this is because NA is not a factor right now.
# two approaches. Add 'missing' as a factor, then change NAs to missing
# OR
# change to character, replace, and the convert backs
demo$floor<-as.character(demo$floor)
demo$floor[is.na(demo$floor)] <- "missing"
demo$floor<-as.factor(demo$floor)
levels(demo$floor)

# OR the tidyverse way 
demo$floor<-fct_explicit_na(demo$floor, 'missing')

