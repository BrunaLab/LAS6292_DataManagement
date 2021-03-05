# elsa import
library(tidyverse)
elsa_data <- read.delim("./explicit.txt", header = TRUE, sep = "\t", dec = ".")
elsa_data <- as_tibble(elsa_data) # convert it to a tibble (a form of dataframe)

names(elsa_data)
# first, lets reanme this column:  question_nameeeeeeeeeeeee

elsa_data <- elsa_data %>%
  rename("question_name" = "question_nameeeeeeeeeeeee")

# 2nd lets put the columns in an order that makes sense,
# with session_id first
elsa_data <- elsa_data %>% 
  select(study_name,
         session_id,
         attempt,
         task_number,
         questionnaire_name,
         question_number,
         question_name,
         question_response)

# Lets see how many different session_id there are

session_id_pre <- elsa_data %>% summarize(n = n_distinct(session_id))
session_id_pre

# from the tidyverse, to convert data from long format to wide format
# you use the pivot_wider function: 
# pivot_wider(names_from = station, values_from = seen).

# The following are done in a specific order to make sure they get spread
# out properly, but I need to check with you that I inferred the correct order.
# Need to build backwards

# First, take the column question_name and make each unique question a column. 
# the values that go into each column come from question_response
elsa_data <- elsa_data %>% 
  pivot_wider(names_from = question_name, values_from = question_response)

# now take each questionanaire_name and make it a column. The answers from
# the responses are drawn from question_number 
elsa_data <- elsa_data %>% 
  pivot_wider(names_from = questionnaire_name, values_from = question_number)

# This will "collapse" all of the ones from the same session_id into a
# single row if there is only one value in each column for that session_id
elsa_data <- elsa_data %>% 
  group_by(session_id) %>% 
  summarize(across(everything(), ~ first(na.omit(.))))


# now lets see how many session_id there are after rearranging...
session_id_post <- elsa_data %>% summarize(n = n_distinct(session_id))
#...and compare to the initial count to see if they are the same
session_id_post$n == session_id_pre$n
# TRUE indictes they are the same number, which is a good sign.
names(elsa_data)


# WE WILL SAVE THIS UNTIL WE ARE SURE THE RESHAPING IS CORRECT
# You should change the data types so we can summmarize and see what 
# the data look like

# elsa_data$session_id <- as.factor(elsa_data$session_id)
# elsa_data$study_name <- as.factor(elsa_data$study_name)

# # With so many, shcanging one at a time can be tedious.
# # Instead of doing one at a time, can do for multiple ones by indexing. 
# # BE CAREFUL!! IT IS EASY TO MESS THIS UP
# cols_factor <- names(elsa_data)[1:2] 
# elsa_data[cols_factor] <- lapply(elsa_data[cols_factor], as.factor)
# cols_factor <- names(elsa_data)[5] 
# elsa_data[cols_factor] <- lapply(elsa_data[cols_factor], as.factor)
# cols_factor <- names(elsa_data)[20] 
# elsa_data[cols_factor] <- lapply(elsa_data[cols_factor], as.factor)
# 
# cols_numeric <- names(elsa_data)[3:4] 
# elsa_data[cols_numeric] <- lapply(elsa_data[cols_numeric], as.numeric)
# str(elsa_data$d)
# cols_numeric <- names(elsa_data)[21] 
# elsa_data[cols_numeric] <- lapply(elsa_data[cols_numeric], as.numeric)
# # * NOTE! The reason int introiduyced NAs is because there waws at leaston that was "null"
# 
# summary(elsa_data)
