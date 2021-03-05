# http://software.sil.org/fieldworks/support/limitations-and-plans/
library(tidyverse)
library(rvest)
library(xml2)
url <- "./student_projects/yihan/data.xml"

doc <- url %>%
  xml2::read_xml()


x<-read_xml(url)
xml_name(x)
xml_children(x)
baz <- xml_find_all(x, ".//paragraph")
foo<-as_list(read_xml(url))
foo[1]
foo<-baz[1]
foo <- str_split(baz)
foo<-as.character(foo)
foo<-as.data.frame(foo)
head(xml_path(baz))
xml_attr(baz, "type")





xml2_example()
xml_ns(x)


tables<-html_nodes(file, "table") # Here tables contains a list of tables 
table1 <- html_table(tables[4], fill = TRUE) # Extracting 4th table


library(XML)
fileName <- "./data2.xml"
xmlData <- xmlInternalTreeParse(fileName)

print(xmlData)
xmlDataFrame <- xmlToDataFrame(xmlData)

xmldoc <- xmlParse(url)
hh <- htmlParse(xmldoc, asText=T)
####
url <- "./student_projects/yihan/text_gloss_flying fox.htm"
library(rvest)
webpage <- read_html(url)
webpage
results1 <- webpage %>% html_nodes("p") %>% html_text
first_result <- results1[1]
first_result <- first_result[[1]]


read.table(text=gsub("(?<=[a-z])\\s+", "\n", first_result, perl=TRUE), 
           header=FALSE)

foo<-(first_result)
foo
foo<-data.frame(matrix(unlist(foo), nrow=2, byrow=T),stringsAsFactors=FALSE)
foo$X1<-gsub(" ","",foo$X1)
foo$X2<-gsub(" ","",foo$X2)
bind_rows(lapply(xml_attrs(foo), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))

to_mod <- xml_find_all(first_result)

df <- data.frame(matrix(unlist(foo), nrow=length(foo), byrow=TRUE))
first_result %>% html_nodes("itx_Frame_Number")

results