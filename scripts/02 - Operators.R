# 📝 Assignment operators (<-, =) ####
num1 <- 7 # Assign the value 7 to the variable "num1"
num2 = 3  # Assign the value 3 to the variable "num2"
mass_kg <- 89.9 # Assign the value 89.9 to the variable "mass_kg"
height_m <- 1.91 # Assign the value 1.91 to the variable "height_m"
# Note: '<-' shortcut in RStudio: Alt + - (Windows)



# ➕ Arithmetic operators (+, -, *, /, ^) ####
num1 + num2 # Addition
sum(num1, num2) # Sum function
num1 - num2 # Subtraction
num1 * num2 # Multiplication
num1 / num2 # Division
num1 %/% num2 # Integer division
num1 %% num2 # Remainder (modulus)
num1^2 # Exponentiation (power)
BMI <- mass_kg / (height_m^2) # BMI calculation
BMI



# 🔢 Relational operators (==, !=, <, <=, >, >=) ####
num1 == num2 # Check if "num1" is equal to "num2"
num1 != num2 # Check if "num1" is not equal to "num2"
num1 < num2 # Check if "num1" is less than "num2"
num1 <= num2 # Check if "num1" is less than or equal to "num2"
num1 > num2 # Check if "num1" is greater than "num2"
num1 >= num2 # Check if "num1" is greater than or equal to "num2"



# ⚡ Logical operators (&, |, !) ####
num1 == num2 & num1 > num2 # AND operator: returns TRUE if both values are TRUE, otherwise FALSE
num1 == num2 | num1 > num2 # OR operator: returns TRUE if at least one value is TRUE, otherwise FALSE
!num1 == num2 # NOT operator: inverts the logical value of the boolean



# 📊 Functions associated with operators ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages("MASS") # Execute the custom function to check, install, and load all required packages
data("birthwt", package = "MASS") # Load the "birthwt" dataset
min(birthwt$age) # Minimum age of the mothers
max(birthwt$age) # Maximum age of the mothers
max(birthwt$age) - min(birthwt$age) # Age range of the mothers
birthwt$bwt[birthwt$age == max(birthwt$age)] # Birth weight of the baby with the oldest mother
birthwt$smoke[birthwt$bwt == min(birthwt$bwt)] # Smoking habit of the mother of the baby with the lowest birth weight
birthwt$bwt[birthwt$ftv == 3] # Birth weights of babies whose mothers had 3 physician visits