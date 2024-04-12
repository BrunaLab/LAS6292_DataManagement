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

library(tibble)
extracted_data<-as_tibble(tbls_ls,
                  .name_repair = c("unique"))

extracted_data