library(fs)
library(tidyverse)
library(purrr)
library(here)
files <- dir(pattern = "*.zip")
files

data <- files %>%
  map(unzip)       # reduce with rbind into one dataframe
view(data[1])
