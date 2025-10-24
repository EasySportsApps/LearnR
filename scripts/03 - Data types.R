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

# 🏷️ Categorical data (factor) ####
sex_num_vector <- c(0, 0, 1, 1) # Create a numeric vector
sex_factor <- factor(sex_num_vector) # Convert the character vector to a factor using default levels from the data
sex_factor # Display the factor values
class(sex_factor) # Check the data type

sex_chr_vector <- c("F", "F", "M", "M") # Create a character vector
sex_factor <- factor(sex_chr_vector) # Convert the character vector to a factor using default levels from the data
sex_factor # Display the factor values
class(sex_factor) # Check the data type

sex_num_vector <- c(0, 0, 1, 1) # Create a numeric vector
sex_factor <- factor(sex_num_vector, levels = c(0, 1), labels = c("F", "M")) # Convert the numeric vector to a factor with custom labels
sex_factor # Display the factor values
class(sex_factor) # Check the data type

sex_chr_vector <- c("F", "F", "M", "M") # Create a character vector
sex_factor <- factor(sex_chr_vector, levels = c("F", "M"), labels = c("Female", "Male")) # Convert the character vector to a factor with custom labels
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

# ❌ Missing values (NA) ####
packages_list <- c("ggplot2", "naniar", "visdat") # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}

var1 <- c(2, 3, 5, 4) # Create a numeric vector
var2 <- c("a", NA, "c", NA) # Create a character vector with missing values (NA)
df <- data.frame(var1, var2) # Combine vectors into a data frame
df # Display the data frame
table(is.na(df)) # Count TRUE (NA) and FALSE (not NA) values in the entire data frame
colSums(is.na(df)) # Count missing values in each column
naniar::gg_miss_var(df) # Visualize missing values
visdat::vis_miss(df) + # Visualize missing values
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10)) # Rotate x-axis labels for better display
df[complete.cases(df), ] # Display the data frame without rows containing any NA
df_na <- na.omit(df) # Create a new data frame excluding all rows with NA
df_na # Display the cleaned data frame

