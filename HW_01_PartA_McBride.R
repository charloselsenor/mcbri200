# IBIO/PLB/ENT 830
# Homework 1 part A (Getting started in R)

# For each statement, provide R code that gives the correct answer when executed
# HW grading is based on the correctness of the answer produced from the code for each statement

# Create a sequence of numbers from 1 to 5
 seq(1:5)

# Create a sequence of numbers from 1 to 50
 seq(1:50)

# Create a sequence of numbers from 50 to 100 in increments of 5.
 seq(50,100,5)

# Assign the sequence to an object named My_sequence
 My_sequence <- c(seq(50,100,5))
 My_sequence

# What is the mean of the sequence? 
 mean(My_sequence)

# What is the median of the sequence?
median(My_sequence)

# Create a sequence of numbers from 1 to 5 that repeats 10 times
 rep(1:5, times = 10)

# Create a repeating sequence of numbers from 7 to 3 that has 44 numbers in it
 rep_len(7:3, 44)

# Assign the repeating sequence from the previous question to an object named My_repeats
My_repeats <- c(rep_len(7:3, 44))
My_repeats

# What is the sum of the 44 numbers from the previous question?
sum(My_repeats)

# What is the log base 10 of 100?
 log10(100)

# Use code to generate a TRUE or FALSE response for a-e:
# a) 10 is less than 20
20 < 20

# b) 400 is greater than 500
400 > 500

# c) the square root of 4 is equal to 1 plus 1
sqrt(4) == (1+1)

# d) the square root of the absolute value of -9 is not equal to 7
sqrt(abs(-9)) != 7

# e) the median of 1:5 is three
median(1:5) == 3

# Create an object called "my_name" that has your full name in it. 
my_name <- c("Charles")
my_name

# Create an object named ZZ that contains the product of 15 and 25
ZZ <- c(15*25)

# Create another object named YY that has the difference of 100 and 20
YY <- c(100-20)

# What is the sum of ZZ and YY?
sum(ZZ,YY)


