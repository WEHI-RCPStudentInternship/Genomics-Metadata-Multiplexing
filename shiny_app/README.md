# shiny_app (Codebase)

Welcome to the ```shiny_app``` [codebase]() that was developed by the [2023-2024 Summer](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Contributors#intake-4-2023-2024-summer) intake.

This is the 2nd implementation of the [web application](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space#web-application) specified in the [Problem Space](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space) wiki page. 

For extensive documentation that outlines the this implementation's features, architecture and future, visit the [shiny_app]() wiki page.

This implementation is conisdered **PARTIAL** as it only merges FCS files together and NOT the Primer Index files.

This markdown file contains the following contents:
1. [Directory Structure](#directory-structure)
2. [Test Data Used](#test-data-used)
    - [A Note On The FCS Data](#a-note-on-the-fcs-data)

## Directory Structure
- [```shiny_for_python```](./shiny_for_python/): 1st version written using [Flask](https://flask.palletsprojects.com/en/3.0.x/)
- [```shiny_for_r```](./shiny_for_r/): 2nd version written using [R Shiny](https://www.rdocumentation.org/packages/shiny/versions/1.8.1.1)

**NOTE:** Both versions above output the same values according to the 2023-2024 Summer intake.

## Test Data Used
This implementation uses **RAW** ```.fcs``` files which can be found in the [intake4_fcs](../sample_data/fcs_files/intake4_fcs/). This directory contains FCS files for plates LCE662-LCE664.

### A Note On The FCS Data
The FCS files within the [intake4_fcs](../sample_data/fcs_files/intake4_fcs/) folder contain 2 **DIFFERENTLY NAMED** versions of FCS files for plates LCE662-LCE664 being the prefixes:
1. ```NKC_084```
2. ```Ref_Ctrl```

Previous intakes have **FAILED** to document the differences between these files. So be **WARY** when mixing and matching these files.
