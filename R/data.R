#' Pacific Decadal Oscillation Index
#'
#' Monthly Pacific Decadal Oscillation (PDO) index
#' values from January 1900 to present.
#'
#' For more information see \code{vignette("rpdo")}.
#'
#' @seealso \url{http://research.jisao.washington.edu/pdo/PDO.latest}
#' @format A tbl data frame:
#' \describe{
#'   \item{Year}{The year as an integer.}
#'   \item{Month}{The month as an integer.}
#'   \item{PDO}{The Pacific Decadal Oscillation index as a numeric.}
#' }
#' @examples
#' library(ggplot2)
#' data(pdo)
#' ggplot(data = pdo, aes(x = Year, y = PDO)) + facet_wrap(~Month) + geom_line()
#' @aliases rpdo
"pdo"
