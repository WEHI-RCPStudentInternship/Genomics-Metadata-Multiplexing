library(shiny)
library(reticulate)

# Define the virtual environment directory
venv_dir <- "./venv"

# Use the virtual environment
use_virtualenv(venv_dir, required = TRUE)
py_config()

source("R/ui.R")
source("R/server.R")

shinyApp(ui = ui, server = server)
