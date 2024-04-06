# Markdown Assets
This directory exists to store assets such as images for markdown files. ```Markdown``` files, denoted by ```.md``` file extension, mainly refers to the ```README.md``` files within the codebase **OR** any of the Geneomics-Metadata-Multiplexing [wiki pages](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki).

This markdown file has the following contents:
1. [Before Adding New Images](#before-adding-new-images)
2. [Inserting Images Within Markdown Files](#inserting-images-within-markdown-files)

## Before Adding New Images
Notice the structure of this directory. Images are categorised according to their relevance. If a new subdirectory is needed, feel free to create one.

## Inserting Images Within Markdown Files
1. Add the image within ```markdown-assets``` directory.
```
git add image-filename
git commit -m "Add image-filename.imagetype to wiki-assets"
git push remote branch
```
2. If the image is used within:
    - codebase README.md files, images will be referenced using **relative** filepaths (e.g. ```./markdown-assets/gmm-images/cel-seq2-steps.png```)
    - GitHub wiki pages, images will be referenced using **URLs** (e.g. ```https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/blob/main/wiki-assets/gmm-images/cel-seq2-steps.png```)


3. When editing a markdown file, add the following html tag
    ```
    <a title="click for full image" href="">
        <img width="610" alt="Image Description" src="">
    </a>
    ```
    - Within ```href``` and ```src```, include the image's relative file path or URL
4. When finished either:
    - Save and publush the wiki page, or
    - Save the README.md file:
    ```
    git add README.md
    git commit -m "Add image-filename.filetype to README.md"
    git push remote branch
    ```
