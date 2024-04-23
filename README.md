<<<<<<< HEAD


<!-- Author: Sunchuangyu Huang huang.su@wehi.edu.au -->

<img width="1822" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/645a3972-fd07-41a1-a5a4-d9c101134509">

<<<<<<< HEAD
# How to Run the Shiny R Celseq2 FCS Operation Dashboard (MacOS/Linux)

This guide provides step-by-step instructions on how to set up and run the Shiny R application for the Genomics Metadata Multiplexing project, specifically the "2024 S1 Celseq2 Sample Generator" module. This application is designed to facilitate the processing and analysis of genomics metadata, providing an interactive user interface for various operations.

For Windows, you need to build a new python virtualenv with Python3.9 and install all R dependencies manually. This caused by program achitecture and unfortunately we don't have a better solution unless use program container.
=======
## Repository Structure
- [```gmm```](./gmm/): The 3rd and **CURRENT** version that takes Marek Cmero's Python/Flask web application ported into R Shiny
- [```test```](./test/): Testing assets that verify the integrity of the [gmm](./gmm/) implementation
- [```sample_data```](./sample_data/): Stores files such as FCS, Primer Index spreadsheets, templates, etc which are items needed for the merge process
- [```markdown_assets```](./markdown_assets/): Stores the images used to make the markdown files within this repository, or the wiki pages that document the technicalities of the GMM project
- [```past_implementations```](./past_implementations/): Discontinued web implementations developed by past interns
>>>>>>> a32364d (Update file structure in README.md)

## Prerequisites

<<<<<<< HEAD
Before running the application, ensure you have the following installed:
=======
**Wiki Pages** on the other hand, provides information **NOT** related to the codebase. Examples include the context behind the GMM project, design decisions behind software architecture, etc.
>>>>>>> a32364d (Update file structure in README.md)

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
=======
<!-- Author: Sunchuangyu Huang huang.su@wehi.edu.au -->

<img width="1822" alt="image" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/62606765/a4a42545-633d-4c1f-aa1d-d63c2667fd5f">

# How to Run the Shiny R Celseq2 FCS Operation Dashboard (MacOS/Linux)

This guide provides step-by-step instructions on how to set up and run the Shiny R application for the Genomics Metadata Multiplexing project, specifically the "2024 S1 Celseq2 Sample Generator" module. This application is designed to facilitate the processing and analysis of genomics metadata, providing an interactive user interface for various operations.

For Windows, you need to build a new python virtualenv with Python3.9 and install all R dependencies manually. This caused by program achitecture and unfortunately we don't have a better solution unless use program container.

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
=======
# Genomics-Metadata-Multiplexing

Welcome to the  Genomics-Metadata-Multiplexing (GMM) [repository](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing).

For extensive documentation regarding the GMM project's overview, goal of the web application and future, please consult the GMM [wiki pages](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki).

This markdown file contains the following content:
1. [Repository Structure](#repository-structure)
2. [Purpose Of Repository Markdown Files And Wiki Pages](#purpose-of-repository-markdown-files-and-wiki-pages)
3. [Naming Conventions For Files And Directories](#naming-conventions-for-files-and-directories)
4. [Acknowledgements](#acknowledgements)

## Repository Structure
- [```gmm```](./gmm/): The 3rd and **CURRENT** version that takes Marek Cmero's Python/Flask web application ported into R Shiny
- [```test```](./test/): Testing assets that verify the integrity of the [gmm](./gmm/) implementation
- [```sample_data```](./sample_data/): Stores files such as FCS, Primer Index spreadsheets, templates, etc which are items needed for the merge process
- [```markdown_assets```](./markdown_assets/): Stores the images used to make the markdown files within this repository, or the wiki pages that document the technicalities of the GMM project
- [```past_implementations```](./past_implementations/): Discontinued web implementations developed by past interns

## Purpose Of Repository Markdown Files And Wiki Pages
**Repository markdown files** should **ONLY** contain information related to the codebase. For example, if a directory stores contains a ```main.py``` Python file. The README.md file within said directory should explain what ```main.py``` does, and any useful commands such as the execution of said file.

**Wiki Pages** on the other hand, provides information **NOT** related to the codebase. Examples include the context behind the GMM project, design decisions behind software architecture, etc.

## Naming Conventions For Files And Directories
- Use names that are meaningful and self-explanatory
- When creating new files or directories, lowercase alphanumeric characters should be used
- Special and Whitespace characters, should NEVER be used
- Use [snake_case](https://developer.mozilla.org/en-US/docs/Glossary/Snake_case) for filenames and directories as this codebase uses Python to import files/modules
- The filetype extension for a file should ALWAYS be included at the end
<table>
    <tr>
        <th>&nbsp</th>
        <th>Good:</th>
        <th>Bad:</th>
    </tr>
    <tr>
        <th>Directory:</th>
        <td>shiny_app</td>
        <td>Sh1ny-App</td>
    </tr>
    <tr>
        <th>File:</th>
        <td>cel_seq2_steps.png</td>
        <td>Cel Seq2 Steps</td> 
    </tr>
</table>

## Acknowledgements
We would like to acknowledge all the current and past supervisors, subject matter experts, interns and open source contributors that took part in the WEHI GMM project. A list of their names, GitHub usernames, and emails can be found in the [Contributors](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Contributors) wiki page.
>>>>>>> 1384492 (Update README.md)
