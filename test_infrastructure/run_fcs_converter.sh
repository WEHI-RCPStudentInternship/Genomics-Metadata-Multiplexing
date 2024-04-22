#!/usr/bin/bash

# Define file paths
PLATE_LAYOUT_PATH="./input_files/op1.plate_layout_to_spreadsheet/plate_spreadsheet_template.xlsx"
FCS_FILES="./input_files/op2.collate_fcs_files/14Jun23_INX_NKC_084_LCE123.fcs" # Add more FCS file paths as needed
TEMPLATE_SHEET_PATH="./input_files/op3.merge_data_into_spreadsheet/template_sheet.xlsx"
PRIMER_INDEX_PATH="./input_files/op4.merge_primer_index/primer_index_template.xlsx" # Optional, remove if not used
OUTPUT_FILE="./temp/output.csv" # Specify the full path and filename including extension

# Execute the Python script
./fcs_converter.py --plate-layout "$PLATE_LAYOUT_PATH" \
                   --fcs-file "$FCS_FILES" \
                   --template-sheet "$TEMPLATE_SHEET_PATH" \
                   --primer-index "$PRIMER_INDEX_PATH" \
                   --output-file "$OUTPUT_FILE"

echo "Processing complete."
