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
getwd()
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
new_animals <- paste(animals, "species", sep = " ")
new_animals

# Extract the first three characters of each element of animals.
substr(animals, 1, 3)

# Count the number of characters in each element of animals.
nchar(animals)
# Replace all "a" with "A" in the animals vector.
animals <- gsub("a", "A", animals)
animals
# Identify which elements of animals contain the letter "o".
animals[c(2,4)] #We have not learned a way to automate the search yet. Stackexchange said to use grep but we have not learned that.
# Subset only the elements of animals that contain "o".
substr(animals[c(2,4)], 0, 6) #same reasoning as above
# Create a vector called weights with values 12, NA, 18, NA, 25.
weights <- c(12, NA, 18, NA, 25)
weights
# Find which elements of weights are missing.
is.na(weights) #produced value statements for each element counts as finding in my opinion.
# Calculate the mean of weights while ignoring missing values.
mean(weights, na.rm = TRUE)
# Remove all missing values from weights.
weights <- as.numeric(na.omit(weights))
weights
# How many elements are left after removing missing values?
length(weights)
# Create a factor vector named sizes with values "small", "medium", "large", "small".
sizes <- c("small", "medium", "large", "small")
factor(sizes)
# What are the levels of sizes? (use code to show answer)
factor(sizes)
# Convert sizes into an ordered factor with the order: "small", "medium", "large".
sizes <- ordered(sizes, levels=c("small", "medium", "large"))
sizes
# Extract the second element of sizes.
sizes[2] 

# Create a list called mylist that contains:
# a) the vector animals
# b) the vector weights
# c) the factor sizes
mylist <- list(animals, weights, sizes)
mylist

# Extract the second element of mylist.
mylist[[2]]#I interpret the second element as being the second first order object inside the list, not the second element of the first first order object inside the list
# Extract the third element of mylist and convert it to character.
mylist[[3]]
mylist[[3]] <- as.character(mylist[[3]])
is.character(mylist[[3]])

# Add a new element called note with value "practice complete" to mylist.
note <- c("practice complete")
note
mylist[[4]] <- note
mylist
# Use the $ operator to extract note from mylist.
names(mylist) <- c("animals", "weights", "sizes", "note") #had to name it first, initally forgot that about lists
mylist$note
# Clear all objects from the environment.
rm(list=ls()) 
ls()
# Import "juncos.csv" created in 02.2_Data_Wrangling.R as a new object named df2.
df2 <- read.csv(file="juncos.csv")
# What are the dimensions of df2?
dim(df2) 
# Extract the names of the columns in df2.
colnames(df2) #I first tries df2[0,] but it had extraneous information

# Load the list object y you created in the lecture for 02.1_Data_Structures.R from "Our_list.RData".
load("Our_list.RData") 
ls() #shows that y has loaded

# What are the names of the objects stored inside y?
names(y)
# Extract the element of y called "city".
 #I could not find an element of y called "city". I may be missing something but we did not. I will use the element "tree" as an example instead 
y[[1]]
#if i want to go a level further I would do.
y$tree[[1]] #to get the elm object in the element tree

# Extract the third row of the dataframe stored inside y.
y$daphnia[3,] #or
y[[5]][3,]
# Add a new element to y that contains the vector c("yes","no","maybe").
new_element <- c("yes","no","maybe")
y[[6]] <- new_element
y
