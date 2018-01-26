get_pdo <- function () {
  pdo <- tempfile()
  download.file("http://research.jisao.washington.edu/pdo/PDO.latest", pdo)
  readLines(pdo)
}

clean_pdo <- function (pdo) {
  pdo <- pdo[grepl("(^YEAR)|(^\\d{4,4}[*]{0,2})\\s", pdo)]
  pdo <- gsub("[*]+", "", pdo)
  pdo <- gsub(" [.]", "0.", pdo)
  pdo <- gsub("[ ]+$", "", pdo)
  pdo <- gsub("[ ]+", " ", pdo)
  pdo
}

read_pdo <- function (pdo) {
  pdo <- strsplit(pdo, " ")
  pdo <- lapply(pdo, function(x) c(x, rep(NA, 13 - length(x))))
  pdo <- vapply(pdo, function(x) paste(x, collapse = ","), "")
  pdo <- paste(pdo, collapse = "\n")
  pdo <- readr::read_csv(pdo)
  pdo
}

tidy_pdo <- function (pdo) {
  pdo <- tidyr::gather_(pdo, "Month", "PDO", c("JAN", "FEB", "MAR", "APR", "MAY", "JUN",
                                            "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"))
  pdo <- dplyr::rename_(pdo, .dots = list(Year = ~YEAR))
  pdo$Month <- toupper(pdo$Month)
  pdo$Month <- factor(pdo$Month, levels = toupper(as.character(lubridate::month(1:12, label = TRUE))))
  pdo <- dplyr::mutate_(pdo, .dots = list(Year = ~as.integer(Year), Month = ~as.integer(Month)))
  pdo <- dplyr::filter_(pdo, ~!is.na(PDO))
  pdo <- dplyr::arrange_(pdo, ~Year, ~Month)
  pdo <- dplyr::as.tbl(pdo)
  pdo
}

check_pdo <- function (pdo) {
  old_pdo <- rpdo::pdo

  datacheckr::check_data3(pdo, values = list(
    Year = c(1900L, as.integer(lubridate::year(Sys.Date()))),
    Month = c(1L, 12L),
    PDO = c(-4, 4)
  ))

  old_pdo <- dplyr::left_join(old_pdo, pdo, by = c("Year", "Month"))

  if (any(is.na(old_pdo$PDO.x))) stop("missing PDO index data", call. = FALSE)
  if (any(old_pdo$PDO.x != old_pdo$PDO.y)) stop("incorrect PDO index data", call. = FALSE)

  if (!any(diff(pdo$Month) %in% c(1, -11))) stop("missing PDO index data", call. = FALSE)
  if (!any(diff(pdo$Year) %in% c(0, 1))) stop("missing PDO index data", call. = FALSE)
  invisible(pdo)
}

#' Download PDO Index Data
#'
#' Downloads PDO index data from
#' \url{http://research.jisao.washington.edu/pdo/PDO.latest}.
#'
#' For more information see \url{https://github.com/poissonconsulting/rpdo}.
#'
#' @return A tbl data.frame of the PDO index data.
#' @export
download_pdo <- function() {
  pdo <- get_pdo()
  pdo <- clean_pdo(pdo)
  pdo <- read_pdo(pdo)
  pdo <- tidy_pdo(pdo)
  check_pdo(pdo)
}
