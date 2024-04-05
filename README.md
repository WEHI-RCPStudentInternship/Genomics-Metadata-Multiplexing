# Genomics-Metadata-Multiplexing

Welcome to the  Genomics-Metadata-Multiplexing (GMM) [repository](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing).

For extensive documentation regarding the GMM project's overview, goal of the web application and future, please consult the GMM [wiki pages](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki).

This markdown file contains the following content:
1. [Repository Structure](#repository-structure)
2. [Purpose Of Repository Markdown Files And Wiki Pages](#purpose-of-repository-markdown-files-and-wiki-pages)
3. [Naming Conventions For Files And Directories](#naming-conventions-for-files-and-directories)
    - [Exception: Python/Flask Directories](#exception-pythonflask-directories)
4. [Acknowledgements](#acknowledgements)

## Repository Structure
- **markdown-assets**: Stores the [images](./markdown-assets/README.md) used to make the markdown files within this repository, or the wiki pages that document the technicalities of the GMM project
- [```fcslog```](./fcslog/README.md): is name of the 2023 Semester 2 intake's implementation of the [web application](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space#web-application) specified in the [Problem Space](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space) wiki page
- [```Shiny-app```](./Shiny-app/README.md): is the 2023-2024 Summer intake's implementation of the [web application](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space#web-application) specified in the [Problem Space](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Problem-Space) wiki page

NOTE: As **fcslog** and **Shiny-app** are 2 separate implementations of would-be web applications, they should be treated as individual repositories. That is, build assets, .gitignore files, test data and outputs, etc... should be stored within their own respective directories.

## Purpose Of Repository Markdown Files And Wiki Pages
**Repository markdown files** should **ONLY** contain information related to the codebase. For example, if a directory stores contains a ```main.py``` Python file. The README.md file within said directory should explain what ```main.py``` does, and any useful commands such as the execution of said file.

**Wiki Pages** on the other hand provide information **NOT** related to the codebase. Examples include the context behind the GMM project, design decisions behind software architecture, etc.

## Naming Conventions For Files And Directories
- Use names that are meaningful and self-explanatory
- When creating new files or directories, lowercase alphanumeric characters should be used
- Special characters should be AVOIDED whenever possible
- Whitespace characters, should NEVER be used
- The only exception is the use of hyphens, ```-```, that separate alphabetic characters
- The filetype extension for a file should ALWAYS be included at the end
<table>
    <tr>
        <th>&nbsp</th>
        <th>Good:</th>
        <th>Bad:</th>
    </tr>
    <tr>
        <th>Directory:</th>
        <td>web-application</td>
        <td>W3b App!cation</td>
    </tr>
    <tr>
        <th>File:</th>
        <td>gmm-image.png</td>
        <td>GmM Im4g3</td> 
    </tr>
</table>

### Exception: Python/Flask Directories
> use of hyphens, ```-```, that separate alphabetic characters
- Since Python does not recognise hyphens especially for importing, underscores, ```_```, should be used instead
- This should be used up to the root sub-dirctory of the codebase

## Acknowledgements
We would like to acknowledge all the current and past supervisors, subject matter experts, interns and open source contributors that took part in the WEHI GMM project. A list of their names, GitHub usernames, and emails can be found in the [Contributors](https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/Contributors) wiki page.
