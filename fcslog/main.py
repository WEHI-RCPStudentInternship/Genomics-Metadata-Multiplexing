import os
import shutil
import pandas as pd

def organising_files(directory, primer_index_path, fcs_data_path):
    """
    
    """
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

def merge_by_plate(fcs_data_path, primer_index_path, column_merge_output_path, row_merge_output_path):
    """

    """

    # STEP 1: Merge files from the Index Primer folder and FCS folder with matching code/prefix names
    for filename1 in os.listdir(primer_index_path):
        
        # CASE 2: Found an Primer Index file
        if filename1.endswith(".xlsx"):
            
            # STEP 3: Get the Filepath of the Primer Index file
            file_path1 = os.path.join(primer_index_path, filename1)

            # STEP 4: Extract the Primer Index file prefix (e.g. LC372)
            file_name_prefix = filename1.split("_", 1)[0]
            #print("Prefix: ", file_name_prefix)

            # STEP 5: Find the FCS file with the matching prefix
            matching_filename2 = next((f for f in os.listdir(fcs_data_path) if f.startswith(
                file_name_prefix) and f.endswith(".xlsx")), None)

            # STEP 6: Continue with COLUMN merge if matching FCS file is found
            if matching_filename2:

                # STEP 7: Get the file path of the matching FCS file
                file_path2 = os.path.join(fcs_data_path, matching_filename2)
                #print(f"Start mereging {file_path1} and {file_path2}")

                # STEP 8: Read the Primer Index and FCS files as excel spreadsheets
                df1 = pd.read_excel(file_path1)
                df2 = pd.read_excel(file_path2)

                # STEP 9: Perform the COLUMN merge between the matching Index Primer and FCS files
                merged_df = pd.concat([df1, df2], axis=1)

                # STEP 10: Save the COLUMN merged outputs within an output folder
                merged_sheet_name = f"column_merged_plate_{file_name_prefix}.xlsx"
                merged_sheet_path = os.path.join(column_merge_output_path, merged_sheet_name)
                merged_df.to_excel(merged_sheet_path, index=False)

    # STEP 11: Perform ROW merge (i.e. Merge all COLUMN outputs together)
    row_df = []
    for column_file in os.listdir(column_merge_output_path):
        
        # STEP 12: Ensure the column file is an excel spreadsheet
        if column_file.endswith("xlsx"):
            
            # STEP 13: Get the file path of the column file
            column_file_path = os.path.join(column_merge_output_path, column_file)
            #print(f"File {column_file_path}")

            # STEP 14: Read and merge (by ROW) the column files
            df = pd.read_excel(column_file_path)
            row_df.append(df)

    # STEP 15: Concatonate the row dataframes together
    row_merge = pd.concat(row_df, ignore_index=True)
    row_merge_output_path = os.path.join(row_merge_output_path, "final_merged_output.xlsx")

    # STEP 16: Save the row merged DataFrame into an Excel file
    row_merge.to_excel(row_merge_output_path, index=False)

if __name__ == "__main__":

    # STEP 1: Get the root directory
    main_directory = "./"

    # STEP 2: Get the Primer Index data directory (Note: Edit this filepaths as needed)
    primer_index_folder = "../sample_data/intake3_data/intake3_data_set1/intake3_set1_pi/"
    primer_index_path = os.path.join(main_directory, primer_index_folder)

    # STEP 3: Get the FCS data directory (Note: Edit this filepaths as needed)
    fcs_data_folder = "../sample_data/intake3_data/intake3_data_set1/intake3_set1_fcs/"
    fcs_data_path = os.path.join(main_directory, fcs_data_folder)

    # STEP 4: Organise files to folder
    organising_files(main_directory, primer_index_path, fcs_data_path)

    # STEP 5: Create folders to store the COLUMN and ROW merge outputs
    column_merge_output = "column_merge_output"
    column_merge_output_path = os.path.join(main_directory, column_merge_output)
    os.makedirs(column_merge_output_path, exist_ok=True)
    row_merge_output = "row_merge_output"
    row_merge_output_path = os.path.join(main_directory, row_merge_output)
    os.makedirs(row_merge_output_path, exist_ok=True)

    # STEP 6: Perform the merging process
    merge_by_plate(fcs_data_path, primer_index_path, column_merge_output_path, row_merge_output_path)
