install.packages(c("tidyverse", "remotes", "writexl"),
                 dependencies = TRUE)
remotes::install_github("higgi13425/medicaldata")

renv::status()
renv::snapshot()
