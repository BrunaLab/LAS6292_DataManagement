
library(tidyverse)  
library(googledrive)  

# Translation of Text  -----------------------------------------------------

# 1. Translate in Google Doc
# 2. Translate in MS Word Doc
# 3. https://www.diffchecker.com/diff


# files in google drive  --------------------------------------------------

# First list up to n_max of the files you see in My Drive. You can expect to be 
# sent to your browser here, to authenticate yourself and authorize the 
# googledrive package to deal on your behalf with Google Drive.

drive_find(n_max = 30)

# You can narrow the query by specifying a pattern you’d like to match 
# names against. Or by specifying a file type: the type argument understands 
# MIME types, file extensions, and a few human-friendly keywords.


x <- drive_find(pattern = "translation")
drive_get(as_id(x$id))
gdrive_file <- drive_get(id = "1x_9IjhRdve1z4EJqIdzdg8y9t3Yjwhxqs_KJF6G7J_k")

drive_download(gdrive_file,path = "./class_outlines/wk10_transcription_translation/doc1.txt"),
    overwrite = TRUE)

my_translation <- 
  read.delim("./class_outlines/wk10_transcription_translation/doc1.txt",
             header=FALSE)
my_translation
my_translation_all_together <- paste(unlist(my_translation), collapse =" ")
my_translation_all_together

my_translation_MS_WORD <- 
  read.delim("./class_outlines/wk10_transcription_translation/port_text_demo_eng.txt", header=FALSE)

my_translation_MS_WORD_all_together <-paste(unlist(my_translation_MS_WORD), collapse =" ")

my_translation_all_together==my_translation_MS_WORD_all_together
nchar(my_translation_all_together)
nchar(my_translation_MS_WORD_all_together)


# Transcription of an audio recording (English) using transcription tools.

 # SNL SKETCH

# ELEVEN


https://fromthepage.com/
  
  https://www.annotationstudio.org/project/




```{r}

```