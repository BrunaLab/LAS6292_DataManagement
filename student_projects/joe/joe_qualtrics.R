# how to get qualtrics API key
# https://api.qualtrics.com/instructions/docs/Instructions/api-key-authentication.md

# qualtRics package: https://github.com/ropensci/qualtRics
# vignette: 
# https://cran.rstudio.com/web/packages/qualtRics/vignettes/qualtRics.html
# and 
# https://cran.r-project.org/web/packages/qualtRics/qualtRics.pdf

library(qualtRics)


qualtrics_api_credentials(api_key = "6zeQRkQhOwfGC4SvKrqQge3C4unA9Hs3lNjparZl", 
                          base_url = "ufl.ca1.qualtrics.com",
                          install = TRUE,
                          overwrite = TRUE)

# Once your Qualtrics API credentials are stored, you can see what surveys 
# are available to you.
library(qualtRics)

surveys <- all_surveys() 
surveys[1] # id numbers of the surveys

mysurvey <- fetch_survey(surveyID = surveys$id[1], 
                         verbose = TRUE)


# what are the questions in a certain survey?
questions <- survey_questions(surveyID = surveys$id[1])
questions$question[5]

mysurvey <- fetch_survey(surveyID = surveys$id[1], 
                         save_dir = "./student_projects/joe", 
                         verbose = TRUE,
                         force_request = TRUE)
mysurvey <- readRDS(file = "./student_projects/joe/SV_d5VK3ccR94KGfNs.rds")


# Other posts -------------------------------------------------------------


# https://www.adrianbruegger.com/post/import-qualtrics-csv-files/
# https://www3.nd.edu/~sberry5/qualtricsAPI.html
# https://blogs.uoregon.edu/rclub/2016/05/18/bringing-in-qualtrics-and-other-data/
# https://druedin.com/2019/12/01/getting-qualtrics-data-into-r/
  
# QualtricsTools ----------------------------------------------------------
# https://github.com/emma-morgan/QualtricsTools

devtools::install_github("emmamorgan-tufts/QualtricsTools")

library(QualtricsTools)
app()

# Load and Process Survey Data into R
get_setup()

# Start and run the Shiny app
app()

# Create a Report of Question Results Tables
make_results_tables()

# Create a Report of Text Appendices, for each free response part of the survey
make_text_appendices()
