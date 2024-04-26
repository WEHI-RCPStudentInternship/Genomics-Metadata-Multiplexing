#!/bin/bash

# Script to load Python module and run R application

# Step 1: Load the Python module
# Replace "python/3.9.17" with the specific Python module you want to load
echo "Loading Python module..."
module load python/3.9.17

# Check if the module was loaded successfully
if [ $? -eq 0 ]; then
    echo "Python module loaded successfully."
else
    echo "Failed to load Python module. Exiting..."
    exit 1
fi

# Step 2: Run the R application
# Replace "/path/to/your/app.R" with the actual path to your R script
echo "Running R application..."
Rscript /path/to/your/app.R

# Check if the R application ran successfully
if [ $? -eq 0 ]; then
    echo "R application ran successfully."
else
    echo "Failed to run R application."
fi
