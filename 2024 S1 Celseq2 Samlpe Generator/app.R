#!/bin/r
library(shiny)
library(reticulate)

# clear environment dependencies
rm(list=ls())

# Ensure 'renv' is installed
if (!requireNamespace("renv", quietly = TRUE)) {
    install.packages("renv")
}

# Load 'renv' and restore packages
renv::load()  
renv::restore()  

# Define and use the virtual environment
venv_dir <- "./venv"
use_virtualenv(venv_dir, required = TRUE)
reticulate::py_config()

# Load UI and server definitions
source("R/ui.R")
source("R/server.R")

# Launch the Shiny app
shinyApp(ui = ui, server = server)
