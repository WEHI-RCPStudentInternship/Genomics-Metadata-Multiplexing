# shiny_for_python (Codebase)

Welcome to the ```shiny_for_python``` version.

For more information on this version's features, software dependencies, backend and limitations, consult the [Web Application]() section within the [shiny_app]() wiki page.

This markdown file contains the following contents:
1. [Directory Structure](#directory-structure)
2. [Python Interpreter And Environment Setup](#python-interpreter-and-environment-setup)
3. [Required Python Packages](#required-python-packages)
4. [Running the Python Application](#running-the-python-application)

## Directory Structure
- [```app_python_final.py```](./app_python_final.py): The **FINAL** Flask implementation
- [```archive```](./archive/): Unused assets

## Python Interpreter And Environment Setup

This guide provides detailed instructions on setting up your environment to run applications developed in Python and R. Follow the steps carefully to ensure a smooth experience.

Before running the Python application, ensure you have the required packages installed. You can use either pip or conda for package management, depending on your preference and setup.

## Required Python Packages

```bash
pip install numpy fcsparser flowkit
# or 
conda install numpy fcsparser flowkit
```

## Running the Python Application

Once the packages are installed, you can run the Python application as follows:

1. Navigate to the directory containing `app_python_final.py`.
2. Execute the script by running:

```bash
python app_python_final.py
```

Ensure you're using the Python interpreter where you installed the required packages.
