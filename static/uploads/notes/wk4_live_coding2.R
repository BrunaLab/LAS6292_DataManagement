# INTRODUCTION ---- 

# Emilio Bruna
# This code is to do a demonstration for class n different commands
# Spring Semester 2024



# This section will load the packages we need -----
# install.packages("tidyverse")

library(tidyverse)

# THIS SECTION LOADS THE DATA -----

demo<-read_csv("./data_raw/demo_data.csv")
demo

demo<-read_csv("./data_raw/demo_data.csv")
demo$data_collector
demo$data_collector<-trimws(demo$data_collector)
demo$data_collector<-tolower(demo$data_collector)
demo$data_collector<-toupper(demo$data_collector)

names(demo)
column_names<-names(demo)

column_names<-toupper(column_names)

names(demo)<-toupper(names(demo))
names(demo)<-tolower(names(demo))

# VALUABLE STUFF TO DO WITH A NEW DATASET

# 1. make everything lower case
# 2. remove white spaces from all columns
# 3. remove numbers from columns names

demo <- rename(demo, "kids_2020"="2020_kids", 
               "wall_type"= "wall type")

demo<-read_csv("./data_raw/demo_data.csv")
demo$data_collector<-trimws(demo$data_collector)
demo$data_collector<-tolower(demo$data_collector)

demo_small <- demo %>% rename("kids_2020"="2020_kids", 
                              "wall_type"= "wall type") %>% 
  select(key_id,survey_year,wall_type, data_collector) %>% 
  filter(data_collector=="eb")

# 1. Change types
demo <- demo %>% rename("kids_2020"="2020_kids", 
                        "wall_type"= "wall type") 


# make type_or_house_roof a factor

# first rename the column, it is tooooo looooong
demo <- demo %>% rename("roof_type"="type_of_house_roof") 

glimpse(demo)

demo$roof_type<- as_factor(demo$roof_type)

demo$roof_type<- as.character(demo$roof_type)  

glimpse(demo)  

demo$roof_type<- as_factor(demo$roof_type)

# this tells you what categories you have
levels(demo$roof_type)

demo$roof_type<-tolower(demo$roof_type)
glimpse(demo)
demo$roof_type<- as_factor(demo$roof_type)

levels(demo$roof_type)

demo<-demo %>% mutate(student_mood="sad")

demo<-demo %>% mutate(student_mood="happy")
levels(demo$roof_type)


# 2. replace values with correct values

demo<-demo %>% mutate(roof_type=case_when(roof_type=="mabati_sloping"~"ms",
                                          roof_type=="mabatisloping"~"ms",
                                          TRUE~roof_type))

glimpse(demo)
levels(as.factor(demo$roof_type))


# 3. save the clean csv file

write_csv(demo,"./data_clean/demo_clean.csv")


# OVERVIEW - WE DID A LOT TODAY!!!

# created an r project with folders for clean and raw data
# loaded a csv file (`read_csv`)
# changed column names (`reaname`)
# converted to upper and lower case (`tolower`, `toupper`)
# changed data type (`as.factor`, `as.character`)
# selected subsets of columns (`select`)
# filtered a subset of rows (`filter`)
# created new columns of data (`mutate`)
# changed all values in a column (`mutate`)
# changed subsets of values to a different value (ie, corrected them, `mutate` and `case_when`)
# save the clean data (`write_csv`)

