# Step 1: Setup the environment
# Clear existing environment dependencies
rm(list=ls())

# Source the setup script
source('R/setup.R')

# Load necessary libraries
library(shiny)
library(reticulate)

# Step 2: Load Python virtual environment
# Define the virtual environment directory
venv_dir <- "./venv"

# Use the specified virtual environment
use_virtualenv(venv_dir, required = TRUE)

# Optional: Display Python configuration to verify correct environment
reticulate::py_config()

# Step 3: Define the Shiny app
# Load UI and server definitions
source("R/ui.R")
source("R/server.R")

# Define the Shiny app
app <- shinyApp(ui = ui, server = server, options = list(launch.browser = TRUE))

# Step 4: Run the Shiny app
getwd()
print("Starting GMM Shiny Application...")

# Run the app
shiny::runApp(app)
