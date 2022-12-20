source("import.R")

library(lubridate)

weather <- import_weather()

weather %>% arrange(desc(temp))

weather %>%
  group_by(year(date_time), month(date_time)) %>%
  summarise(
    max_temp = max(temp, na.rm=TRUE)
  )

number_of_observations <- weather %>% count(year(date_time), month(date_time, label=TRUE))
