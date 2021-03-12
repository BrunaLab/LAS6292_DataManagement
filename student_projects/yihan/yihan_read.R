library(XML)
library(RCurl)
library(rlist)

tables <- readHTMLTable("./data_raw/text_gloss_flying fox.htm")
tables <- list.clean(tables, fun = is.null, recursive = FALSE)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
tables[[which.max(n.rows)]]
df<-as.data.frame(tables[1])

#

library(tidyverse)
library(rvest)
library(XML)
library(RCurl)
url <- "./student_projects/yihan/data.html"
raw_data <- read_html(url) 
# str(raw_data)
body_nodes <- raw_data %>%
  html_node("body") %>% 
  html_children()
body_nodes %>% html_children()

tables<-html_nodes(raw_data, "table") # Here tables contains a list of tables 
table1 <- html_table(tables, fill = TRUE)
table2 <- html_table(tables[2], fill = TRUE)
table3 <- html_table(tables[3], fill = TRUE)
table4 <- html_table(tables[4], fill = TRUE)
table6 <- html_table(tables[6], fill = TRUE)


numbers<-raw_data %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all("//td[contains(@class, 'itx_txt')]") %>% 
  rvest::html_text()
numbers[1][1]
numbers
# numbers<-gsub("\n","",numbers)
numbers<-gsub(",","",numbers)
numbers<-gsub("%","",numbers)
numbers<-trimws(numbers)
numbers<-as_tibble(numbers)
colnames(numbers)<-"N"
numbers<-gsub(" ", "", numbers$N, fixed = TRUE)
numbers<-as_tibble(numbers)
numbers





%>%
  html_nodes("itx_morph_cf") %>%
  html_text()
raw_data[2]
  html_table(fill = TRUE)
raw_data<-as.data.frame(raw_data)


url %>%
  html_nodes("itx_Words") %>%
  # .[[3]] %>%
  html_table()






# 
library(rvest)
url <- "./student_projects/yihan/data.html"
raw_data <- read_html(url)

head_nodes <- raw_data %>%
  html_node("head") %>% 
  html_children()


tables<-html_nodes(raw_data, "table") # Here tables contains a list of tables 

table1 <- html_table(tables[2], fill = TRUE)
foo<-table1[[1]][1]
foo<-unlist(foo)
foo<-as.data.frame(foo)
foo[1,1]
foo[2,1]
foo[3,1]
foo[4,1]
foo[5,1]
foo[6,1]
foo[7,1]
foo[8,1]
foo[9,1]
foo[10,1]
foo[11,1]
foo[12,1]


table1[[1]][[1]]
table1[[1]][[2]]
table1[[1]][[3]]
table1[[1]][[4]]
table1[[1]][[5]]

table1 <- html_table(tables[3], fill = TRUE)
##################
lengths(table1)
body_nodes <- raw_data %>%
  html_node("body") %>% 
  html_children()

body_nodes[5]