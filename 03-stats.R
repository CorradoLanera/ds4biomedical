library(tidyverse)

filtered_pipeline <- read.csv("data/tumor_filtered.csv")
filtered_pipeline


# that is a column, not suitable for functions like `mean()`
filtered_pipeline |>
    filter(Day == 0) |>
    select(Size) |>
    mean()

# that is a sequence of numbers! Suitable for functions like `mean()`
filtered_pipeline |>
    filter(Day == 0) |>
    pull(Size) |>
    mean()



filtered_pipeline |>
    filter(Group == 4, Day == 0) |>
    pull(Size) |>
    mean()


filtered_pipeline |>
    pull(Group) |>
    unique()

filtered_pipeline |>
    distinct(Group)


# split - apply - combine
filtered_pipeline |>
    filter(Day == 0) |>
    group_by(Group) |>
    summarise(avg_size = mean(Size))

filtered_pipeline |>
    filter(Day == 0) |>
    group_by(Group) |>
    summarise(
        avg_size = mean(Size),
        sd_size = sd(Size),
        q1 = quantile(Size, probs = 0.25)
    )

