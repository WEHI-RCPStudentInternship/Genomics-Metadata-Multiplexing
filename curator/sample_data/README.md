# sample_data

Welcome to the ```sample_data``` directory which contains files needed for the FCS and Index Primer merge process 
that generates the experiment spreadsheet. 

For more information on the merging process, consult in the [Problem Space](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space) wiki page.

This markdown file contains the following contents:
- [Disambiguations](#disambiguations)
- [Directory Structure](#directory-structure)

## Disambiguations
- ```FCS```: a file type, ```.fcs```, that stands for [```Flow Cytometry Standard```](https://en.wikipedia.org/wiki/Flow_Cytometry_Standard)
- ```pi```: an **UNOFFICIAL** ancroynm, meaning ```Primer Index```, which  used in this repository to shorten filesnames
- ```gt```: an **UNOFFICIAL** ancroynm, meaning ```Genomics Team```, which  used in this repository to shorten filesnames

## Directory Structure
- [```fcs_files```](./fcs_files/): a collection of **RAW** and **PROCESSED** FCS files
    - [```c014_files```](./fcs_files/c014_fcs/): **RAW** FCS files produced by the flow cytometry machine (i.e. Aria Beckman)
        - [```intake3_c014_index_file_analysis```](./fcs_files/c014_fcs/intake3_c014_index_file_analysis/): Analysis ```c014``` results conducted by the 2023 Semester 2 intake
    - [```intake4_fcs```](./fcs_files/intake4_fcs/): a collection of **RAW** FCS values used by the 2023-2024 Summer intake
- [```pi_files```](./pi_files/): a collection of **Primer Index** files
    - [```flowjo_pi```](./pi_files/flowjo_pi/): a collection of **manually edited** and **PROCESSED** (i.e. FlowJo ```.xlsx``` outputs) primer index files
    - [```pi_templates```](./pi_files/pi_templates/): templates for **primer index** files
- [```gt_files```](./gt_files/): a collection of files provided by the WEHI genomics team
    - [```gt_fcs```](./gt_files/gt_fcs/): a collection of FCS files given by the WEHI genomics team
    - [```gt_fcs```](./gt_files/gt_pi/): a collection of **Primer Index** files given by the WEHI genomics team
    - [```gt_demultiplexing```](./gt_files/gt_demultiplexing/): files used for the demultiplexing step within the [CEL-Seq2](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space#cel-seq2-workflow) workflow
    - Remaining files have **NO FURTHER** documentation by previous intakes
- [```intake3_data```](./intake3_data/): test data used by the 2023 Semester 2 intake to develop their [FCSLOG](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/FCSLOG) merge application
    - [```intake3_data_set1```](./intake3_data/intake3_data_set1/): a collection of **FCS** and **Primer Index** files from codes LC370-LC372
        - [```intake3_set1_fcs```](./intake3_data/intake3_data_set1/intake3_set1_fcs/): a collection of **FCS** files **PROCESSED** by FlowJo
        - [```intake3_set1_pi```](./intake3_data/intake3_data_set1/intake3_set1_pi/): a collection of **Index Primer** files
        - [```intake3_set1_column_merge```](./intake3_data/intake3_data_set1/intake3_set1_column_merge/): files after the 1st (i.e. column) merge between **FCS** and **Index Primer** files that share the **SAME** code
        - [```intake3_set1_row_merge.xlsx```](./intake3_data/intake3_data_set1/intake3_set1_row_merge.xlsx): a file after the 2nd (i.e. row) merge between files in the ```intake3_set1_column_merge``` directory
    - [```intake3_data_set2```](./intake3_data/intake3_data_set2/): a collection of **FCS** and **Primer Index** files with codes C011, C051 and C078
        - [```intake3_set2_fcs```](./intake3_data/intake3_data_set2/intake3_set2_fcs/): a collection of **FCS** files **PROCESSED** by FlowJo
        - [```intake3_set2_pi```](./intake3_data/intake3_data_set2/intake3_set2_pi/): a collection of **Index Primer** files
        - [```intake3_set2_column_merge```](./intake3_data/intake3_data_set2/intake3_set2_column_merge/): files after the 1st (i.e. column) merge between **FCS** and **Index Primer** files that share the **SAME** code
        - [```intake3_set2_row_merge.xlsx```](./intake3_data/intake3_data_set2/intake3_set2_row_merge.xlsx): a file after the 2nd (i.e. row) merge between files in the ```intake3_set2_column_merge``` directory
        - [```intake3_set2_test.py```](./intake3_data/intake3_data_set2/intake3_set2_test.py): The Python Script used to generate the column and row merges
- [```sister_repo_templates```](./sister_repo_templates/): example templates used by WEHI's subject matter expert, Marek Cmero, for the [celseq-sample-sheet-generator](https://github.com/WEHIGenomicsRnD/celseq-sample-sheet-generator) repository
- [```miscellaneous```](./miscellaneous/): files that have remained **UNDOCUMENTED** by previous intakes
