# Wiki Assets
This directory exists to store assets such as images for the Geneomics-Metadata-Multiplexing [wiki pages](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki).

## Inserting Wiki Images
1. Save the desired file in this directory via git
    ```
    git add image-filename
    git commit -m "Add image-filename.imagetype to wiki-assets"
    git push origin main
    ```
2. When editing a wiki page add the following html tag
    ```
    <img width="610" alt="Image Description" src="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/tree/main/assets/image-filename.imagetype">
    ```
3. Save & publish the wiki page
