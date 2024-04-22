

<!-- Author: Sunchuangyu Huang huang.su@wehi.edu.au -->

<img width="1822" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/645a3972-fd07-41a1-a5a4-d9c101134509">

# How to Run the Shiny R Celseq2 FCS Operation Dashboard

This guide provides step-by-step instructions on how to set up and run the Shiny R application for the Genomics Metadata Multiplexing project, specifically the "2024 S1 Celseq2 Sample Generator" module. This application is designed to facilitate the processing and analysis of genomics metadata, providing an interactive user interface for various operations.

## Prerequisites

Before running the application, ensure you have the following installed:

- **R**: The latest version of R is recommended. You can download it from [CRAN](https://cran.r-project.org/).
- **RStudio**: While not strictly necessary, RStudio provides a convenient and user-friendly environment for running R scripts and applications. Download it from [RStudio's website](https://www.rstudio.com/products/rstudio/download/).

## Initial Setup

1. **Clone the GitHub Repository**: First, clone the repository containing the Shiny application to your local machine. 
2. **Navigate to the Project Directory**: Change your working directory to the "2024 S1 Celseq2 Sample Generator" within the cloned repository:
3. **Install R and RStudio**: If not already installed, download and install R and RStudio from their respective websites.

## Project Dependencies

This project uses the `renv` package for dependency management to ensure reproducibility.

1. **Open the Project in RStudio**: Open RStudio, and then open the project by navigating to `File > Open Project`, selecting the `.Rproj` file within the "2024 S1 Celseq2 Sample Generator" directory.

2. **Run `app.R` use `runApp()` command** 

```R
shiny::runApp()
```

For first time running, you may need to install the required packages. You will see the following prompt:

<img width="901" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/9f56f354-bbb1-4893-a830-fc8b5ad1fbf7">

Please select number **2** and continue, then the application will ask you install all dependencies, please select **Yes/Y**.

<img width="967" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/2bcaa76e-d67b-4463-9a33-aed237ecff26">

All the required packages will be installed automatically and the application will be launched in your default web browser at http://127.0.0.1:4341.
