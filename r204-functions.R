library(here)
library(tidyverse)

tb <- here("data/tb_long.csv") |>
    read_csv()
tb
