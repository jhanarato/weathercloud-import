library(tidyverse)

read_weather_cloud_file <- function(file_name) {
  read_delim(file_name, delim=";", locale = readr::locale(encoding = "UTF-16LE"))
}

import_weather <- function() {
  files <- list.files(pattern="*.csv")
  bind_rows(map(files, read_weather_cloud_file))
}

