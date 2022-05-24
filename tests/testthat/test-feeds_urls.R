feeds <- feeds_urls()

test_that("Expect station_status in feeds url", {
  expect_true("station_status" %in% feeds$name)
})


test_that("Expect station_information in feeds url", {
  expect_true("station_information" %in% feeds$name)
})


feeds_urls() %>%
  filter(name == "station_status") %>%
  pull(url) %>%
  get_data()
