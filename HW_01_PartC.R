# IBIO/PLB/ENT 830
# Homework 1 Part C (Data Wrangling in Base R)

# For each statement, provide R code that gives the correct answer when the code is run
# HW grading is based on the correctness of the answer produced from the code for each statement
      # For example, if instructed to create an object called my_object containing the phrase "MSU EEB is the best!", 
            # show the code to create the object and call the object to show its contents:
            my_object <- "MSU EEB is the best!"
            my_object 
            # then you get full credit!


# Clear all objects from the environment.
 rm(list=ls())

# Check your current working directory.
getfwd()
list.files()
# Change your working directory using setwd() to any folder on your computer.
setwd("C:/Users/charl/Documents/IBIO 830 R DIRECTORY")
            
# Confirm that the working directory has changed.
getwd()
list.files()            
# In the Files tab of RStudio, navigate to a folder of your choice and set it as the working directory.
# This is a manual change so no code is needed

# Confirm again that the working directory has changed.
getwd()
list.files

# Create a character vector named animals with values "cat", "dog", "iguana", "parrot".
animals <- c("cat","dog","iguana","parrot")
animals
# Convert all values of animals to upper case in a new object called animals2.
animals2 <- toupper(animals)
animals2
# Convert all values of animals to lower case.
animals <- tolower(animals)
animals

# Use paste() to combine each animal name with the word "species" into a new vector.


# Extract the first three characters of each element of animals.


# Count the number of characters in each element of animals.


# Replace all "a" with "A" in the animals vector.

# Identify which elements of animals contain the letter "o".

# Subset only the elements of animals that contain "o".

# Create a vector called weights with values 12, NA, 18, NA, 25.

# Find which elements of weights are missing.

# Calculate the mean of weights while ignoring missing values.

# Remove all missing values from weights.

# How many elements are left after removing missing values?

# Create a factor vector named sizes with values "small", "medium", "large", "small".

# What are the levels of sizes? (use code to show answer)

# Convert sizes into an ordered factor with the order: "small", "medium", "large".

# Extract the second element of sizes.

# Create a list called mylist that contains:
# a) the vector animals
# b) the vector weights
# c) the factor sizes

# Extract the second element of mylist.

# Extract the third element of mylist and convert it to character.

# Add a new element called note with value "practice complete" to mylist.

# Use the $ operator to extract note from mylist.

# Clear all objects from the environment.
 
# Import "juncos.csv" created in 02.2_Data_Wrangling.R as a new object named df2.
 
# What are the dimensions of df2?
 
# Extract the names of the columns in df2.
 
# Load the list object y you created in the lecture for 02.1_Data_Structures.R from "Our_list.RData".
 
# What are the names of the objects stored inside y?

# Extract the element of y called "city".
 
# Extract the third row of the dataframe stored inside y.
 
# Add a new element to y that contains the vector c("yes","no","maybe").



