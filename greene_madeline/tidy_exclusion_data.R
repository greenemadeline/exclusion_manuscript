# Load libraries here. I'll start for you! ---------------------------------------------------
library(tidyverse)
library(readxl)

# Define any variables for use globally here, i.e. to avoid hardcoding them later ------------
# At a minimum, you need FOUR definitions:
### The path to the raw data
### The name of the input excel file
### The two CORRECT names of the final CSV files you will save (they should be saved in the same directory as this script)


#the pathway to the raw data and input excel file :
# must use RELATIVE path so it works on ANY computer
#rawdata_path <- "/cloud/project/raw_data/exclusionExperimentData.xlsx"
rawdata_path <- "../raw_data/exclusionExperimentData.xlsx"

# Load the excel sheets here ---------------------------------------------------------------
#defined the pathway to access the excel file sheet above

# this is NOT A dataset!! JUST INFO about the data - don't read it in!!
#read_excel(path = rawdata_path, sheet = "metaData") -> meta_data #renamed the datasheets so easier to access the data 

read_excel(path = rawdata_path, sheet = "algalDiversity") -> algal_diversity
read_excel(path = rawdata_path, sheet = "coralGrowth") -> coral_growth
read_excel(path = rawdata_path, sheet = "exclosureCover") -> exclosure_cover
read_excel(path = rawdata_path, sheet =  "plotBites") -> plot_bites
read_excel(path = rawdata_path, sheet = "recruitment") -> recruitment

#showing all outputs as followed to make sure it was loaded in properly
# in scripts, don't print out like this - run via console to check that they are read in properly
#algal_diversity
#coral_growth
#exclosure_cover
#plot_bites
#recruitment




# Tidy and wrangle the data here --------------------------------------------------------------
algal_diversity %>%
  mutate(treatment = str_replace_all(treatment, c("Partial\r\r\nCage" = "Partial", "Full\r\r\nCage" = "Full"))) %>% 
  #needed to mutate the string because in the console when viewed, the string had backslashes and wasn't tidy 
  #have to use str_replace_all not just str_replace (had an error)
  rename("Algal_Total" = "totSpecies", "Algal_Species" = "numSpecies") -> tidied_algal_diversity 
  #renaming each col so it is easier to understand what the data is representing 

tidied_algal_diversity #viewed to make sure printed correctly

coral_growth %>%
  mutate(treatment = str_replace_all(treatment, c("C" = "Control", "E\r\r\nExclosure" = "Full", "P\r\r\nExclosure" = "Partial"))) -> tidied_coral_growth
  # again, if I just wrote, E Exclosure as viewed in the tibble, it would not work
  # making all treatments the same three options : Control, Full, Partial so all the data is uniform

tidied_coral_growth

exclosure_cover %>%
  mutate(treatment = str_replace_all(treatment, c("C" = "Control", "P" = "Partial", "E" = "Full"))) %>%
  #data = uniform
  pivot_longer(totalUpright:acanthophora,
             names_to = "Species",
             values_to = "Percent_cover") %>%
#from meta_data, totalUpright tp acanthophora provide summed percent cover which is a variable
#made it so that all the types of species were under their own column with the coorelating percent cover
#tried pivot_wider but then remembered that we didn't want to make the data wider with specifying columns with the coorelating species 
#percent_cover (found on google search) "method of determining relative abundance based on the amount of space they take up"
  separate(date, c("Month", "Year")) %>%
#separated by month then year
#thought I would need more code written, but used ?separate and stated that if you just want to separate the second variable to do separate(x, c(NA, "B"))
  mutate(Month = str_replace_all(Month, c("Sep" = "September", "Nov" = "November", "Feb" = "February"))) %>%
#wrote the full months for my sanity  
  mutate(Year = str_replace_all(Year, c("13" = "2013", "14" = "2014"))) -> tidied_exclosure_cover
#wrote it in the proper year format

tidied_exclosure_cover

plot_bites %>%
  #the treatment can be left alone since mutual with all other data sets
  separate(date, c( "Month", "Year")) %>%
  mutate(Month = str_replace_all(Month, c("Sept" = "September", "Nov" = "November", "Feb" = "February", "Jul" = "July"))) %>%
#wrote the full months for my sanity  
  mutate(Year = str_replace_all(Year, c('13' = "2013", "14" = "2014"))) -> tidied_plot_bites
#wrote it in the proper year format

tidied_plot_bites

recruitment 
#does not need tidying

tidied_algal_diversity %>%
  left_join(tidied_coral_growth) %>%
  left_join(tidied_exclosure_cover) %>%
  left_join(recruitment) -> treatment_results_tibble
#leftjoined all data

treatment_results_tibble

# Export the data sets to two correctly-named CSV files (see instructions!) here --------------

write_csv(treatment_results_tibble, path = "/cloud/project/datascience_midterm/greene_madeline/treatment_results.csv" )
write_csv(tidied_plot_bites, path = "/cloud/project/datascience_midterm/greene_madeline/plot_bites.csv")
