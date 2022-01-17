install.packages('rvest')
library(rvest)
library(dplyr)
library(stringr)
library(lubridate)
library(xml2)

webpage <- read_html(
  'https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html'
)
webpage

results <- webpage %>% 
  html_nodes('.short-desc')
results


date <- str_c(results[1] %>% 
  html_nodes('strong') %>% 
  html_text(trim = TRUE), '. 2017')
date

xml_contents(results[1])
xml_contents()

results[1] %>% 
  html_nodes('.short-truth') %>% 
  html_text()

results[1] %>% 
  html_nodes('strong') %>% 
  html_text()
str_sub(xml_contents(results[1])[2] %>% 
  html_text(), 2, -2)

?str_sub
hw <- "Hadley Wickham"
str_sub(hw, 2, -2)
