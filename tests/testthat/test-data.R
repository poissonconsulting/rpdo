context("data")

test_that("pdo", {
  expect_is(check_data(rpdo::pdo), "tbl")
})
