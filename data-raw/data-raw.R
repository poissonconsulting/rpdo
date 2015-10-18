library(curl)
library(magrittr)
library(readr)
library(tidyr)
library(dplyr)
library(rpdo)
library(assertr)
library(lubridate)
library(devtools)

data(pdo)
old_pdo <- pdo

pdo <- tempfile()
curl_download("http://research.jisao.washington.edu/pdo/PDO.latest", pdo)
pdo %<>% readLines()

pdo <- pdo[grepl("(^YEAR)|(^\\d{4,4}[*]{0,2})\\s", pdo)]
pdo %<>% strsplit(" ")
pdo %<>% lapply(function (x) x[grepl(".+", x)])
pdo %<>% sapply(function (x) paste(x, collapse = ","))
pdo %<>% paste(collapse = "\n")
pdo %<>% read_csv()
pdo %<>% gather("Month", "PDO", -YEAR)
pdo %<>% rename(Year = YEAR)
pdo %<>% mutate(Month = as.integer(Month))
pdo %<>% na.omit()
pdo %<>% arrange(Year, Month)

stopifnot(nrow(old_pdo) < nrow(pdo))

old_pdo %<>% left_join(pdo, by = c("Year", "Month")) %>% verify(PDO.x == PDO.y)

pdo %<>% verify(!is.na(PDO)) %>% verify(abs(PDO) < 4) %>%
  verify(Month %in% 1:12) %>% verify(Year %in% 1900:year(Sys.Date())) %>%
  verify(diff(Month) %in% c(1, -11)) %>% verify(diff(Year) %in% c(0, 1))

use_data(pdo, overwrite = TRUE)
