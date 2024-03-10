# Week4

## Questions
* Accessing Sample Data 
Supposed to open it using FlowJo, which we had no access to. Directly opened it with fcsparser. Guess this is even better?

* Merging Documents
1. Currently being done manually -> aim to develop a streamlined process that automatically merges homogeneous .fcs files 
   Question: Are these .fcs files output to the same computer? Are we supposed to develop a function (can be a library) that searches for homo 
   docs and combine them, or a function that requires manually input of homo docs' names. 

2. Are we supposed to merge the whole files or merge the sections of files? Or only merging the summary tables? 



* Documents produced by the FACs Lab
1 with cell names and counts, the other one with the summary table

## Current design
1. Input the directories of files that need to be merged into a list
2. Input this list into a function written by us, which goes through the list and opens each file, extracts the component that needs to be processed
3. While opening each .fcs file, the function also merges it with the previous merged data table
4. Output the complete merged file into the .xlsx form

## Meeting Agenda
1. Addressing the questions listed above
2. Going through the current design to spot if there is any flaw within the design
2. Discussing possible next-steps









# Week5


## Files needed
1. Check that the fcsparser library is doing the right job
2. Confirm the way of merging data frames. e.g., inner join? outer join? concatenation?
3. Confirm the layout of the ultimate Excel sheet. e.g., headers? sections? 
3. See if there is any other improvement that can be made along the way, e.g., highlighting anomalies or target cells


## Ideas
* Highlighting Target Information
We can incorporate an additional function in our codes, which does the job of highlighting entries that researchers are most interested in. 
This is done by the researcher inputting the list of interested cells and their corresponding range, e.g., [['PE-tetramer', 'greater', 100], ['SSC-A', 'less', 30000]]...

For example, the entry ('PE-tetramer',216) which has a figure of 132.89 will be highlighted by inputting the above command. 

* Highlighting anomalies
We can also incorporate a package that contains most of the anomalies of the cells, just like the 'stopwords' library in NLP. This helps researchers automatically detect possible anomalies, which saves time from checking each entry. 

## Meeting Agenda
1. Discuss the feasibility and necessity of ideas
2. Discuss if there are other related actions that can be automated
3. See if there is time for another meeting in this week after we get the files
4. Possible next-steps



# Week6

1. Done implementing the process of parsing and merging
2. Up to the task of implementing function for searching and highlighting anomalies

## Questions
* Each FACS files contain 2 parts: raw data and metadata. Question: should the metadata be merged within 1 separated file, or merged with the same file as the raw data, or should be noted down somewhere else?

## Ideas
* Data visualisation: currently planning what type of visualisation/graphs should be used for flow cytometry. Question: which part of the data will be used (a particular part or the whole merged dataset)
 
* Import API: come up with ideas on the structure for user interaction between the new imported functionality and customer interaction
The idea is transforming the functionality of merging index files into a web application (using framework such as flask, django,...). Whereby highlighting user interaction purposes, by inputting index data files into out machine, and our server will output a parsed and merged single excel sheet for them directly at another page for downloading  

## Meeting Agenda
1. Discuss the current process and its problem
2. Discuss the feasibility and necessity of ideas
3. Discuss if there are other related actions that can be automated
4. Possible next-steps


# Week7


1. In progress of brainstorming and creating wireframe
2. Implement new design due to unmatched results in previous design

## Questions
Problem with design 1, and changes to design 2: This design compared to the accurate reults done by flowjo is different. Out team worked through and noticed that the functionality of flowjo can't be replace, since besidess parsing, flowjo also analyse the data which will impact the data from the raw fcs files. Hence out team discuss and restrict the input files to merge should have been through flowjo and exported as a csv file 

Tasks for this week
* Continue develop on the current wireframe
* Research how to implement by sung Flask API

## Meeting Agenda
1. Discuss the problems of Design 1
2. Discuss the new design (Design 2)
3. Discuss if there are other related actions that can be automated
4. Possible next-steps


# Week8

## Current Experiment Spreadsheet Elements
1. Primer Layout manually edited by Genomics Lab
2. Flow Cytometry data contained in the FCS files

## Basic process of Web Application
1. Click on the automated merging web application link
2. Upload the primer layout to the 'Primer Layout' button
3. Upload the excel sheets that have been processed by FlowJo waiting for merging to the 'FCS' button
   If there are multiple files, upload the folder
4. Download the merged excel sheet by clicking the 'Download' button

## This week general progress
1. Progress on wireframe (should be at least 80% done)
2. Discuss and finalise which Design will be used
3. Merge primer index template and merged excel sheet of fcs files
4. Start of the basics on generator web app (skeletons) - which components is needed (front/back and db)

## Meeting Agenda
1. Discuss the hypothesis made after parsing using differences library
2. Discuss few differences between the process of Flowjo and Python parser 
3. Finalise which design to use to implement to web app
4. For this generator, does it require to implement a database?

# Week9

## Problem to discuss
1. Primer Index Layout are varied from each sample file, a possible solution is importing just the most common columns appear in most of the files given. Or any suggestion?

2. Any order required when merging the plates together?

3. Complexity of plates file, e.g if the plate are given mixed up (c011 and c040 in 1 excel sheet), what could the solution be?

## Task
1. Find most common columns appear in all columns of primer index files
2. Remove the double header row in primer index file, for testing purpose
3. Compare closely the accuracy of the result of merging mechanism 




