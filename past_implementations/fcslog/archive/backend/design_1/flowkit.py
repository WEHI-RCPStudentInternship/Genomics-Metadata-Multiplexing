import os
import glob
import pandas as pd
from flowkit import FCMeasurement, io

# Function to parse FCS files in a folder and return data as a DataFrame
def parse_fcs_files(folder_path):
    data_frames = []
    for fcs_file in glob.glob(os.path.join(folder_path, "*.fcs")):
        sample = FCMeasurement(fcs_file)
        data_frames.append(sample.data)
    merged_data = pd.concat(data_frames, ignore_index=True)
    return merged_data

# Get input folder path from the user
input_folder = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Data/FACS Data/C014" 
#input_folder = input("Enter the path to the folder containing FCS files: ")

# Parse FCS files and merge data
output_folder = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Design 1/flowkit_results"
# Parse FCS files and merge data
try:
    merged_data = parse_fcs_files(input_folder)

    # Save merged data to an Excel file
    output_file = "merged_data.xlsx"
    merged_data.to_excel(output_file, index=False)
    print(f"Merged data saved to {output_file}")
except Exception as e:
    print(f"An error occurred: {e}")
