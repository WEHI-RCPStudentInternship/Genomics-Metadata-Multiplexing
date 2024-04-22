# backend

Welcome to the ```backend``` directory which contains the different implementations for the backend architecture logic.

> NOTE: there exists a 3rd implementation which is currently being used, it can be found at [```main.py```](./../../main.py).

For more information, visit the [Backend](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/FCSLOG#backend) section within the [FCSLOG](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/FCSLOG) wiki page.

This markdown file contains the following contents:
1. [Directrory Structure](#directrory-structure)
2. [Differences Between 3rd Party FCS Software](#differences-between-3rd-party-fcs-software)

## Directrory Structure
- [```design_1```](./design_1/): Uses [FCSParser](https://pypi.org/project/fcsparser/) python package to replace the use of [FlowJo](https://www.flowjo.com/)
- [```design_2```](./design_2/): The implementation that uses FlowJo for FCS file processing

## Differences Between 3rd Party FCS Software
For more information between the differences between FlowJo and FCSParser, visit the [Differences between FlowJo & FCSparser](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/FCSLOG#differences-between-flowjo--fcsparser) section within the FCSLOG wiki page.
