# Application Functionality Test Guide

This document provides a clear guide to testing the functionality of specific operations within the Genomics Metadata Multiplexing application. The operations are designed to handle various aspects of genomics data processing. The guide is structured to be accessible for both technical and non-technical users.

## Important Notice

> ⚠️ **Warning:** The operation names mentioned below may be unclear for non-technical users. These names are subject to change in future updates to improve clarity. However, the order of execution will remain the same. Please refer to the operation number (e.g., `op[number]`) for both input and output results.

## Testing Overview

For testing purposes, we use mock data for experiment number LCE123. **Please note that there is no actual FCS file corresponding to the LCE123 Experiment (including template and sample sheet).** Instead, use the provided mock data for testing. For mockup data generation, please refer [mockup_test_data.ipynb](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/blob/shiny-r-dev/test/mockup_data/mockup_test_data.ipynb).

### Input Files for Testing

Below are the links to input files for each operation:

| Operation | Description | Link |
|-----------|-------------|------|
| Operation 1 | Plate Layout to Spreadsheet | [View Input File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/tree/shiny-r-dev/test/input_files/op1.plate_layout_to_spreadsheet) |
| Operation 2 | Collate FCS Files | [View Input File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/tree/shiny-r-dev/test/input_files/op2.collate_fcs_files) |
| Operation 3 | Merge Data into Spreadsheet | [View Input File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/tree/shiny-r-dev/test/input_files/op3.merge_data_into_spreadsheet) |
| Operation 4 | Merge Primer Index | [View Input File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/tree/shiny-r-dev/test/input_files/op4.merge_primer_index) |

### Expected Output Files

After conducting the tests, you should obtain the following output files:

| Operation | Output File Description | Link |
|-----------|-------------------------|------|
| Operation 1 | Plate Layout Sample Sheet.tsv | [View Output File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/blob/shiny-r-dev/test/output_files/op1.plate_layout_to_spreadsheet.tsv) |
| Operation 2 | Collated FCS files.tsv | [View Output File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/blob/shiny-r-dev/test/output_files/op2.collate_fcs_files.tsv) |
| Operation 3 | Merged FCS files based on provided sample sheet and template sheet.tsv | [View Output File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/blob/shiny-r-dev/test/output_files/op3.merged_sample_sheet.tsv) |
| Operation 4 | Merged FCS experiment results with Primer Index File.tsv | [View Output File](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/blob/shiny-r-dev/test/output_files/op4.merged_primer_index.tsv) |

### Verifying Output File Integrity

To ensure the integrity of the output files, you can use the `md5sum` command to check their MD5 hash values. The expected MD5 hash values for each operation's output file are listed below:

```bash
# Use md5sum to check the file output hash value, e.g.,
md5sum op1.plate_layout_to_spreadsheet.tsv
```

#### Expected output MD5 hash values
```
758d88d529b2c4823d8479b200d85dca  op1.plate_layout_to_spreadsheet.tsv
40f779583ade1d502ed03adba23fabbc  op2.collate_fcs_files.tsv
9def5b6ed4277b786786b0066c342fa4  op3.merged_sample_sheet.tsv
e44bd18d9e1ffc2a71cb806f498421b5  op4.merged_primer_index.tsv
```

By following this guide, you can effectively test the operations within the Genomics Metadata Multiplexing application using mock data.


