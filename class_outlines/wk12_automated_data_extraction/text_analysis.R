* [Text Mining with R](https://www.tidytextmining.com/) by Julia Silge and David Robinson
* [`gutenbergr`](https://cran.r-project.org/web/packages/gutenbergr/index.html): Download and Process Public Domain Works from [Project Gutenberg](https://www.gutenberg.org/). Tutorial can be found [here](https://docs.ropensci.org/gutenbergr/)

library(gutenbergr)
gutenberg_metadata



psych <- gutenberg_download(13791)


oz <- gutenberg_download(514)

library(tidytext)

words <- oz %>%
  unnest_tokens(word, text)

word_counts <- words %>%
  anti_join(stop_words, by = "word") %>%
  count(title, oz, sort = TRUE)