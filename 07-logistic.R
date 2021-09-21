library(medicaldata)
library(tidyverse)
library(broom)

blood <- blood_storage


blood


model <- glm(Recurrence ~ Age, family = "binomial", data = blood)
summary(model)

glance(model)  # one row! (metrics on the model)
tidy(model)  # one row per terms (metrics on teh variables)
augment(model)  # one row per observation (metrics on predictions)



model_2 <- glm(Recurrence ~ Age + PVol + PreopPSA,
             family = "binomial",
             data = blood)

tidy(model_2)

model_2 |>
    tidy() |>
    mutate(odds = exp(estimate))


model_3 <- glm(Recurrence ~ Age + PVol + PreopPSA + TVol,
               family = "binomial",
               data = blood)


summary(model_3)


model_3b <- glm(Recurrence ~ Age + PVol + PreopPSA + as.factor(TVol),
               family = "binomial",
               data = blood)


summary(model_3b)
