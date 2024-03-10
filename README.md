# Genomics Metadata Multiplexing Project

Welcome to the [Genomics Metadata Multiplexing project](https://wehi-researchcomputing.github.io/students-genomics-metadata.html), an initiative at WEHI to automate the processing and analysis of flow cytometry data, enhancing research efficiency and accuracy.

## Overview

The GMM project focuses on simplifying the handling of raw .fcs data files by developing a web application that automates their conversion and merging into a consolidated Excel sheet. This process aims to emulate the parsing capabilities of FlowJo while introducing additional functionalities to improve data integration and analysis.

## Aims

The project aims to:
- Automate the conversion of raw FCS files into analysis-ready formats.
- Streamline the merging process of FCS files with primer index files.
- Develop a user-friendly web application for efficient data processing.
- Enable seamless metadata management and integration.

## Workflow Design

The GMM workflow encapsulates the entire process from raw FCS file input to the final merged Excel output. It integrates both front-end interactions and back-end processing, including parsing and data merging strategies that align with industry standards.

![Workflow Diagram](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/assets/115709584/614a2da2-71f0-4baa-8c81-1bd82d51c8bf)

For a more detailed view of the workflow and sequence diagram, illustrating the abstraction behind our machine, see the WorkFlow Diagram section.

## Back-end Design

### Design 1

Initially, the approach involved using `fcsparser` to extract data from raw FCS files for merging into an Excel sheet. However, this method's limitations became apparent when comparing its output with FlowJo's analytical results.

**Drawback:** This design fell short as FlowJo not only parses but also analyses data, affecting the integrity of information derived from raw FCS files. Consequently, it was determined that input files should be pre-processed through FlowJo and exported as CSV files for merging.

### Design 2

Adopting a refined approach, users now input Excel (.xlsx) files already analyzed by FlowJo into our generator. This method ensures the merged CSV file retains the analytical accuracy and detail necessary for subsequent research phases.

## Front-end Design

### Wireframe

The front-end interface is crafted with user experience in mind, developed using Figma for design prototyping and Flask API for application functionality. This approach ensures intuitive navigation and interaction within the application.

For insights into the front-end design and wireframes, visit the [Wireframe](https://wehieduau.sharepoint.com/:u:/s/StudentInternGroupatWEHI/EYEnvVJa6P9Ml496VLLnjqsBnW40t5Vth79XrcLGCcMOWQ?e=YgRWXA) section.

## Getting Started

To contribute to the GMM project or utilize the application for your research, please review the detailed workflow diagrams, understand the design considerations, and explore the front-end wireframes for a comprehensive understanding of the project scope and functionalities.

## Contributors and Supervisors

Special thanks to our contributors across various intakes and our dedicated supervisors, Rowland Mosbergen and Marek Cmero, for their guidance and expertise. For a full list of contributors, see the [Contributors section](#contributors).

## Acknowledgments

We extend our gratitude to all interns, contributors, and the wider WEHI community for their support and contributions towards the Genomics Metadata Multiplexing project's success.
