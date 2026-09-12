# IBIO/PLB/ENT 830
# R Essentials
# Data Wrangling


# Topics covered:
    # Character string functions (toupper, tolower, unique, substr, nchar, gsub, paste)
    # Missing values (NA)  
    # Base R data wrangling functions (table, sort, tapply, aggregate, match, merge)


# Clear objects in environment
rm(list=ls())

# Build a dataframe called juncos using the following vectors with observations from a field study on bird vigilance
flock_type <- c("solitary", "pair", "flock", "flock", "solitary", "pair", "flock", "solitary", "flock", "pair")
scans <- c(28, 21, NA, 10, 31, 19, 14, NA, 11, 22)
time_observed_sec <- c(300, 300, 240, 300, 270, 300, 300, 240, 300, 270)
body_mass_g <- c(11.2, 12.1, 11.8, NA, 10.9, 11.6, 12.0, 11.1, 12.3, 11.7)
bird_id <- c("KBS-101", "KBS-102", "LUX-201", "LUX-202", "KBS-103", "ROSE-301", "LUX-203", "ROSE-302", "KBS-104", "ROSE-303")
species <- c("Junco hyemalis", "junco hyemalis", "Junco Hyemalis", "junco hyemalis", "Junco hyemalis", "junco Hyemalis",
             "Junco hyemalis", "JUNCO HYEMALIS", "junco hyemalis", "Junco hyemalis")
observer <- c("mwb", "mwb", "ljb", "ljb", "mwb", "ejr", "ljb", "ejr", "mwb", "ejr") 
obs_date <- c("2026_08_12", "2026_08_12", "2026_08_13", "2026_08_13", "2026_08_14", "2026_08_14", "2026_08_15", "2026_08_15",
              "2026_08_16", "2026_08_16") # Date recorded on datasheets

juncos <- data.frame(flock_type, scans, time_observed_sec, body_mass_g, bird_id, species, observer, obs_date)
juncos

# Notes on junco data
# Note missing value (NA) in scans when observation was cut short before scans could be counted
# Note missing value (NA) in body_mass_g when bird escaped before it could be weighed
# Bird IDs are site code, hyphen, band number; site code ROSE is longer than KBS and LUX
# Observer contains observer initials
# Species names were entered by different field assistants


# WRANGLING CHARACTER STRINGS
# Let's clean up these data!

# A) Observer initials should be uppercase for the final dataset

      # Change strings to upper case using to.upper()
      ?toupper
      toupper(juncos$observer)
      
      # Overwrite the observer column in the dataframe with the cleaned version
      juncos$observer <- toupper(juncos$observer)
      juncos$observer
      
      # tolower() goes the other direction
      tolower(juncos$observer)
      tolower(juncos$bird_id)
      
      # How many unique species do we have? R thinks five!
      # unique() returns a vector with duplicates removed
      unique(juncos$species)
      length(unique(juncos$species))
      
      # duplicated returns a logical vector indicating which elements are duplicates
      duplicated(juncos$species)
      sum(duplicated(juncos$species))
      
      # How many observations do we have of these "unique" species?
      # table() gives counts for each 
      table(juncos$species)


# B) Clean species names so they are all the same
      
      # Step 1: make the species names all lowercase
      juncos$species <- tolower(juncos$species)
      table(juncos$species)
      
      # Step 2: capitalize the genus using substr() 
      # substr() extracts characters by position: substr(x, start, stop)
      
      # Pull the first character of each species name
      substr(juncos$species, 1, 1)
      
      # substr() can also REPLACE characters:
      # capitalize the genus in place
      substr(juncos$species, 1, 1) <- "J"
      juncos$species
      table(juncos$species) # Now there is only a single species name


# C) Clean the bird IDs so that they all have the same number of characters

      # nchar() counts characters in each string
      juncos$bird_id
      nchar(juncos$bird_id)
      
      # Extract the first three letters of the site code
      substr(juncos$bird_id, 1, 3)

      # Next extract the band number, which is the last three letters of the bird ID
      substr(juncos$bird_id, nchar(juncos$bird_id) - 2, nchar(juncos$bird_id))
      
      # Combine the first three letters of the site code with the band number using paste()
      # paste() combines 2 or more vectors into a single character vector with a separator (sep)
      
      juncos$bird_id <- paste(substr(juncos$bird_id, 1, 3),
                              substr(juncos$bird_id, nchar(juncos$bird_id) - 2, nchar(juncos$bird_id)),
                              sep = "")
      nchar(juncos$bird_id)
      
      # Remove the hyphen from bird IDs entirely using gsub()
      # gsub() finds and replaces patterns: gsub(pattern, replacement, x)
      juncos$bird_id <- gsub("-", "", juncos$bird_id)

      # Convert the underscore dates to hyphenated dates
      gsub("_", "-", juncos$obs_date)
      juncos$obs_date <- gsub("_", "-", juncos$obs_date)
      juncos$obs_date      

# Export the cleaned junco data so they are saved in a .csv file for future use using write.csv
?write.csv
write.csv(x = juncos, file="juncos.csv")

# Your turn now: 
# Use gsub() to 
      # Replace "flock" as "group" in flock_type
      # Convert the underscore in observation dates to hyphenated dates
# Create a new column called birdID.date containing the bird id and observation date separated by a period
      # Do all observations have the same number of characters?
      # Are all observations unique?
      
      
###### WORKING WITH MISSING DATA #########
# Missing values are represented by NA
NA
      
# Many functions executed with data containing NAs will return NA instead of a solution
juncos$body_mass_g
max(juncos$body_mass_g)

juncos$scans
range(juncos$scans)

# is.na() shows you whether a value for each element is missing
is.na(juncos$scans)
      
# sum(is.na()) tells you how many missing values there are
sum(is.na(juncos$scans))

# Options for using functions with data containing NAs:

      # Tell an individual function to ignore NAs using the na.rm argument
      mean(juncos$scans, na.rm = TRUE)
      
      # Use na.omit() to remove NAs from a vector
      na.omit(juncos$scans)
      mean(na.omit(juncos$scans))
      
          # Beware that for dataframes, na.omit() drops every ROW containing an NA
          na.omit(juncos)
          nrow(juncos)
          nrow(na.omit(juncos))
          # Removes 3 entire rows of data because of two observations missing scans and one missing body mass
          # In general, avoid throwing out data!

# Add a new column on vigilance that contains the per minute scanning rate for each junco
juncos$scan_rate <- juncos$scans/(juncos$time_observed_sec/60)
juncos$scan_rate

# Why does scan_rate having missing values?
# Did missing values in the input vectors cause a problem? 


# Before we move to the next dataset, clear all objects from your environment
ls()
rm(list=ls())
ls()


###############  IMPORTING DATA ############## 
# Typically we want to read data directly in from a file rather than creating it by hand in a script. 
# R can read in various file types; .csv is a very commonly used file type. 
?read.csv

# We will use two supplementary data files from Beaudrot et al. 2016 Plos Biology 
# "Standardized assessment of biodiversity trends in tropical forest protected areas: the end is not in sight"
    # "PlosBiology_TableS2_Class.csv"
    # "PlosBiology_TableS1_Class.csv"

setwd("/Users/beaudrot/Documents/Michigan State/Teaching/IBIO 830/IBIO 830 Statistical Methods Fall 2026/Class R Files/data")
list.files()

# Load data on the status of 510 tropical mammal and bird populations
pop <- read.csv(file="PlosBiology_TableS2_Class.csv")
str(pop)
head(pop)

# Load data on the 15 tropical forest protected areas
PA <- read.csv(file="PlosBiology_TableS1_Class.csv")
str(PA)
head(PA)


############## DATA WRANGLING IN BASE R using table, sort, tapply, aggregate, match, and merge) #############

# Before we ever run any statistical analysis, we must EXPLORE THE DATA!
# The published data are already clean (hooray)
# We can use handy data wrangling functions to get to know the data


######## TABLE: The function table() is simple and it is very useful for getting to know sample sizes within a dataset
?table

# Use the table() function to generate a FREQUENCY TABLE with counts of observations for each category
# By default, table counts are ordered alphabetically 

# In these data, each observation is a population
table(pop$Class) # Population counts for birds and mammals
table(pop$RLS) # Number of populations for each IUCN Red List status 

# We can sort a table to make the info easier to interpret quickly
sort(table(pop$RLS)) # Default sorting is by increasing counts
sort(table(pop$RLS), decreasing=TRUE) # Sorts by decreasing counts
sort(table(pop$Diet), decreasing=TRUE) # Number of populations for each dietary guild
sort(table(pop$Status), decreasing=TRUE) # Number of populations significantly increase or decreasing, "stable", or unknown
sort(table(pop$Hunted), decreasing=TRUE) # Number of populations hunted, not-hunted, or hunting status unknown
sort(table(pop$Site), decreasing=TRUE) # Population counts for the study site

# Use the table() function to generate a CONTINGENCY TABLE, 
# which shows how observations are distributed along a variable, 
# contingent on the value of another variable 
table(pop$Diet, pop$Class)
table(pop$Site, pop$Class)

# table() can create a contingency table using multiple variables
table(pop$Diet, pop$Site, pop$Class)
table(pop$Diet, pop$Class, pop$Site)

# Each observation (i.e., row of data) is only included in the contingency table once
sum(table(pop$Diet, pop$Class, pop$Site)) # Calculate the total observations in the table
dim(pop) # Compare to the number of rows of data)

# TO: a) Create a contingency table showing the number of hunted species per site
# b) Create a contingency table separately for birds and mammals showing the 
# population status for each IUCN Red List Status (i.s., RLS) in descending order; 
# how to the values compare to the default values without sorting?




######## TAPPLY: tapply() is a more generalizable function because it can provide more than counts
# It acts on multiple groups at once and can apply the function of your choice
# It is a member of the APPLY family of functions (apply, tapply, lapply, sapply, etc.)
?tapply

# We can use tapply to make a table
tapply(pop$Diet, pop$Class, table)

# And importantly using tapply() we can use many other functions for multiple groups
# (e.g., min, median, range, var, sd, etc.)

# Calculate the mean trend for birds v. mammals
tapply(pop$Slope, INDEX=pop$Class, FUN=mean)
# Calculate their summary statistics 
tapply(pop$Slope, INDEX=pop$Class, FUN=summary)

# Calculate the mean population trend based on population status
tapply(pop$Slope, INDEX=pop$Status, FUN=mean)
# Calculate their summary statistics
tapply(pop$Slope, INDEX=pop$Status, FUN=summary)

# Calculate the average percent of populations declining in each region
tapply(PA$Decrease.Per, INDEX=PA$Region, FUN=mean)

# TO: a) Create a contingency table showing the number of hunted species per site



######## AGGREGATE: the function aggregate() can summarize multiple columns at once
?aggregate

# Calculate the mean percent of populations declining in each type of landscape
aggregate(PA[,8:19], list(PA$Landscape), mean)

# Calculate the mean site-level percent of populations declining in each region
aggregate(PA[,8:19], list(PA$Region), mean)

# Save summarized output as an object for later use in plottings
Region.means <- aggregate(PA[,8:19], list(PA$Region), mean)
rownames(Region.means) <- Region.means$Group.1 # Use first columan as row names
Region.means
Region.means <- Region.means[,-1] # Drop first column



# TO DO: 
# a. Calculate the maximum body size for each hunting status
# b. Calculate the mean and median body size of each mammalian order





# For regression, it's best to have all variables in a data frame
# Our next goal is to create a single object for data analysis that contains all the information in objects pop and PA
# There must be a column in each that contains the same values for us to join them

# Are there any columns that contain the same names? Do they contain the same values?
# Are there any columns with different names in the two data objects but contain the same values?
head(pop)
head(PA)


######## MATCH: The function match() identifies positions of matching elements from the first vector in a second vector
?match

# We can look through the column names ourselves, or have R do the work to find columns they share
match(names(pop), names(PA)) 
# Gives a value for any column number in PA that has a match in pop
# The value give indicates the corresponding column in pop
names(pop)
names(PA)

# We can use the index value to subset the matching name
names(PA)[2]

# When there are many matches we can use the match function to subset the matches
names(PA)[match(names(pop), names(PA))] 

# Check to make sure that the values in the column in both objects correspond 
head(pop$Site)
head(PA$Site)

# If they don't correspond, see if there is another column name with corresponding values
head(PA) 

# We can to join the data in pop and PA using pop$Site and PA$Code and the merge() function



######## MERGE: The function merge() combines data from two dataframes using a column they both have
?merge

plosb <- merge(pop, PA, by.x="Site", by.y="Code", all=TRUE)
names(plosb) # The merged object contains data from both files (i.e., combines population-level data with site-level data)
head(plosb) # The site-level data are repeated for each row (i.e. population)
# The data in plosb are ready for use in a regression now!

# Export the combined data so they are saved in a .csv file for future use
write.csv(plosb, file="plosb_merged_data.csv")


