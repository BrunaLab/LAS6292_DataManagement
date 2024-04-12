
library(tidyverse)  
library(googledrive)  

# Translation of Text  -----------------------------------------------------

# 1. Translate in Google Doc
# 2. Translate in MS Word Doc
# 3. https://www.diffchecker.com/diff

# 4/1AY0e-g7c3fmP5aI7RtyOR_qm7QeOxCz0Tcmdy5iyRMfQfuv6YmJs8ctq3SI
# files in google drive  --------------------------------------------------

# First list up to n_max of the files you see in My Drive. You can expect to be 
# sent to your browser here, to authenticate yourself and authorize the 
# googledrive package to deal on your behalf with Google Drive.

a<-drive_find(n_max = 10)
a[1,2]
a[2,2]

# You can narrow the query by specifying a pattern you’d like to match 
# names against. Or by specifying a file type: the type argument understands 
# MIME types, file extensions, and a few human-friendly keywords.

# x <- drive_find(pattern = "_to_english")
# drive_get(as_id(x$id))
# x$id[1]
# gdrive_file <- drive_get(id = "1z64-PTCydZIB_afaYXYUf4fVniFckHmGZwVgbeg4nNY")
# 

# import a google doc file from gdrive ------------------------------------

x<-drive_get("~/files_for_class")
# drive_get(as_id(x$id))
# x$id[1]
gdrive_file <- drive_ls("~/files_for_class")
gdrive_file
gdrive_file <- drive_get(id = "1HwGYGyHzdJIqq4X1ljfjc4zED7H8naFz")
id<-gdrive_file$id[1]

# how to import it into r as df
# https://googledrive.tidyverse.org/reference/drive_read_string.html

# all text in single cell
file_text<-drive_read_string(id, type = NULL, encoding = NULL)
file_text<-as_tibble(file_text)

# each paragraph in a single cell 
file_text_sep<-id %>% 
drive_read_string(type = "text/plain") %>%
  strsplit(split = "(\r\n|\r|\n)") %>%
  .[[1]] %>% 
  as_tibble() %>% 
  filter(value!="") %>% 
  mutate(value=trimws(value))

# each sentence in a single cell
file_text_sep<-id %>% 
  drive_read_string(type = "text/plain") %>%
  strsplit(split = "(\r\n|\r|\n|[.])") %>%
  .[[1]] %>% 
  as_tibble() %>% 
  filter(value!="") %>% 
  mutate(value=trimws(value))



# translate using Google API ----------------------------------------------


install.packages("googleLanguageR")
library(googleLanguageR)
library(stringr)
head(file_text_sep)

sentences_new <- head(file_text_sep) %>% 
  # I added the head() function above to not have to translate every single element in this long dataset. It should be removed in actual translations.
  sapply(., str_squish) %>%
  # sapply(., first_letter_upper) %>%
  na.omit %>%
  data.frame(stringsAsFactors = FALSE)


install.packages("cld2")
library(cld2)
detected_language <- sentences_new %>% 
  sapply(., map_chr, detect_language) %>% 
  data.frame(check.names = FALSE)


# now translate to english
# requires API (and possibly credit card)
gl_auth("google_api_auth.json")


for (i in 1:ncol(sentences_new)){
  # we replace all the elements in sentences_new that are =="es":
  sentences_new[,i][detected_language[,i] =="es" & !is.na(detected_language[,i])] <- 
    # with their translation (gl_translate) to target="it" then we transform it to a dataframe and makes sure all missing values are in NA form:
    data.frame(gl_translate(sentences_new[,i][detected_language[,i] =="en" & !is.na(detected_language[,i])], target = "en"))[,1]
  
  sentences_new[,i][sentences_new[,i] %in% c("NA", "N/a", "N/A", "Na", "na", "n/a", "not applicable")] <- NA
}

# 
# 
# file_text_sep
# 
# file_text_sep
# # # out <- unzip(temp, exdir = tempdir())
# foo<-read.delim("./files_for_class/spanish_text.txt")
# # bank <- read.csv(out[14], sep = ";")
# # drive_download(gdrive_file,path = "./doc1.txt",overwrite = TRUE)
# 
# my_translation <- 
#   read.delim("./spanish_text.txt",
#              header=FALSE)
# my_translation
# my_translation_all_together <- paste(unlist(my_translation), collapse =" ")
# my_translation_all_together
# nchar(my_translation_all_together)
# indo<-as.data.frame(my_translation_all_together)
# my_translation_MS_WORD <- 
#   read.delim("./class_outlines/wk10_transcription_translation/port_text_demo_eng.txt", header=FALSE)
# 
# my_translation_MS_WORD_all_together <-paste(unlist(my_translation_MS_WORD), collapse =" ")
# 
# my_translation_all_together==my_translation_MS_WORD_all_together
# nchar(my_translation_all_together)
# nchar(my_translation_MS_WORD_all_together)
# 
# 
# # Transcription of an audio recording (English) using transcription tools.
# 
# # SNL SKETCH
# 
# # ELEVEN
# 
# 
# https://fromthepage.com/
#    https://www.annotationstudio.org/project/
# 
# 
# 
# 
# ```{r}
# 
# ```