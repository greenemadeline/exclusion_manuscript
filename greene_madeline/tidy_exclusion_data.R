# Load libraries here. I'll start for you! ---------------------------------------------------
library(tidyverse)
library(readxl)

# Define any variables for use globally here, i.e. to avoid hardcoding them later ------------
# At a minimum, you need FOUR definitions:
### The path to the raw data
### The name of the input excel file
### The two CORRECT names of the final CSV files you will save (they should be saved in the same directory as this script)


#the pathway to the raw data and input excel file :
rawdata_path <- "/cloud/project/raw_data/exclusionExperimentData.xlsx"


# Load the excel sheets here ---------------------------------------------------------------
#defined the pathway to access the excel file sheet above
read_excel(rawdata_path, "metaData") -> meta_data #renamed the datasheets so easier to access the data 
read_excel(rawdata_path, sheet = "algalDiversity") -> algal_diversity
read_excel(rawdata_path, sheet = "coralGrowth") -> coral_growth
read_excel(rawdata_path, sheet = "exclosureCover") -> exclosure_cover
read_excel(rawdata_path, sheet =  "plotBites") -> plot_bites
read_excel(rawdata_path, sheet = "recruitment") -> recruitment

#showing all outputs with head() as followed to make sure it was loaded in properly
head(meta_data)
head(algal_diversity)
head(coral_growth)
head(exclosure_cover)
head(plot_bites)
head(recruitment)




# Tidy and wrangle the data here --------------------------------------------------------------




# Export the data sets to two correctly-named CSV files (see instructions!) here --------------

