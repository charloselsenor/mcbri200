# IBIO/PLB/ENT 830
# Homework 1 Part B (Data Structures)

# For each statement, provide R code that gives the correct answer when the code is run
# HW grading is based on the correctness of the answer produced from the code for each statement
# For example, if instructed to create an object called my_object containing the phrase "MSU EEB is the best!", 
        # show the code to create the object and call the object to show its contents:
        my_object <- "MSU EEB is the best!"
        my_object 
        # then you get full credit!


#1 Clear all objects
 
rm(list = ls(all = TRUE))
ls()
#2 Create a vector named A with a length of 6 that contains odd number integer values starting with 3.
 A <- c(seq(from = 3, by = 2, length.out = 6))
 A
#3 Create a vector named B with the same values as A but using a different function 
 B <- rep(3:13, c(1,0,1,0,1,0,1,0,1,0,1))
 B
#4 Multiple B by 3 and save as a new vector called C
C <- c(B*3)
C

#5 Combine objects A and C into a dataframe called D
D <- data.frame(A, C)
D
#6 Extract the second column of D
 D[,2]

#7 Extract the third row of D
 D[3,]

#8 Extract the element of D that equals 33
 D[D == 33]

#9 Extract the element of D that equals 7
 D[D == 7]

#10 How many rows does D have?
 nrow(D)

#11 How many columns does D have?
 ncol(D)

#12 Extract all values of B greater than 7
 B[B > 7]

#13 Extract values of A less than 5 or greater than 11
 A[ A < 5 | A > 11]

#14 Extract values of A greater than 5 and less than 11
 A[A < 11 & A > 5]


#15 What is the mean of A?
 mean(A)

#16 What is the median of B?
 median(B)

#17 What is the difference between the mean of A and the median of B?
 mean(A) - median(B)

#18 Remove row 4 from D
 D[-4]

#19 Generate a vector with a length of 8 that contains the numbers 8, 9, 10, 11 repeated 
 myvector <- c(rep(8:11, length.out = 8))
 myvector

#20 What is the square root of 4096?
 sqrt(4096)
 

#21 What is 7 raised to the power of 7?
 7^7

#22 What is 8 plus 2 times 27 divided by 4?
 (8+2) * (27/4)

#23 Is 4 raised to the power of 3 greater than 27 times 3?
 (4^3) > (27*3)

#24 Is 12 divided by 4 equal to the square root of 9?  
 (12/4) == (sqrt(9))

#25 Create a vector named fam that contains the name of each of your immediate family members
 fam <- c("randy", "abby", "ruthy")
 fam

#26 Create a vector named fam2 that repeats each family member's name 3x in a row
 fam2 <- c(rep(fam, each = 3))
 fam2

#27 Check the names of all objects you have created so far
 ls()

#28 Does this list correspond to the values listed in the "Environment" tab in the upper right quadrant of RStudio?
 #yes(I am not sure if this was a question I was supposed to answer in code?)
        
#29 Remove the object fam2
 rm(fam2)
 ls()

#30 Check the name of all objects you have created again to see if fam2 has been removed
 ls()

#31 What is the length of the vector fam2? 
 lenght(fam2) # this returns "Error: object 'fam2' not found" This makes sense since I
 #just removed it. To find the length I would need to recreate fam2 as done through 
 #typing  fam2 <- c(rep(fam, each = 3)) and then I would need to type length(fam2)

#32 Is fam numeric?
 is.numeric(fam)

#33 Is fam a factor?
 is.factor(fam)

#34 What class is fam?
 clas(fam)

#35 Convert fam2 to a factor
 #I will first be recreating fam2 so that there is something to convert.
 fam2 <- c(rep(fam, each = 3))
 factor(fam2)
#36 Create an object named age that has the age in years for each family member
 
#37 Create an object named work that has each family member's job
 
#38 Create an object named hobby that has each family member's hobby
 
#39 Create an object named hours that has each family members number of weekly hobby hours
 
#40 Combine all family information into a single dataframe called fam_data
 
#41 Rename the columns as name, age, job, hobby, time
 
#42 Check the row names for fam_data using rownames()
 
#43 Assign family members' names as rownames for fam_data using rownames()
 
#44 What are the dimensions of fam_data?

#45 Now remove the column containing family members' names
 
#46 What are the dimensions of fam_data now?
 
#47 Extract row 2 of fam_data for the family member based on the name of their hobby
 
#48 Extract row 3 of fam_data for the family member based on the name of their work
 
#49 Remove the youngest family member and their associate data from fam_data
 
#50 Create a matrix of zeros that has 10 rows and 15 columns called mat
 
#51 Add row names 1-10 and column names "Freshman", "Sophomore", "Junior" to the matrix
 
#52 Repopulation the matrix above with 7s
 
#53 Multiple each row in mat by the value of its row number
 
#54 Create a character vector called species that contains cat, horse, capuchin monkey, blue morpho butterfly, and coral snake. 
# Check to be sure it is a character vector.
 
#55 Create a numeric vector called abundance that contains the numbers 7, 2, 22, 45, 1, 8.
# There are 7 cats, 2 horses, 22 capuchin monkeys, 45 blue morpho butterflies and 1 rattlesnake.
# Check to be sure it is a numeric vector. 
 
#56 Create a number vector called mass that specifies the average mass in kg for each animal in species. 
# Horse = 400 kg, Cat = 10 kg, Rattlesnake = 2.3 kg, Blue morpho = 0.003, Capuchin monkey = 2.7 kg. 
 
#57 Create a dataframe called species_data that has abundance and mass information that corresponds to species. 
 
#58 Extract the coral snake data
 
#59 Create a new column of data in species_data called type that specifies whether each animal is domestic or wild
 
#60 Examine the structure of species_data. Is species_data$type of class character? What class is it?
 
#61  Convert the kg mass measurements into grams. Add a new column to species_data that has weights stored in grams
 
#62 Extract rows of species_data for species with more than 20 individuals
 
#63 Extract rows of species_data for domestic species only
 
#64 Extract rows of species_data for the horse and coral snake
#a) using species data
#b) using mass
#c) using abundance data

#65 Remove the horse observation from the data frame

#66 Using code, show if the type for capuchin monkey is the same as the type for coral snake (TRUE/FALSE)

#67 Using code, show if the mass for capuchin monkey is larger than the mass for cat (TRUE/FALSE)

#68 Create a new data frame called species_data2 that contains all information from species_data twice

#69 Create a new data frame called species_data3 that contains all information from species_data and contains a second row with cat data

#70 Remove the horse data from species_data3 

#71 Identify duplicated rows of data in species_data3
