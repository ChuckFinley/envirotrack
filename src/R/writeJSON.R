library(dplyr)
library(lubridate)
library(jsonlite)

read.csv('~/Desktop/KPA2015WTSHlong.csv', stringsAsFactors = FALSE) %>%
  slice(1:100) %>%
  mutate(TimestampUTC = ymd_hms(TimestampUTC, tz = 'UTC')) %>%
  toJSON(dataframe = 'columns', POSIXt = 'epoch') %>%
  paste('var tracks =', .) %>%
  writeLines('~/Desktop/KPA2015WTSHlong.js')