import os
import shutil
import pandas as pd
import openpyxl


def organising_files(directory):

    # Automatically create Primer Index Folder
    os.makedirs(primer_index_path, exist_ok=True)

    # Automatically create FCS Data Folder
    os.makedirs(fcs_data_path, exist_ok=True)

    for file in os.listdir(directory):
        if file.endswith(".xlsx"):
            if "PRIMER" in file.upper():
                target_folder = primer_index_path
            if "FCS" in file.upper():
                target_folder = fcs_data_path
            else:
                continue

            source_path = os.path.join(directory, file)
            target_path = os.path.join(target_folder, file)
            shutil.move(source_path, target_path)

    print("Files organized successfully.")


# Root Directory
main_directory = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Merge Mechanism"
# Primer Index Directory
primer_index_folder = "Primer Index Folder"
primer_index_path = os.path.join(main_directory, primer_index_folder)
# FCS Data Directory
fcs_data_folder = "FCS Data Folder"
fcs_data_path = os.path.join(main_directory, fcs_data_folder)
# Organising Files to Folder
organising_files(main_directory)

# TEST
print(primer_index_path)
print(fcs_data_path)

# Create another folder to store merged file (Primer Index + FCS)
merged_files_path = os.path.join(main_directory, "Output Folder")
os.makedirs(merged_files_path, exist_ok=True)


def merge_by_plate():
    # Step 1: Merge files from folder 1 and folder 2 with matching names
    for filename1 in os.listdir(primer_index_path):
        if filename1.endswith(".xlsx"):
            file_path1 = os.path.join(primer_index_path, filename1)
            # Extract the part before the space
            file_name_prefix = filename1.split(" ", 1)[0]

            # CHECK
            print("Prefix: ", file_name_prefix)

            # Find matching folder e.g LC011 Primer Index to LC011 FCS -- so no need to ordered
            matching_filename2 = next((f for f in os.listdir(fcs_data_path) if f.startswith(
                file_name_prefix) and f.endswith(".xlsx")), None)

            if matching_filename2:
                file_path2 = os.path.join(fcs_data_path, matching_filename2)

                # CHECK
                print(f"Start mereging {file_path1} and {file_path2}")

                df1 = pd.read_excel(file_path1)
                df2 = pd.read_excel(file_path2)

                merged_df = pd.concat([df1, df2], axis=1)

                # Automaticallu save merged sheet in the separate folder called Complete_Primer&Index
                merged_sheet_name = f"merged_plate_{file_name_prefix}.xlsx"
                merged_sheet_path = os.path.join(
                    merged_files_path, merged_sheet_name)
                merged_df.to_excel(merged_sheet_path, index=False)

    # Step 2: Merge all merged files by rows into one excel sheet
    final_df = []
    for filename in os.listdir(merged_files_path):
        if filename.endswith("xlsx"):
            filepath = os.path.join(merged_files_path, filename)

            print(f"File {filepath}")
            # Read and Merge
            df = pd.read_excel(filepath)
            final_df.append(df)

    final_merge = pd.concat(final_df, ignore_index=True)
    final_output_path = os.path.join(
        main_directory, "final_merged_output.xlsx")

    # Save the final merged DataFrame into an Excel file
    final_merge.to_excel(final_output_path, index=False)


# MERGE PROCESSING
merge_by_plate()
