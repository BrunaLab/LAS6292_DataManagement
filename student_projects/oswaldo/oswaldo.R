
# You can read in .xls and .xlsx files using the `readxl` package,
# which is part of the tidyverse and so well linked to what you have learned. 
# https://readxl.tidyverse.org/

# load packages -----------------------------------------------------------


library(tidyverse)
library(readxl)


# extract the name of all the sheets in the xlsx --------------------------

# give the path to the file a name (makes things easier)
oswaldo<-"./student_projects/oswaldo/datasets.xlsx"
# The name of each sheet
excel_sheets(oswaldo)


# read in what is in each sheet -------------------------------------------

# Read in a specific sheet
segments <- read_excel(oswaldo, sheet = "Coded Segments")
segments
code_system <- read_excel(oswaldo, sheet = "Code System")
code_system

# These are now ready for you to clean up in R!!