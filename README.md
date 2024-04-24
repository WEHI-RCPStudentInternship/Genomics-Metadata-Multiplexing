<!-- Author: Sunchuangyu Huang huang.su@wehi.edu.au -->

<img width="1822" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/a4a42545-633d-4c1f-aa1d-d63c2667fd5f">

# How to Run the Shiny R Celseq2 FCS Operation Dashboard (MacOS/Linux)

This guide provides detailed instructions for setting up and running the "Celseq2 Sample Generator" dashboard of the Genomics Metadata Multiplexing project. This Shiny R application is designed to assist in the processing and analysis of genomics metadata through an interactive interface.

**Note:** For Windows users, manual configuration of Python virtual environments and R dependencies is required due to package conflicts. Unfortunately, we do not have an automated solution for Windows at this time.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **R**: Install the latest version from [CRAN](https://cran.r-project.org/).
- **RStudio**: Recommended for a user-friendly experience. Download from [RStudio's website](https://www.rstudio.com/products/rstudio/download/).

## Installation Guide

### Step 1: Download the Repository

Download the latest version of the Genomics Metadata Multiplexing project repository to your local machine. You can do this by visiting the [GitHub repository page](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing) and downloading the repository as a ZIP file, or by using the following git command in your terminal:

```bash
git clone https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing.git
```

### Step 2: Set the Working Directory

Open RStudio, and set the working directory to the project folder you just downloaded. You can do this by executing the following command in the R console, replacing path_to_folder with the actual path to the project folder:

```R
setwd("path_to_folder/Genomics-Metadata-Multiplexing")
```

### Step 3: Run the Setup Script

In RStudio, open the setup.R file located in the project directory. This script is responsible for configuring the virtual environment and installing necessary dependencies. Run the script by clicking the 'Source' button in the top right corner of the script editor or by executing the following command in the R console:

```R
source("setup.R")
```

### Step 4: Launch the Application

After the setup script completes, open the app.R file in RStudio. Launch the application by clicking the 'Run App' button in the top right corner of the script editor, or by executing the following command in the R console:

```R
shiny::runApp()
```

The application will open in a new browser window, and you're ready to use the "Celseq2 Sample Generator Dashboard" module.

## Troubleshooting

If you encounter any issues during the setup process, please ensure that you have the latest versions of R and RStudio installed.
For permission-related errors, try running RStudio as an administrator or using sudo on Linux/MacOS.

Windows users may need to manually configure virtual environments and R dependencies due to potential package conflicts.
Acknowledgements

We extend our gratitude to all contributors to the Genomics Metadata Multiplexing project. For a complete list of contributors, please visit the Contributors wiki page.