context("data")

test_that("pdo", {
  pdo <- rpdo::pdo
  expect_identical(datacheckr::check_data(pdo, list(Year = 1L, Month = 1:12, PDO = 1)), pdo)
})
