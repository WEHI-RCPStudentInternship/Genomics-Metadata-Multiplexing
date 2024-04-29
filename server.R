library(shiny)
library(DT) 
library(shinycssloaders)

# Load the reticulate library
library(reticulate)

# Define the Python dependencies you want to install
PYTHON_DEPENDENCIES <- c('pip', 'fcsparser', 'openpyxl', "xlrd")

# Create a new virtual environment named 'py3-virtualenv' with a specified Python executable
virtualenv_create(envname = "py3-virtualenv", python = "/usr/bin/python3")

# Use the newly created virtual environment
use_virtualenv("py3-virtualenv", required = TRUE)

# Function to install Python packages using pip
install_python_packages <- function(packages) {
  for (package in packages) {
    # Install each package using py_install
    py_install(package, envname = "py3-virtualenv")
  }
}

# Install the Python dependencies
install_python_packages(PYTHON_DEPENDENCIES)

# Optional: Check the Python configuration to verify the environment and installed packages
py_config()

source("R/server.handler.R")

# Server function
shinyServer <- function(input, output, session) {
    thumbnail_image_handler(input, output, session)
    
    folder_upload_progress_bar(input, output, session)
    uploadedFilePaths <- data_upload_handler(input, output, session)


    processedData <- data_processing_handler(input, output, session, uploadedFilePaths)
    
    ui_display_handler(input, output, session, processedData)
    
    data_display_handler(input, output, session, processedData)
    
    data_download_handler(input, output, session, processedData)
}

