# IBIO/PLB/ENT 830
# R Essentials
# Data Structures: scalars, vectors, matrices, data frames, and lists

# Topics covered
  # Setting the working directory
  # Vectors
  # Matrices
  # Dataframes
  # Extracting data using [ ] and $
  # Lists
  # Exporting objects and importing files


# Type in your own versions of the code examples yourself
# Passively following along won't build your R muscles.

######### SETTING THE WORKING DIRECTORY ######### 

# Check current working directory and files within it
getwd() 
list.files()

# Options for setting the working directory

# OPTION 1: Use the drop down menu (Session -> Set Working Directory -> Choose Directory)
# works for current session only; no record made
getwd()
list.files()

# OPTION 2: From the files pane (default location is bottom right of RStudio)
# Navigate to a folder, click on the gear icon for settings, choose 'Set as working directory'
# works for current session only; no record made
getwd()
list.files()

# OPTION 3: Use the function setwd() to specify the path 
# works for current session only
# for replicability include code at the start of a script 
setwd("/Users/beaudrot/Documents/Michigan State/Teaching/IBIO 830/IBIO 830 Statistical Methods Fall 2026/Class R Files")
list.files()


######### VECTORS ######### 
# A scalar is an object with a single element (i.e. value)
# A vector is a collection of values of the same type of data. 
# There are multiple types of vectors, including numeric, logical, character, factor, and ordered factor

# A numeric vector:
a <- c(67, 52, -7.4, 0.006, -2, 4)
a

# A logical vector:
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE) 

# Capitalization matters for logical values
true
TRUE

# A character vector:
tree <- c("oak", "elm", "pine", "willow", "maple", "dogwood")
tree

# Recall we can use vectors as input in functions:
a
length(a)
mean(a)
max(a)
quantile(a)


# We can ask questions about vectors to make sure R interprets the data the way we want:
a
is.numeric(a)
class(a)

c
is.numeric(c)
is.logical(c)
class(c)

tree
is.numeric(tree)
is.logical(tree)
is.character(tree)
class(tree)


# Factor (i.e., category) vector:
f <- c("allele", "gene", "chromosome")
class(f)
f

# R will interpret text as character strings by default. Categories have to be assigned as factors.
# A character vector can be converted to a factor vector using as.factor()
f <- as.factor(f)
f # Factors to not have quotation marks
is.factor(f)
class(f)

# A vector can be created as a factor vector using factor()
f1 <- factor(c("plant", "microbe", "animal"))
f1

# An ordered factor (i.e., ordered category) vector can be created using ordered():
f2 <- ordered(c("small", "medium", "large"))
f2

# Beware that R defaults to alphabetical order
# Use the levels argument to assign the preferred order for categories: 
?ordered
f2 <- ordered(c("small", "medium", "large"), levels=c("small", "medium", "large"))

is.factor(f2)
is.ordered(f2)
class(f2)


# Your turn now:
#1a Create a vector named my_vec that has a sequence of numbers from 10 to 1 by twos
#1b What is the class of the vector?
#1c What is the mean value?
#2a Create another vector named my_vec2 that has the name of the country, state and city where MSU is.
#2b Is my_vec2 numeric? 
#2c How many elements are in the vector?



########## EXTRACTING ELEMENTS USING SQUARE BRACKETS [ ] ######### 
a
a[3]

tree
tree[2:4]
tree[c(2, 3, 4)]
tree[c(2, 3, 6)]

g <- c(3:21)
g
sample <- c(1, 5, 8)
g[sample]
g[c(1, 5, 8)]

# Drop values using brackets [ ]:
tree
tree[-2]
tree[-4]
tree[-length(tree)]


# Your turn now:
# Drop the last element from my_vec
# Subset the second and third elements from my_vec2




######### MATRICES ######### 
# A matrix is a two dimensional structure of a single data type

# This code generates 5 x 4 numeric matrix:

y <- matrix(1:20, nrow = 5, ncol = 4)
y

# another example
cells <- c(5, 65, -4, 2000)
cells
mymatrix <- matrix(cells, nrow = 2, ncol = 2)
mymatrix
mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow=TRUE)
mymatrix

#name the rows, columns
rnames <- c("R1", "R2")
cnames <- c("C1", "C2") 
mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE,
                   dimnames = list(rnames, cnames))
mymatrix



# We can identify elements, rows, columns, and subsets of a matrix as with vectors, 
# but now we need to give R two pieces of information [row, column], rather than just one.

y
y[1, 2]       # element
y[2, ]        # row
y[ ,4]        # column
y[1:3, 3:4]   # subset


# We can apply logical operators to matrices, just like we did to vectors:

y == 13
y != 13
y > 18
#careful!
y = 13
y


# Your turn now:
# Create a matrix of zeros that has 2 rows and 6 columns
# Label the columns a through f
# Label the rows Ra and Rb




##########  DATAFRAMES ######### 
# A dataframe has two dimensions and can contain vectors of different types

# The following vectors contain data on individual daphnia  
# Vector 1: character

genotypes <- c("AA", "Aa", "aa", "Aa", "AA", "Aa", "aa", "Aa", "Aa", "AA")
# Vector 2: integer
eggs_laid <- c(42, 38, 25, 40, 45, 36, 22, 39, 41, 44)
# Vector 3: integer
eggs_hatched <- c(38, 30, 15, 33, 41, 28, 12, 30, 35, 40)
# Vector 4: numeric
body_length_mm <- c(2.1, 2.4, 1.9, 2.3, 2.2, 2.0, 2.5, 1.8, 2.2, 2.3)

# Build a dataframe from the daphnia vectors using the function data.frame
?data.frame
daphnia <- data.frame(genotypes, eggs_laid, eggs_hatched, body_length_mm)
daphnia

# Calculate a new vector for daphnia egg hatching success 
hatch_success <- eggs_hatched / eggs_laid

# Add the new vector hatch_success to the dataframe
daphnia <- data.frame(daphnia, hatch_success)
daphnia


# Change dataframe column names with the function names()
?names
names(daphnia) <- c("Genotype","N_laid","N_hatched", "Length_mm", "Success")
daphnia


# We can produce the same data frame in fewer steps by creating the dataframe, assigning new names, and creating the new vector simultaneously
daphnia_v2 <- data.frame(Genotype=genotypes, N_laid=eggs_laid, N_hatched=eggs_hatched, Length_mm=body_length_mm, Success=eggs_hatched/eggs_laid)

# Check to see if the two dataframes are the same
daphnia_v2
daphnia

# We can identify elements, rows, columns, etc in dataframes just like in matrices and vectors

daphnia[1,2]        # element
daphnia[2, ]        # row
daphnia[ ,4]        # column
daphnia[1:3, 3:4]   # subset


# Your turn now:
# Extract the length in mm from the first observation (i.e., first row of data) using only brackets
#  the hatch success of the last observation (i.e., last row of data) using only brackets
#dim(" general vector" ) can be used to find the dimensions of the dataframe


######### EXTRACTING ELEMENTS USING NAMES WITH $ ##############

# In addition to using [ ] to extract information by indexing, we can use $ to extract information using names
# First examine the structure of the data frame
str(daphnia)

# Extract columns using $ and column names
daphnia$Genotype    # Extracts column named Genotype
daphnia$Success     # Extracts column named Success

# We can apply operators while extracting data
# Extracts body length values greater than 2

daphnia$Length_mm[daphnia$Length_mm > 2] 

# How many daphnia were above the value? Check using length()
length(daphnia$Length_mm[daphnia$Length_mm > 2])

# Extract all data for the daphia observations with body length values above the given value
daphnia[daphnia$Length_mm > 2,] 

# Extract the hatching success for all observations

daphnia$hatch_success   # Null value because column hatch_success does not occur in dataframe
names(daphnia) # Check the name in the dataframe using names() or str()
str(daphnia)
daphnia$Success # Extract hatching success using the correct column name

# Extract rows based on labeled information
daphnia[daphnia$Genotype == "AA", ]                             # Extracts entire row where the Genotype is AA
daphnia[daphnia$Genotype == "AA" | daphnia$Genotype == "aa", ]  # Extracts rows where the Genotype is AA or aa
daphnia[daphnia$Success == 0.6, ]                               # Extracts rows where hatching success is exactly equal to the given value
daphnia[daphnia$Success <= 0.6, ]                               # Extracts rows where hatching success is less than or equal to the given value


# Your turn now:
# Extract the hatching success for the AA genotype
# Extract the hatching success for the aa genotype
# Extract the number of eggs laid for the AA genotype
# Extract the number of eggs laid for the aa genotype
# Do you notice any differences?



########## LISTS ######### 

# Until now, we have been working with "atomic vectors"
# Lists are "generic vectors" and are another way to store data. 
# Lists are a flexible way to store multiple objects that can be different types
    # An element within a list can store any type of R object 
    # Different elements within a list can store different types of objects

?list

list(tree, f2)

y <- list(tree, f2, "x", 1:3,  daphnia)
y
y[[2]]
y[[5]][3, 2]

str(y)
names(y) <- c("tree", "f2", "x", "vec", "daphnia")
str(y)
y

y$f2
y$daphnia[3, 2]

# TO DO 
# A) extract the first object of y 
# B) convert it to upper case 
# C) make this change within y 
# D) add a 6th element of your choice to y


##########  EXPORTING OBJECTS  ######### 

# We can export dataframes or lists to keep them for later in stored file

# Write.table() exports vectors, matrices or dataframes to a file. 
?write.table
write.table(daphnia, "daphnia.txt")

# A common way to export and import data is as a csv file
?write.csv
write.csv(daphnia, "daphnia.csv")

# Use save() to export lists to an R data object for later use in R  
?save
save(y, file="Our_list.RData")

ls()
rm(list=ls())

##########  IMPORTING OBJECTS  ######### 

read.csv(file="daphnia.csv")
daphnia <- read.csv(file="daphnia.csv")

load("Our_list.Rdata")

ls()
str(daphnia)
str(y)
