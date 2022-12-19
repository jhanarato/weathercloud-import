library(tidyverse)

import_weather <- function() {
  files <- list.files(pattern="*.csv")
  
  df_list <- vector("list", length(files))
  
  for (i in seq_along(files)) {
    df_list[[i]] <- read_delim(files[[i]], delim=";", locale = readr::locale(encoding = "UTF-16LE"))
  }
  
  bind_rows(df_list)
}

