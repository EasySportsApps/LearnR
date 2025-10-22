# 📝 Integer number (integer) ####
a <- 5L # Assign the integer value 5 to variable "a" (L suffix indicates integer)
class(a) # Check the data type of "a"
print(a) # Print the value of "a" (preserves its integer type)

# 🔢 Real numbers (numeric) ####
a <- 5     # Assign the numeric value 5 to variable "a" (default double precision)
b <- 5.5   # Assign the numeric value 5.5 to variable "b"
c <- 5.55  # Assign the numeric value 5.55 to variable "c"
sapply(c(a, b, c), class) # Check the data type of each variable
print(c(a, b, c)) # Print all numeric values
cat(paste(a, b, c)) # Concatenate and print all numeric values as text in one line

# 🔤 Text strings (character) ####
a <- "Hello" # Assign the string "Hello" to variable "a" using double quotes
b <- 'World' # Assign the string "World" to variable "b" using single quotes
c <- "123"   # Assign the string "123" to variable "c" (looks numeric but stored as text)
sapply(c(a, b, c), class) # Check the data type of each variable
print(c(a, b, c)) # Print all string values
cat(paste(a, b, c)) # Concatenate and print all string values as text in one line

# ✅ Logical values (logical) ####
a <- 5 == 5 # Assign TRUE if 5 equals 5 to variable "a"
b <- 5 < 3  # Assign FALSE if 5 is less than 3 to variable "b"
sapply(c(a, b), class) # Check the data type of each variable
print(c(a, b)) # Print all logical values
cat(paste(a, b)) # Concatenate and print all logical values as text in one line

# 🏷️ Factor (factor) ####
sex_num_vector <- c(0, 0, 1, 1) # Create a numeric vector
sex_factor <- factor(sex_num_vector, levels = c(0, 1), labels = c("F", "M")) # Convert the numeric vector to a factor with custom labels
sex_factor # Display the factor values
class(sex_factor) # Check the data type

sex_chr_vector <- c("F", "F", "M", "M") # Create a character vector
sex_factor <- factor(sex_chr_vector, levels = c("F", "M"), labels = c("Female", "Male")) # Convert the character vector to a factor with descriptive labels
sex_factor # Display the factor values
class(sex_factor) # Check the data type

sex_chr_vector <- c("F", "F", "M", "M") # Create a character vector
sex_factor <- factor(sex_chr_vector) # Convert the character vector to a factor using default levels from the data
sex_factor # Display the factor values
class(sex_factor) # Check the data type

library("MASS") # Load the "MASS" package
data("birthwt") # Load the "birthwt" dataset
birthwt$race # Display the values in the "race" column
class(birthwt$race) # Check the data type of the "race" column (integer)
birthwt$race <- factor(birthwt$race) # Convert the "race" column to a factor using default levels from the data
birthwt$race # Display the values in the "race" column
class(birthwt$race) # Check the data type of the "race" column (factor)
birthwt$race <- factor(birthwt$race, levels = c(1, 2, 3), labels = c("White", "Black", "Other")) # Assign descriptive labels to the factor levels
head(birthwt$race) # Display the first values in the "race" column
class(birthwt$race) # Confirm the data type of the "race" column (factor)

