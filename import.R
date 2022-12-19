library(tidyverse)

weather <- read_delim("Kusala-Hermitage-2021-03.csv",
                    delim=";",
                    locale = readr::locale(encoding = "UTF-16LE"))