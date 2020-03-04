test_that("pdo_download", {
  expect_is(download_pdo(), "data.frame")
  expect_is(pdo_download(), "data.frame")
})
