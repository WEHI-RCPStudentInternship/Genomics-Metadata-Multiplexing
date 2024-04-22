#!/bin/python3

import argparse
import pandas as pd
from pathlib import Path
from operations import plate_to_samplesheet, collate_fcs_files, merge_data_with_samplesheet

def create_temp_folder():
    """Create a temporary folder if it doesn't exist."""
    temp_file_path = Path('temp')
    temp_file_path.mkdir(parents=True, exist_ok=True)
    return temp_file_path

def process_files(plate_layout_path, fcs_file, template_sheet_path, primer_index_path, output_file):
    """
    Process files according to the GMM testing operations.

    Parameters:
    - plate_layout_path: Path to the plate layout file.
    - fcs_file: Path to the FCS file.
    - template_sheet_path: Path to the template sheet file.
    - primer_index_path: Path to the primer index file.
    - output_file: Path and name of the output file, including desired extension.
    """
    # Determine output format based on file extension
    output_format = output_file.split('.')[-1]

    # operation 1: create sample sheet from plate layout template
    sample_sheet_df = plate_to_samplesheet(plate_layout_file_path)
    sample_sheet_df.to_csv('temp/op1.plate_layout_to_spreadsheet.tsv', sep='\t', index=False)
    
    # operation 2: combine fcs files into one tsv file
    collated_fcs_df = collate_fcs_files([fcs_input_file_path], "")  # provide a list of fcs files
    collated_fcs_df.to_csv('temp/op2.collate_fcs_files.tsv', sep='\t', index=False)
    
    # opeartion 3: merge all data into a comprehensive file
    merged_samplesheet_fcs_and_template_sheet_df =  merge_data_with_samplesheet(spreadsheet_filepath=sample_sheet_file_path.as_posix(), 
                                                                                fcs_file="temp/op2.collate_fcs_files.tsv", 
                                                                                template_sheet_filepath=template_sheet_file_path)
    
    # operation 4 (option): add primer index to comprehensive file
    primer_index_df = pd.read_excel(primer_index_file_path, sheet_name='Sample primer & index', skiprows=3)
    
    # generate mockup test result file
    merged_primer_index_df = pd.merge(merged_samplesheet_fcs_and_template_sheet_df, primer_index_df, 
                                      on=['Plate#', 'Well position', 'Sample name'], 
                                      suffixes=('', '_primer'), how='left')
    
    merged_primer_index_df.to_csv('temp/final.tsv', sep='\t', index=False)
    merged_primer_index_df.to_excel('temp/final.xlsx', index=False)

    # Output file processing
    if 'csv' in output_file or 'tsv' in output_format:
        sep = ',' if 'csv' in output_file else '\t'
        print(sep)
        merged_df.to_csv(output_file, sep=sep, index=False)
    elif 'xlsx' in output_format:
        merged_df.to_excel(output_file, index=False)

def main():
    """Main function to parse arguments and call processing functions."""
    parser = argparse.ArgumentParser(description='Process GMM testing files.')
    parser.add_argument('-pl', '--plate-layout', required=True, help='Path to plate layout file')
    parser.add_argument('-fcs', '--fcs-file', required=True, help='Path to FCS file')
    parser.add_argument('-ts', '--template-sheet', required=True, help='Path to template sheet file')
    parser.add_argument('-pi', '--primer-index', required=False, help='Path to primer index file')
    parser.add_argument('-o', '--output-file', required=True, help='Full path and file name for the output, including extension (.csv, .tsv, .xlsx)')
    
    args = parser.parse_args()
    create_temp_folder()

    process_files(plate_layout_path=args.plate_layout, 
                  fcs_file=args.fcs_file, 
                  template_sheet_path=args.template_sheet, 
                  primer_index_path=args.primer_index, 
                  output_file=args.output_file)

if __name__ == "__main__":
    main()
