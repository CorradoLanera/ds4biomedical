install.packages(c("tidyverse", "remotes"), dependencies = TRUE)
remotes::install_github("higgi13425/medicaldata")

renv::status()
renv::snapshot()
