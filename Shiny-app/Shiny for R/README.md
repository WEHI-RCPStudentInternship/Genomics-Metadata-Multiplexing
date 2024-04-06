## Python Interpreter

This guide provides detailed instructions on setting up your environment to run applications developed in Python and R. Follow the steps carefully to ensure a smooth experience.

### Python Environment Setup

Before running the Python application, ensure you have the required packages installed. You can use either pip or conda for package management, depending on your preference and setup.

#### Required Python Packages

```bash
pip install numpy fcsparser flowkit
# or 
conda install numpy fcsparser flowkit
```

#### Running the Python Application

Once the packages are installed, you can run the Python application as follows:

1. Navigate to the directory containing `app_python_final.py`.
2. Execute the script by running:

```bash
python app_python_final.py
```

Ensure you're using the Python interpreter where you installed the required packages.

## R Environment Setup

To run the R application, you'll need to install specific packages in R and configure RStudio to use the appropriate Python interpreter, ensuring seamless integration between R and Python.

### Required R Packages

```r
install.packages('shiny')
install.packages("reticulate")
```

### Configuring Python Interpreter in RStudio

1.Open RStudio and navigate to Tools -> Global Options -> Python.
2. Click on Select your Python Interpreter and choose the interpreter where you installed the Python packages.
3. Click Apply, and restart your R session for the changes to take effect.

To verify the configuration, run py_config() in your R console. This command should display information about the Python interpreter and confirm that numpy is accessible.

### Running the R Application

1. Ensure both `app_R_final.R` and `func.py` are in the same directory.
2. Open `app_R_final.R` in RStudio.
3. Run the application by clicking the 'Run App' button in RStudio, or by executing `source('path/to/app_R_final.R')` in the R console, replacing path/to with the actual path to the script.



