library(tidyverse)


tumor <- read_csv("data/tumorgrowth_long.csv")
tumor

tumor |>
    pivot_longer(`0`:`28`)


tumor |>
    pivot_longer(`0`:last_col())


tumor |>
    pivot_longer(-c(Group, Grp, ID))


tumor_tidy <- tumor |>
    pivot_longer(
        -c(Group, Grp, ID),
        names_to = "day",
        values_to = "size"
    )
tumor_tidy


tumor_tidy |>
    group_by(Group, day) |>
    summarise(avg_size = mean(size, na.rm = TRUE))




tb <- read_csv("data/tb_long.csv")

tb
tb_long <- tb |>
    pivot_longer(starts_with(c("m", "f")))

tb_tidy <- tb_long |>
    separate(
        name,
        into = c("sex", "age_group"),
        sep = 1
    )

tb_tidy


csm <- read_csv("data/cms_utilization.csv")
csm

csm |>
    pivot_longer(`2007`:last_col(), names_to = "year") |>
    pivot_wider(names_from = "variable", values_from = "value") |>
    View()

