context("data")

test_that("pdo", {
  pdo <- rpdo::pdo
  expect_identical(datacheckr::check_data(pdo, list(Year = c(1900L, 2016L), Month = 1:12, PDO = c(-4, 4))), pdo)
})
