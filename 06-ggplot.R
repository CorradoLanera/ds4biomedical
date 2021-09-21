library(tidyverse)
library(medicaldata)


blood_storage


# data exploration
blood_storage |>
    group_by(Recurrence) |>
    summarise(ct = n())

blood_storage |>
    group_by(Recurrence) |>
    tally(name = "ct")



# only data
blood_storage |>
    mutate(Recurrence = factor(Recurrence, labels = c("No", "Yes"))) |>
    ggplot() +
    aes(x = Recurrence) +
    geom_bar()


blood_storage |>
    ggplot() +
    aes(x = Age) +
    geom_histogram(bins = 10)  # default is 30

blood_storage |>
    ggplot() +
    aes(x = Age) +
    geom_histogram(bins = 4)  # default is 30


blood_storage |>
    ggplot() +
    aes(x = as.factor(TVol),
        y = Age) +
    geom_violin() +
    geom_point()


blood_storage |>
    ggplot() +
    aes(x = as.factor(TVol),
        y = Age) +
    geom_violin() +
    geom_jitter(width = 0.2)



blood_storage |>
    ggplot() +
    aes(x = PVol,
        y = PreopPSA,
        color = as.factor(sGS)) +
    geom_point(alpha = 0.25)



g <- blood_storage |>
    ggplot() +
    aes(x = PVol,
        y = PreopPSA,
        color = as.factor(sGS)) +
    geom_point(alpha = 0.25) +
    facet_grid(RBC.Age.Group ~ Recurrence) +
    theme_minimal()

# Exercise
cmv <- cytomegalovirus

cmv |>
    ggplot() +
    aes(x = as.factor(prior.transplant)) +
    geom_bar(aes(fill = as.factor(cmv)))

cmv |>
    ggplot() +
    aes(x = as.factor(prior.transplant)) +
    geom_bar(aes(fill = as.factor(cmv)),
             position = "dodge")

cmv |>
    ggplot() +
    aes(x = as.factor(prior.transplant)) +
    geom_bar(aes(fill = as.factor(cmv)),
             position = "dodge") +
    facet_grid(donor.cmv ~ recipient.cmv)
