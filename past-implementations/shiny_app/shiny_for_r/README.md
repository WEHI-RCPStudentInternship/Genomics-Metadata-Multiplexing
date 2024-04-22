# shiny_for_r (Codebase)

Welcome to the ```shiny_for_r``` version.

For more information on this version's features, software dependencies, backend and limitations, consult the [Web Application](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/shiny_app#web-application) section within the [shiny_app](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/shiny_app) wiki page.

This markdown file contains the following contents:
1. [Directory Structure](#directory-structure)
2. [R Set Up And Required R Packages](#r-set-up-and-required-r-packages)
3. [Configuring Python Interpreter in RStudio](#configuring-python-interpreter-in-rstudio)
4. [Running the R Application](#running-the-r-application)

## Directory Structure
- [```app_R_final.R```](./app_R_final.R): The web application itself
- [```func.py```](./func.py): Contains [FCSParser](https://pypi.org/project/fcsparser/) for scale values and [Flowkit](https://flowkit.readthedocs.io/en/latest/) for channel values
- [```archive```](./archive/): Unused assets

## R Set Up And Required R Packages

To run the R application, you'll need to install specific packages in R and configure RStudio to use the appropriate Python interpreter, ensuring seamless integration between R and Python.

```r
install.packages('shiny')
install.packages("reticulate")
```

## Configuring Python Interpreter in RStudio

1. Open RStudio and navigate to Tools -> Global Options -> Python.
2. Click on Select your Python Interpreter and choose the interpreter where you installed the Python packages.
3. Click Apply, and restart your R session for the changes to take effect.

To verify the configuration, run `py_config()` in your R console. This command should display information about the Python interpreter and confirm that numpy is accessible.

## Running the R Application

1. Ensure both `app_R_final.R` and `func.py` are in the same directory.
2. Open `app_R_final.R` in RStudio.
3. Run the application by clicking the 'Run App' button in RStudio, or by executing `source('path/to/app_R_final.R')` in the R console, replacing path/to with the actual path to the script.