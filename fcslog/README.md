# FCSLOG (Codebase)

Welcome to the ```fcslog``` [codebase](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/tree/main/fcslog) that was developed by the 2023 Semester 2 intake. 

This is the 1st implementation of the [web application](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space#web-application) specified in the [Problem Space](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space) wiki page. For extensive documentation that outlines the this implementation's features, architecture and future, visit the [FCSLOG](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/FCSLOG) wiki page.

This markdown file contains the following content:
1. [Directory Structure](#directory-structure)
2. [Installation And Use](#installation-and-use)
    - [Setting Up Flask](#setting-up-flask)
    - [Installing Backend Dependencies](#installing-backend-dependencies)
    - [Using The App](#using-the-app)

## Directory Structure
- [```main.py```](./main.py): Performs the FCS and Index Primer merge process
- [```archive```](./archive/): All **UNUSED** assets

## Installation And Use
### Setting Up Flask
1. Clone the [Genomics-Metadata-Multiplexing](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing) repository where appropriate.
2. Open terminal and change directory (i.e. cd) to Genomics-Metadata-Multiplexing
3. **Create** the virtual environment: ```python3 -m venv .venv```
4. **Activate** the virtual environment: ```. .venv/bin/activate ```
5. Install Flask: ```pip3 install Flask```

### Installing Backend Dependencies
1. Install packages used for data processing:
    - os: ```pip3 install os```
    - shutil: ```pip3 install shutil```
    - pandas: ```pip3 install pandas``` (for creating the dataframe for extracted data) 
    - openpyxl: ```pip3 install openxyl ``` (for read/parse excel file)
2. Install packages for FCS parsing:
    - [fcsparser](https://pypi.org/project/fcsparser/ ): ```pip3 install fcsparser```
    - [flowio](https://github.com/whitews/flowio): ```pip3 install flowio```

### Using The App
1. Using the command line interface, navigate to the ```fcslog``` directory
2. Within the ```main.py``` file, edit the following variables by adjusting their file path values:
    - ```fcs_data_folder``` the folder containing the set of FCS files to merge
    - ```primer_index_folder``` the folder containing the set of Index Primer files to merge
3. Save the file when locating the desired FCS and Index Prime folders
4. Merge Command: ```python3 main.py```
