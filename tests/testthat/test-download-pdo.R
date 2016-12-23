context("download-pdo")

test_that("download_pdo", {
  expect_is(download_pdo(), "tbl")
})
