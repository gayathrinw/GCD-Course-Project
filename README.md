# GCD-Course-Project
GCD Course Project

There is only one script to run which is runAnalysis.R.  The only argument is the URL for the zipped file at the UCI Machine Learning Repository.  This will output a tidy dataset that shows the average of each of the recorded variables for each Subject by each Activity Type.

The script starts off by extracting all of the data from the zipped file, naming columns appropriately, and combining it all into a single dataframe.  Then it proceeds to extract only the relevant information from that dataframe and summarize it into the final tidy dataset.

For additional information on the variables in the tidy dataset, please see CodeBook.md.
