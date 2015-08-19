library(curl)
library(magrittr)
library(readr)
library(tidyr)
library(dplyr)
library(devtools)

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

use_data(pdo, overwrite = TRUE)

