#' Download PDO Index Data
#'
#' Downloads PDO index data from
#' <http://research.jisao.washington.edu/pdo/PDO.latest>.
#'
#' `download_pdo()` is an alias for `pdo_download()`.
#'
#' For more information see <https://github.com/poissonconsulting/rpdo>.
#'
#' @return A data frame of the PDO index data.
#' @export
pdo_download <- function() {
  pdo <- get_pdo()
  pdo <- clean_pdo(pdo)
  pdo <- read_pdo(pdo)
  pdo <- tidy_pdo(pdo)
  check_pdo(pdo)
}

#' @rdname pdo_download
#' @export
download_pdo <- function() {
  pdo_download()
}
