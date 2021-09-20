library(tidyverse)


all <- read_csv("data/spreadsheets/all.csv")
all |>
    select(first_name, last_name, day, time, temp_f) |>
    filter(first_name == "Aniya", last_name == "Warner") |>
    write_csv("output/aniya_warner.csv")
