context("data")

test_that("pdo", {
  pdo <- rpdo::pdo
  expect_identical(datacheckr::check_data2(pdo, list(Year = c(1900L, 2016L), Month = 1:12, PDO = c(-4, 4))), pdo)
})
