# ------------------------------------------------------------------------
## script name: wk_4_live_coding
## author: Emilio Bruna (embruna@ufl.edu)
## description: examples of using Tidyverse and BaseR for data clean-up


# introductory notes ------------------------------------------------------

# 1) Use pound symbol (#, a.k.a hashtag) to mark a line of your R script as a 
# comment that R should ignore and not a command to be executed.

# 2) use the "Insert Section" keyboard shortcut to indicate blocks of code 
# that are accomplishing a related set of tasks  

# 3) to get help with a specific command, use the "Help" tab in
# the bottom right box or type a question mark followed by the
# command in the console as follows: ?read_csv()

# Installing and loading libraries -----------------------------------------
# 
# To install a library, use the "Packages" tab in R Studio or 
# the `install.packages()` command. You can enter the command from the Console
# or using this line of code: install.packages(tidyverse)

library(tidyverse)



# load the data -----------------------------------------------------------

# use `read_csv()` to read the data into the R environment. The file's name is 
# `data_data.csv`. The location of the file is relative the location of 
# your .Rproj file (i.e., the root folder). If the file is in a folder called 
# `data_raw`, then the command should look like this:
demo <- read_csv("./data_raw/demo_data.csv")

# demo <- read_csv("./course-materials/class-sessions/04-reproducibility/examples/demo_data.csv")


# the data are now an 'object' with the name `demo`. This particular type of 
# object is called a 'tibble' (technically a tibble is a type of 'dataframe'. 
# People often use these terms interchangablty, or use the abbreviation `df`).
# other kinds of objects include matrices and vectors. Don't worry 
# about this right now.


# review the data ---------------------------------------------------------

# You can use the following commands to get an overview of the data in `demo`, 
# the `types` for each column, the names of each column, etc.

glimpse(demo) # tidyverse command
str(demo)     # base-R command. str = structure of the data

# as you can see, they provide similar information but the output of 
# `glimpse()` is easier to read


# you can also look at the top few rows of `demo` with with command 'head()'
head(demo)

# if you want to look at more rows, you can add the number to the command:
head(demo,20)

# The command `dim(demo)` returns a vector with two elements:
# the 1st is the number of rows the dataframe has and the second is the number 
# of columns (dim = the 'dimensions' of the object)
dim(demo)

# nrow(demo) - returns the number of rows the df has 
nrow(demo)

# ncol(demo) - returns the number of columns the df has 
ncol(demo)

# open inspect the data in Rstudios excel-style viewer with 'view()' or 
# 2x click the name in the 'Environment' tab.
view(demo)

# You can also have R return all of the values in a column of the data frame 
# as follows:
demo$floor

# the $ is read as 'at', i.e., demo at floor. Put another way, it means 'the
# column named 'floor' in the dataframe named demo'


# get a list of the column names ------------------------------------------
names(demo)
# or 
colnames(demo)  #for dataframes


# how do you look at individual columns? 
demo$survey_year
# what is the range of values in a column `year`? --------------------------
range(demo$survey_year)


# preparing the data for cleanup & corrections  ---------------------------

# Prior to correcting any errors in the data it is useful to simplify column
# names, correct the 'type' of each column, convert things to lower case, remove
# any white spaces before or after entries, etc.

# In R there are multiple ways to accomplish everything. Unless otherwise
# indicated, I will provide the `Tidyverse` command.


# ----- Correct or simplify column names ------

# to see the cnames of the columns in the df use:
names(demo) #tidyverse
# or
colnames(demo) #base-r

# to change the name of a column use the rename() command, which 
# has the following structure:

# dataframe <- rename(dataframe, "new column name" = "old column name")

# Example: shorten `survey_year` to `year`

demo <- rename(demo, "year"="survey_year")
# you can verify it worked with `names()`
names(demo)

# ----- Correct 'type' of data in a column  ------

# Example 1: you can use `glimpse(demo)` to see that column 'floor' is currently
# type `chr` (character). It should be a factor.

demo$floor<-as.factor(demo$floor)  # base R
# TRANSLATION: extract the column 'floor' in the dataframe named 'demo' 
# and converted it to type 'factor'. then take this new column and assign 
# it to replace the current column named 'floor' in the dataframe named 'demo'.
# 'floor' in the dataframe named 

# you can see the different 'levels' the data has with the command `levels()`
levels(demo$floor)

# Example 2: convert column `size` to 'ordered factor'

# the formatting is a bit more complicated
demo$size <- ordered(demo$size, levels = c("small", "large"))
# do you notice anything different about how the levels are reported now? 
levels(demo$size)


# ----- adding a column of data with the same values for all rows -----

# Example: you want to add a column identifying where the surveys were conducted
demo$country<- "kenya" # Base-R. 
# all rows in the column 'country' in the dataframe 'demo' should be assigned 
# the value "kenya"
# or 
demo<- mutate(demo, country = "kenya") # tidyverse. 
# mutate the dataframe demo to add a column named 'country' whose 
# values all equal 'kenya'. Muutate does what it sounds like it does:
# mutates a column in the dataframe. It can do so by chaning the values in it
# (see below) or creating a new one



# correct errors in the data ----------------------------------------------

# there are many ways to correct values of cells in the dataframe.

# ----- correct / change the floor types -----

# you can correct spelling mistakes with Base-R's gsub()', which substitutes 
# characters you specify with others you specify

# the syntax is: 
# df$column<-gsub("old characters", "new characters", df$column) 

# BE CAREFUL: if you aren't careful it can cause big problems
# e.g., "I need to replace the 'r' in 'errth' with an 'a' "
demo$floor<-gsub("r", "a", demo$floor)
demo$floor
# correct this by either releoading the data and starting over OR
demo$floor<-gsub("eaath", "earth", demo$floor)


# gsub has an unexpected effect:  can you tell what it is by using glimpse()?
glimpse(demo)

# Q: it converts the column you maniipulated back to type 'character'. you will
# need to convert it back to type 'factor' after using gsub.


# The tidyverse way is to use `recode()`:
demo$floor<-recode(demo$floor, "cement" = "concrete")
# How does this affect the coumns data type? 


# # ----- correcting capitalization  ----- 

# you can correct capitalization errors using gsub or recode, but better still:
# why not make everything lower case? less typing, and no risk of capital 
# letters messing up your code or results

demo$data_collector # before
demo$data_collector<-tolower(demo$data_collector) # change to lower case
demo$data_collector # after

# ----- changing strings/words to codes

# Example: convert different floor types to codes: `er`, `ct` 
# for this we will use one command inside another: 
# `case_when()` inside `muate()` 

demo$floor

demo<- demo %>% mutate(floor = case_when(floor == "earth" ~ 'er',
                                        floor == "concrete" ~ 'ct',
                                        TRUE ~ floor))

# mutate the column roof as follows: in the case when the value in a cell is 
# 'earth', replace it with 'er'. in the case where the value of a cell is 
# 'concrete', replace it with 'ct'. In all other cases, replace it with the 
# value in that cell from the column 'floor'

# Note: if you do this with a column in which there are NAs, you will get 
# an error message. So to repalce the NAs, do the following: 


# replacing NA values -----------------------------------------------------

demo <- demo %>% replace_na(list(floor = "missing"))
# (PS did you notice something different about the syntax above?)

# I make more mistakes when using the base-R command but here it is:
demo$roof[is.na(demo$floor)] <- "missing"
# this approach requires the column be in type 'character', so you may have
# to conmvert back and forth



# Save (i.e., 'export') clean data to your hard drive ---------------------

# to save the corrected df `demo` as a `.csv` file in the `data_clean` folder:
# remember to start from the location of the .Rproj file
# write_csv(name_of_df_to_save, "folder on computer")

write_csv(demo, "./data_clean/demo_clean.csv")

 
# You can import and view the clean `.csv` file to verify the changes 

demo_clean<-read_csv("./data_clean/demo_clean.csv")
view(demo_clean)



# YOUR TURN ---------------------------------------------------------------

# 1. `2020_kids`: change to `kids_2020`
# 2. what happens if you try to see the range of values for `kids_2020`?
range(demo$kids_2020)
# 3. what if you use: 
range(demo$kids_2020,na.rm=FALSE)
# 4. why do you think it works now? for a hint check the help: 
?range() 
# 5. correct or simplify all other column names as you see fit,
# 6. correct any errors in the data
# 7. replace all NA values
# 8. replace long text responses with codes
# 9. Reproduce your results: Quit RStudio, run the entire script, 
# and verify the output is the same
# BONUS: convert the values in kids_2020 to "<4", "4", or ">4" 
