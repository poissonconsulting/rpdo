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
  pdo <- read.csv(text = pdo)
  pdo
}

tidy_pdo <- function (pdo) {

  months <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN",
              "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
  pdo <- reshape(pdo, varying = months, timevar = "Month", v.names = "PDO",
                 idvar = "YEAR", direction = "long")
  pdo$Year <- as.integer(pdo$YEAR)
  pdo <- pdo[c("Year", "Month", "PDO")]
  pdo <- pdo[!is.na(pdo$PDO),]
  pdo <- pdo[order(pdo$Year, pdo$Month),]
  row.names(pdo) <- NULL
  pdo
}

check_pdo <- function (pdo) {
  old_pdo <- rpdo::pdo

  check_data(pdo, values = list(
    Year = c(1900L, as.integer(format(Sys.Date(), "%Y"))),
    Month = c(1L, 12L),
    PDO = c(-4, 4)
  ),
  exclusive = TRUE,
  nrow = c(1406, Inf),
  order = TRUE,
  key = c("Year", "Month"))

  old_pdo <- merge(old_pdo, pdo, by = c("Year", "Month"), all.x = TRUE)

  if (any(is.na(old_pdo$PDO.x))) stop("missing PDO index data", call. = FALSE)
  if (any(old_pdo$PDO.x != old_pdo$PDO.y)) stop("incorrect PDO index data", call. = FALSE)

  if (!any(diff(pdo$Month) %in% c(1, -11))) stop("missing PDO index data", call. = FALSE)
  if (!any(diff(pdo$Year) %in% c(0, 1))) stop("missing PDO index data", call. = FALSE)
  pdo
}

#' Download PDO Index Data
#'
#' Downloads PDO index data from
#' \url{http://research.jisao.washington.edu/pdo/PDO.latest}.
#'
#' \code{download_pdo()} is an alias for \code{pdo_download()}.
#'
#' For more information see \url{https://github.com/poissonconsulting/rpdo}.
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