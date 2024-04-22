import pandas as pd
import fcsparser

import flowkit as fk
from bokeh.plotting import show

from shiny import App, render, ui
from pathlib import Path


"""

Uploading multiple fcs files
Parse by fcs_parser (raw), flowkit (tramsform)
Merge all files 
Show merged results (both scale value and channel value)
Download to csv file (download the file you selected)

"""

app_ui = ui.page_fluid(
    ui.layout_columns( 
        ui.card( 
            ui.card_header("Upload FCS files"), 
            ui.input_file("fcs", "Upload one or multiple FCS files:", accept=".fcs", multiple=True),
        ), 

        ui.card( 
            ui.card_header("Download the following CSV dataset"), 
            ui.row( 
                ui.column(6, ui.download_button("download_csv", "Download CSV file")),
            ) ,
            # ui.row( 
            #     ui.column(6, ui.download_button("download_scale_csv", "Download CSV-Scale values")), 
            #     ui.column(6, ui.download_button("download_channel_csv", "Download CSV-Channel values")),
            # ) ,
        ), 
    ),
    ui.card( 
        ui.card_header("Show Merged Results"), 
        # ui.input_select("x", "Select a file Format to Show", {"a": "CSV-Scale values", "b": "CSV-Channel values"}),
        ui.input_radio_buttons(
            "type",
            "Select a File Format to Show",
            choices=["CSV-Scale values", "CSV-Channel values"],
        ),
        ui.output_table("table"),
    ), 
)


def server(input, output, session):

    @output
    
    # @session.download(filename="result.csv")
    @session.download(filename="merged_csv.csv")
    def download_csv():
        if input.type() == "CSV-Scale values":
            df = pd.DataFrame()
            fcs_files = input.fcs()
            if not fcs_files:
                return pd.DataFrame()
            for i in range(len(fcs_files)):
                fcs_file_path = Path(fcs_files[i]["datapath"])
                _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
                df = pd.concat([df, raw_data])

            # Save the DataFrame to a CSV file in memory and yield the content
            csv_content = df.to_csv(index=False)
            yield csv_content
        elif input.type() == "CSV-Channel values":
            df = pd.DataFrame()
            fcs_files = input.fcs()
            # print(fcs_files)
            if not fcs_files:
                return pd.DataFrame()
            for i in range(len(fcs_files)):
                fcs_file_path = Path(fcs_files[i]["datapath"])
                sample = fk.Sample(fcs_file_path)
                labels = sample.pnn_labels
                transform_dict = {}
                for label_index in sample.fluoro_indices:
                    label = labels[label_index]
                    transform_dict[label] = fk.transforms.LogicleTransform(label,param_t= 262144.0, param_w= 1.0, param_m=4.4185399, param_a=0.0)
                for label_index in sample.scatter_indices:
                    label = labels[label_index]
                    transform_dict[label] = fk.transforms.LinearTransform(label,param_t= 262144.0, param_a=0.0)
                label_time = labels[sample.time_index]
                transform_dict[label_time] = fk.transforms.LinearTransform(label,param_t= 69.0, param_a=1.2746832452)  
                # apply transformation
                sample.apply_transform(transform_dict)   
                scaled_data = sample.as_dataframe(source='xform')

                df = pd.concat([df, scaled_data])

            # Save the DataFrame to a CSV file in memory and yield the content
            csv_content = df.to_csv(index=False)
            yield csv_content

    # @session.download(filename="merged_scale.csv")
    # def download_scale_csv():
    #     df = pd.DataFrame()
    #     fcs_files = input.fcs()
    #     if not fcs_files:
    #         return pd.DataFrame()
    #     for i in range(len(fcs_files)):
    #         fcs_file_path = Path(fcs_files[i]["datapath"])
    #         _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
    #         df = pd.concat([df, raw_data])

    #     # Save the DataFrame to a CSV file in memory and yield the content
    #     csv_content = df.to_csv(index=False)
    #     yield csv_content

    # @session.download(filename="merged_channel.csv")
    # def download_channel_csv():
    #     df = pd.DataFrame()
    #     fcs_files = input.fcs()
    #     # print(fcs_files)
    #     if not fcs_files:
    #         return pd.DataFrame()
    #     for i in range(len(fcs_files)):
    #         fcs_file_path = Path(fcs_files[i]["datapath"])
    #         sample = fk.Sample(fcs_file_path)
    #         labels = sample.pnn_labels
    #         transform_dict = {}
    #         for label_index in sample.fluoro_indices:
    #             label = labels[label_index]
    #             transform_dict[label] = fk.transforms.LogicleTransform(label,param_t= 262144.0, param_w= 1.0, param_m=4.4185399, param_a=0.0)
    #         for label_index in sample.scatter_indices:
    #             label = labels[label_index]
    #             transform_dict[label] = fk.transforms.LinearTransform(label,param_t= 262144.0, param_a=0.0)
    #         label_time = labels[sample.time_index]
    #         transform_dict[label_time] = fk.transforms.LinearTransform(label,param_t= 69.0, param_a=1.2746832452)  
    #         # apply transformation
    #         sample.apply_transform(transform_dict)   
    #         scaled_data = sample.as_dataframe(source='xform')

    #         df = pd.concat([df, scaled_data])

    #     # Save the DataFrame to a CSV file in memory and yield the content
    #     csv_content = df.to_csv(index=False)
    #     yield csv_content


    @render.table
    def table():
        if input.type() == "CSV-Scale values":
            df = pd.DataFrame()
            fcs_files = input.fcs()
            if not fcs_files:
                return pd.DataFrame()
            for i in range(len(fcs_files)):
                fcs_file_path = Path(fcs_files[i]["datapath"])
                _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
                df = pd.concat([df, raw_data])
            print("Numer of rows: ", df.shape[0], ". Numer of columns: ", df.shape[1], sep = '')
            return df
        
        elif input.type() == "CSV-Channel values":
            df = pd.DataFrame()
            fcs_files = input.fcs()
            # print(fcs_files)
            if not fcs_files:
                return pd.DataFrame()
            for i in range(len(fcs_files)):
                fcs_file_path = Path(fcs_files[i]["datapath"])
                sample = fk.Sample(fcs_file_path)
                labels = sample.pnn_labels
                transform_dict = {}
                for label_index in sample.fluoro_indices:
                    label = labels[label_index]
                    transform_dict[label] = fk.transforms.LogicleTransform(label,param_t= 262144.0, param_w= 1.0, param_m=4.4185399, param_a=0.0)
                for label_index in sample.scatter_indices:
                    label = labels[label_index]
                    transform_dict[label] = fk.transforms.LinearTransform(label,param_t= 262144.0, param_a=0.0)
                label_time = labels[sample.time_index]
                transform_dict[label_time] = fk.transforms.LinearTransform(label,param_t= 69.0, param_a=1.2746832452)  
                # apply transformation
                sample.apply_transform(transform_dict)   
                scaled_data = sample.as_dataframe(source='xform')
                df = pd.concat([df, scaled_data])

            print("Numer of rows: ", df.shape[0], ". Numer of columns: ", df.shape[1], sep = '')
            return df


app = App(app_ui, server)
