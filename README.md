# Genomics-Metadata-Multiplexing (GMM)

Welcome to the GMM repository.

> **SPECIAL ATTRIBUTION**: We would like to thank WEHI Senior Research Officer [Marek Cmero](https://www.linkedin.com/in/marek-cmero/?originalSubdomain=au) for developing the FACS merge logic used for this project. The code can be found under the `scripts` directory in [`operations.py`](./scripts/operations.py), which was derived from his [`celseq-sample-sheet-generator`](https://github.com/WEHIGenomicsRnD/celseq-sample-sheet-generator) repository.

This codebase contains all assets that will be deployed onto WEHI's Milton HPC via R Shiny. For details on the goals and implementation of this project visit the [GMM wiki page](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki).

This markdown file contains the following contents:
1. [Directory Structure](#directory-structure)
2. [Running This Application](#running-this-application)
3. [Prerequisites](#prerequisites)
4. [Acknowledgements](#acknowledgements)

## Directory Structure
- [`server.R`](./server.R): The entry point to this application
- [`setup.R`](./setup.R): Used for initialisating this application
- [`ui.R`](./ui.R): Provides the frontend interface
- [`R`](./R): A sub-directory that contains R components
- [`scripts`](./scripts/): Python files that handle merge logic (developed by WEHI Senior Research Officer, [Marek Cmero](https://github.com/WEHIGenomicsRnD/celseq-sample-sheet-generator))
- [`data.zip`](./data.zip): Contains the sample data to demo the application
- [`markdown_assets`](./markdown_assets/): Stores images used for markdown files and the [GMM wiki](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki)

## Running This Application

The **VIDEO** below provides detailed instructions for setting up and running this application on **MacOS/Linux**. This Shiny R application is designed to assist in the processing and analysis of genomics metadata through an interactive interface.

**Note:** For Windows users, manual configuration of Python virtual environments and R dependencies is required due to package conflicts. Unfortunately, we do not have an automated solution for Windows at this time.

[![Running the GMM Dashboard: A Step-by-Step Guide for MacOS/Linux Users](http://img.youtube.com/vi/zbZt63h1bYc/0.jpg)](http://www.youtube.com/watch?v=zbZt63h1bYc "Running the GMM Dashboard: A Step-by-Step Guide for MacOS/Linux Users")

## Prerequisites

Before proceeding, ensure you have the following prerequisites installed on your system:

- **Git**: For cloning the repository.
- **R**: The application is built in R, so ensure you have R installed.
- **RStudio** (Optional): For a more user-friendly experience running the app locally.

To run the application locally, you can use RStudio or the R console. Here are the steps for both methods:

### Using RStudio

1. **Open RStudio**: Start RStudio on your local machine.
2. **Open the `app.R` Script**: Go to `File` > `Open File` and navigate to the location of your `app.R` script.
3. **Run the App**: Click the 'Run App' button in the RStudio interface to start the application.

### Using R Console

1. **Start the R Console**: Open the R console on your machine.
2. **Run the App**: Execute the following command in the R console to start the application:

    ```r
    shiny::runApp()
    ```

### Using R Terminal

Alternatively, you can use the terminal to run the application:

1. **Navigate to the App Directory**: Use the `cd` command to navigate to the directory containing your `app.R` script.
2. **Run the App**: Execute the `app.R` script using RScript:

    ```r
    RScript app.R
    ```

If you encounter issues, ensure you have the latest versions of R and RStudio. For permission errors, run RStudio as an administrator or use sudo on Linux/MacOS.

Windows users may need to manually configure environments and dependencies due to package conflicts.

## Acknowledgements
We extend our gratitude to all contributors to the Genomics Metadata Multiplexing project. For a complete list of contributors, please visit the [Contributors](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Contributors) wiki page.
