# pdf of labels to text
# library(magick) #convert jpeg to pdf
# library(pdftools) # extract text from pdf

# # read the jpeg
# label_1 <- image_read("./IMG_0074.JPG")
# image_info(label_1)
# # convert to pdf
# label_1_pdf <- image_convert(label_1, "pdf")
# image_info(label_1_pdf)
# # save it to the folder
# image_write(label_1_pdf, "./label_1.pdf")
# # # pdf_file <- "./test.pdf"
# pdf_file <- "./IMG_0074_export.pdf"
# txt <- pdf_text(pdf_file)
# cat(txt[1])
#~/Dropbox (UFL)/Teaching/LAS 6292 - Data Collection & Management/LAS6292_DataManagement/static/course-materials/class-sessions/13-automated-data-extraction/austin_example_text_extract_r
library(tesseract) #do all in one
tesseract_info() # what languages do you have installed?
tesseract_download("por") # install portuguese
text <- tesseract::ocr("./static/course-materials/class-sessions/13-automated-data-extraction/austin_example_text_extract_r/IMG_0074.JPG", engine = "por")
cat(text)
# you can see requires some cleanup 
# (note the \n and \a etc indicate line breaks, etc) but not much
# and can be done via coding)


files <- list.files(path = "./static/course-materials/class-sessions/13-automated-data-extraction/austin_example_text_extract_r/austin", pattern = "*.JPG", full.names = T)
austin <- sapply(files, tesseract::ocr, simplify=FALSE) %>% 
  bind_rows(.id = "id")
austin <- pivot_longer(austin,cols = starts_with("./static"),names_to="file")


