library(here)
library(janitor)
library(tidyverse)

encounters <- read_csv(here("data/synthea/encounters.csv"))
encounters


encounters |>
    group_by(DESCRIPTION) |>
    summarize(count = n()) |>
    arrange(-count)

encounters |>
    group_by(REASONDESCRIPTION) |>
    summarize(count = n()) |>
    arrange(-count)

encounters |>
    group_by(DESCRIPTION, REASONDESCRIPTION) |>
    summarize(count = n()) |>
    arrange(-count)



encounters <- clean_names(encounters)
names(encounters)


encounters_col_sub <- encounters |>
    select(id:patient, encounterclass, description, reasondescription)


encounters_col_sub |>
    filter(
        description == "Cardiac Arrest" |
        description == "Myocardial Infarction"
    )

mi_terms <- c("Cardiac Arrest", "Myocardial Infarction") |>
    str_to_lower()

pt_encounter_mi_only <- encounters_col_sub |>
    # mutate(across(everything(), str_to_lower)) |>
    filter(str_to_lower(description) %in% mi_terms)

pt_encounter_mi_only <- pt_encounter_mi_only |>
    mutate(
        stop_dt = ymd_hms(stop),

    )
