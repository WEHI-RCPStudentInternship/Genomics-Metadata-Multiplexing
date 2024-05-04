# scripts

The `scripts` directory stores all [Python](https://docs.python.org/3/) code used by the R Shiny application for FACS file merging.

> **SPECIAL ATTRIBUTION**: `operations.py` was developed by [Marek Cmero](https://www.linkedin.com/in/marek-cmero/?originalSubdomain=au), which was derived from his [`celseq-sample-sheet-generator`](https://github.com/WEHIGenomicsRnD/celseq-sample-sheet-generator) repository.

This markdown file contains the following contents:
1. [Directory Structure](#directory-structure)
2. [Python Dependencies](#python-dependencies)

## Directory Structure
- [`operations.py`](./operations.py): A list of FACS file merging operations developed by WEHI Senior Research Officer, Marek Cmero
- [`fcs_converter.py`](./fcs_converter.py): Uses functions within `operations.py` to streamline all file merging processes into **1 operation**; called by [server.handler.R](../R/server.handler.R)

## Python Dependencies
The following 3rd party libraries were used:
- [Pandas](https://pandas.pydata.org/)
- [OpenPyXL](https://openpyxl.readthedocs.io/en/stable/)
- [FCSParser](https://pypi.org/project/fcsparser/)
