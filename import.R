library(tidyverse)

read_weather_cloud_file <- function(file_name) {
  columns <- c("date_time", "temp_inside", "temp", "chill", "dew_inside", "dew", 
               "heat_inside", "heat", "humidity_inside", "humidity", 
               "windspeed_high", "wind_speed_avg", "wind_direction_avg", 
               "pressure_hpa", "rainfall", "rainfall_rate", "solar_rad", 
               "uv", "elipsis_nineteen")
  
  unavailable <- c("dew_inside", "heat_inside", "heat", 
                   "solar_rad", "uv", "elipsis_nineteen")
  
  read_delim(file_name, 
             delim=";",
             skip=1,
             locale = readr::locale(encoding = "UTF-16LE"),
             col_names = columns,
             col_select = !unavailable
             )
}

import_weather <- function() {
  files <- list.files(pattern="*.csv")
  bind_rows(map(files, read_weather_cloud_file))
}