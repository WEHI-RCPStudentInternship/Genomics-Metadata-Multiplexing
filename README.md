<!-- Author: Sunchuangyu Huang huang.su@wehi.edu.au -->

<img width="1822" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/a4a42545-633d-4c1f-aa1d-d63c2667fd5f">

## How to Run the Shiny R Celseq2 FCS Operation Dashboard (MacOS/Linux)

This guide provides detailed instructions for setting up and running the "Celseq2 Sample Generator" dashboard of the Genomics Metadata Multiplexing project. This Shiny R application is designed to assist in the processing and analysis of genomics metadata through an interactive interface.

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

Acknowledgements
We extend our gratitude to all contributors to the Genomics Metadata Multiplexing project. For a complete list of contributors, please visit the Contributors wiki page.
