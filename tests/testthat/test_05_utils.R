context("Utility functions")

test_that("as_numeric() converts to numeric if possible", {
  expect_is(as_numeric(13), "numeric")
  expect_is(as_numeric("13"), "numeric")
  expect_is(as_numeric("aa"), "character")
  expect_is(as_numeric(c(NA, "13")), "numeric")
})

test_that("capture_df() capture dataframe", {
  expect_silent(capture_df(meta_species_codes())) %>%
    expect_is("character") %>%
    expect_length(1) %>%
    expect_match("\\.\\.\\.")

  expect_silent(capture_df(meta_species_codes()[1:3,])) %>%
    expect_is("character") %>%
    expect_length(1) %>%
    expect_match("[a-zA-Z <>0-9]+$")

  expect_silent(capture_df(meta_country_codes())) %>%
    expect_is("character") %>%
    expect_length(1) %>%
    expect_match("\\.\\.\\.")

  expect_silent(capture_df(meta_country_codes()[1:3,])) %>%
    expect_is("character") %>%
    expect_length(1) %>%
    expect_match("[a-zA-Z ]+$")
})
