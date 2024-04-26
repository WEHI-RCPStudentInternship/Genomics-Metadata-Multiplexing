# clear environment dependencies
rm(list=ls())

source('setup.R')

library(shiny)
library(reticulate)

# Define and use the virtual environment
venv_dir <- "./venv"
use_virtualenv(venv_dir, required = TRUE)
reticulate::py_config()

# Load UI and server definitions
source("R/ui.R")
source("R/server.R")

# Launch the Shiny app
print("Starting GMM Shiny Application...")
shinyApp(ui = ui, server = server)
