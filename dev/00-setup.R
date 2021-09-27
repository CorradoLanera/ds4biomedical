# Packages required for part 1
install.packages(c("tidyverse", "remotes", "writexl"),
                 dependencies = TRUE)
remotes::install_github("higgi13425/medicaldata")


# Additional packages reqired for part 2
install.packages(c(
    "RSQLite", "tidymodels", "janitor", "skimr", "rmarkdown", "knitr"
))
remotes::install_github("thomasp85/patchwork")


renv::status()
renv::snapshot()
