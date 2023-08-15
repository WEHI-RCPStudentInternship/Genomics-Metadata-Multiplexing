# Genomics Metadata Multiplexing
For the [Genomics Metadata Multiplexing project](https://wehi-researchcomputing.github.io/students-genomics-metadata.html)

## Overall Design of FCS
Raw fcs. data files loaded as an input -> fcs files will be parsed and merged into 1 excel sheet

Aims to use python genrator (to parse) that works similar like flowjo 

## Back-end Design 

### Design 1
Users input raw fcs. files, this design will use fcsparser to extract the raw data and merge all files into 1 excel sheet

<b> DRAWBACK </b>
This design compared to the accurate reults done by flowjo is different. Out team worked through and noticed that the functionality of flowjo can't be replace, since besidess parsing, flowjo also analyse the data which will impact the data from the raw fcs files. Hence out team discuss and restrict the input files to merge should have been through flowjo and exported as a csv file 

## Design 2
Uses input the excel (xlsx) files that has already been through flowjo analysing machine into design 2 generator, the files will be parse, merged and extracted into 1 csv file

## Front-end Design 

### Wireframe
Front-end design will be implemented via Figma and Flask API. For more information about the design, visit:
https://www.figma.com/file/OhQX2cjNGy8PwhyqNZ2eyq/WEHI-FCS-Merge-Webapp?type=design&node-id=0%3A1&mode=design&t=bbFsfX9T0aTQR7jL-1

### WorkFlow Diagram
Illustration of the process of input (front end) and output (backend) and sequence diagram (abstraction behind our machine). For more information, visit below:
![Workflow Diagram + Wireframe-Workflow drawio](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/115709584/5e4f74df-5a0a-47b6-8d45-a0945d8789c2)



