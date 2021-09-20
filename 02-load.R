library(tidyverse)
library(readxl)
library(writexl)

# auto-completition
# relative or absolute path
read_csv("data/medicaldata_tumorgrowth.csv")

tumor <- read_csv("data/medicaldata_tumorgrowth.csv")

tumor_xl <- read_excel("data/medicaldata_tumorgrowth.xlsx")

tumor


select(tumor, Size)


select(tumor, Group, Day, Size)

tumor |>
    select(Group, Day, Size)


filter(tumor, Group == 1)

tumor |>
    filter(Group == 1)


# comma is an AND
tumor |>
    filter(Group == 1, Day == 0)

tumor |>
    filter(Group == 1 & Day == 0)
tumor |>
    filter(Group == 1 | Day == 0)


filtered <- tumor |>
    select(Group, ID, Day, Size) |>
    filter(Day == 0 | Day == 15)


write_csv(filtered, "data/tumor_filtered.csv")
write_xlsx(filtered, "data/tumor_filtered.xlsx")
