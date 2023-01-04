library(rvest)

webpage <- read_html("https://www.computerworld.com/article/3109890/these-r-packages-import-sports-weather-stock-data-and-more.html")

tbls <- html_nodes(webpage, "table")
tbls_ls <- webpage %>%
  html_nodes("table") %>%
  .[1:1] %>%
  html_table(fill = FALSE)

tbls_ls <- webpage %>%
  html_nodes("table") %>%
  .[1:1] %>%
  html_table(fill = FALSE)



tbls2_ls <- list()

# scrape Table 2. Nonfarm employment...
tbls2_ls$Table1 <- webpage %>%
  html_nodes("#td") %>% 
  html_table(fill = TRUE) %>%
  .[[1]]

# Table 3. Net birth/death...
tbls2_ls$Table2 <- webpage %>%
  html_nodes("#Table3") %>% 
  html_table() %>%
  .[[1]]


str(tbls_ls)
foo<-tbls_ls[[1]][6]

