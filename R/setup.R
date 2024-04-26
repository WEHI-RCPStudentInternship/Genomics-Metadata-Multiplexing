# Define the path to the Python executable
# You might need to adjust this according to the Python installation on the target machine
python_path <- "python3" # or simply "python" depending on the environment

# Define the directory where the virtual environment should be created
venv_dir <- "venv"

# Define the path to the requirements.txt file
requirements_path <- "requirements.txt"

# Function to create a Python virtual environment and install dependencies
setup_python_env <- function(python_path, venv_dir, requirements_path) {
    # Create the virtual environment
    system(paste(python_path, "-m venv", venv_dir))
    
    # Activate the virtual environment
    # Note: Activation works differently on Windows. Adjust the command if targeting Windows.
    venv_activate <- paste0(venv_dir, "/bin/activate")
    
    # Install Python dependencies from requirements.txt
    system(paste("source", venv_activate, "&&", python_path, "-m pip install -r", requirements_path))
}

# Function to setup R environment and install R dependencies from renv.lock
setup_renv <- function() {
    # Ensure 'renv' is installed and loaded only once
    if (!requireNamespace("renv", quietly = TRUE)) {
        install.packages("renv")
        library(renv)
    } else {
        library(renv)
    }
    
    # Restore the project dependencies from renv.lock without redundant operations
    renv::install()
    # renv::restore(confirm = FALSE)
}

# Execute the setup functions
setup_python_env(python_path, venv_dir, requirements_path)
setup_renv()

# Print a message to indicate that the setup is complete
cat("Setup complete. Your environment is ready to use.\n")

