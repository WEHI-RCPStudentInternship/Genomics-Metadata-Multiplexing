import fcsparser
import flowkit as fk

# scale - fcsparser
def scale_value(fcs_file_path):
    _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
    return raw_data


# channel - flowkit
def channel_value(fcs_file_path):
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
    return scaled_data
