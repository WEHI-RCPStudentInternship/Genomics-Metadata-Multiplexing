import os
import pandas as pd
import re
from datetime import datetime

# Path to folder that stores all primer index
primerIndex_path = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Draft_Test/Primer Index"
# Path to folder that stores all fcs files
facsData_path = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Draft_Test/FCS"
# Path to output folder after first merge
output_path = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Draft_Test"

# Create a subfolder to store merged files
merged_sheets_folder = os.path.join(output_path, "Complete_Primer&Fcs")
os.makedirs(merged_sheets_folder, exist_ok=True)


# Step 1: Merge files from folder 1 and folder 2 with matching names
for filename1 in os.listdir(primerIndex_path):
    if filename1.endswith(".xlsx"):
        file_path1 = os.path.join(primerIndex_path, filename1)
        # Extract the part before the space
        file_name_prefix = filename1.split(" ", 1)[0]

        # CHECK
        print("Prefix: ", file_name_prefix)

        # Find matching folder e.g C011 Primer Index to C011 FCS
        matching_filename2 = next((f for f in os.listdir(facsData_path) if f.startswith(
            file_name_prefix) and f.endswith(".xlsx")), None)

        if matching_filename2:
            file_path2 = os.path.join(facsData_path, matching_filename2)

            # CHECK
            print(f"Start mereging {file_path1} and {file_path2}")

            df1 = pd.read_excel(file_path1)
            df2 = pd.read_excel(file_path2)

            merged_df = pd.concat([df1, df2], axis=1)

            # Automaticallu save merged sheet in the separate folder called Complete_Primer&Index
            merged_sheet_name = f"merged_{file_name_prefix}.xlsx"
            merged_sheet_path = os.path.join(
                merged_sheets_folder, merged_sheet_name)
            merged_df.to_excel(merged_sheet_path, index=False)


# Step 2: Merge all merged files by rows into one excel sheet
final_df = []
for filename in os.listdir(merged_sheets_folder):
    if filename.endswith("xlsx"):
        filepath = os.path.join(merged_sheets_folder, filename)

        print(f"File {filepath}")
        # Read and Merge
        df = pd.read_excel(filepath)
        final_df.append(df)

final_merge = pd.concat(final_df, ignore_index=True)
final_output_path = os.path.join(output_path, "final_merged_output.xlsx")

# Save the final merged DataFrame into an Excel file
final_merge.to_excel(final_output_path, index=False)

# COMPLETE
