#!/bin/bash

# Step 1: Check if the venv folder exists, if not create it using Python 3.9
if [ ! -d "venv" ]; then
    echo "Creating a virtual environment..."
    python3 -m venv venv
    echo "Virtual environment created."
fi

# Step 2: Activate the virtual environment and install required Python packages
echo "Activating the virtual environment..."
source venv/bin/activate
echo "Installing Python packages..."
pip install -r requirements.txt  

# Step 3: Install R packages
echo "Setup complete."
