library(shiny)
library(reticulate)

if (!requireNamespace("renv", quietly = TRUE)) {
    install.packages("renv")
}

# Load renv and restore packages
renv::load()  
renv::restore()  

# Define the virtual environment directory
venv_dir <- "./venv"

# Use the virtual environment
use_virtualenv(venv_dir, required = TRUE)
reticulate::py_config()

source("R/ui.R")
source("R/server.R")

shinyApp(ui = ui, server = server)
