library(usethis)
library(tibble)
library(rpdo)

pdo <- pdo_download()
pdo <- as_tibble(pdo)
use_data(pdo, overwrite = TRUE)
