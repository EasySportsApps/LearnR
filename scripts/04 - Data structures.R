# 📏 Vector (one-dimensional data structure with the same data type) ####
vector1 <- c(1L, 2L, 3L) # Create an integer vector
vector1 # Display the vector
class(vector1) # Check the data type of the vector

vector2 <- seq(from = 4, to = 6, by = 1) # Create a numeric sequence from 4 to 6 with step 1
vector2 # Display the vector
class(vector2) # Check the data type of the vector

vector3 <- rep(x = 7, times = 3) # Create a numeric vector repeating 7 three times
vector3 # Display the vector
class(vector3) # Check the data type of the vector

vector4 <- c("a", "b", "c") # Create a character vector
vector4 # Display the vector
class(vector4) # Check the data type of the vector

combined_vector <- c(vector1, vector2, vector3, vector4) # Combine all vectors into one
combined_vector # Display the combined vector
class(combined_vector) # Check the data type of the combined vector

sum(vector1) # Sum of numeric vector elements
mean(vector2) # Mean of numeric sequence
plot(vector2) # Basic plotting
length(vector4) # Count elements in a character vector

# 📦 List (one-dimensional data structure with mixed data types) ####
vector1 <- c(1, 2, 3, 4) # Create a numeric vector
vector2 <- c("a", "b", "c", "d") # Create a character vector
list1 <- list(vector1, vector2) # Create a list containing vectors of different types
list1 # Display the list
class(list1) # Check the data type of the list
class(list1[[1]]) # Check the data type of the first element of the list
class(list1[[2]]) # Check the data type of the second element of the list

sum(list1[[1]]) # Sum of numeric vector stored in the list
length(list1[[2]]) # Count elements of character vector in the list
list1[[1]] + 10 # Add 10 to each element of numeric vector in the list
paste(list1[[2]], "1", sep = "") # Append "1" to each character element in the list

# 🧮 Matrix (two-dimensional data structure with the same data type) ####
matrix1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 1) # Create a matrix with 3 rows and 1 column
matrix1 # Display the matrix
class(matrix1) # Check the data type of the matrix

matrix2 <- matrix(data = c(4, 5, 6), nrow = 3, ncol = 1) # Create another matrix with 3 rows and 1 column
matrix2 # Display the matrix
class(matrix2) # Check the data type of the matrix

matrix3 <- matrix(data = seq(from = 7, to = 12, by = 1), nrow = 3, ncol = 2) # Create a matrix with 3 rows and 2 columns
matrix3 # Display the matrix
class(matrix3) # Check the data type of the matrix

matrix_cbind <- cbind(matrix1, matrix2, matrix3) # Combine matrices by columns (same number of rows required)
matrix_cbind # Display the combined matrix
class(matrix_cbind) # Check the data type of the combined matrix

matrix_rbind <- rbind(matrix1, matrix2) # Combine matrices by rows (same number of columns required)
matrix_rbind # Display the combined matrix
class(matrix_rbind) # Check the data type of the combined matrix

matrix_flatten <- c(matrix1, matrix2, matrix3) # Flatten all matrices into a single vector
matrix_flatten # Display the flattened vector
class(matrix_flatten) # Check the data type of the flattened object

rowSums(matrix_cbind) # Sum of each row
colMeans(matrix_cbind) # Mean of each column
t(matrix_cbind) # Transpose of a matrix
matrix_cbind * matrix_cbind # Element-wise product

# 🧩 Array (multi-dimensional data structure with the same data type) ####
array1 <- array(data = 1:8, dim = c(2, 2, 2)) # Create a 3D array: 2 rows × 2 columns × 2 layers
array1 # Display the 3D array
class(array1) # Check the data type of the array
dim(array1) # Check the dimensions of the array (rows, columns, layers)

array2 <- array(data = 1:16, dim = c(2, 2, 2, 2)) # Create a 4D array: 2 rows × 2 columns × 2 layers × 2 blocks
array2 # Display the 4D array
class(array2) # Check the data type of the array
dim(array2) # Check the dimensions of the array (rows, columns, layers, blocks)

array_flatten <- c(array1, array2) # Combine and flatten array1 and array2 into a one-dimensional vector
array_flatten # Display the flattened vector
class(array_flatten) # Check the data type of the flattened object

array1[,,1] # Access first layer
array1[,,2] # Access second layer
apply(X = array1, MARGIN = c(1,2), FUN = sum) # Sum across layers
mean(array2) # Mean of all elements in a 4D array

# 🗂️ Dataframe (two-dimensional data structure with mixed data types) ####
set.seed(123) # Reproducible results
n <- 20 # Sample size

id <- seq(from = 1, to = n, by = 1) # Generate ID sequence from 1 to 20
age <- round(x = rnorm(n = n, mean = 30, sd = 5), digits = 1) # Generate 20 ages randomly, normally distributed (mean = 30, SD = 5), rounded to 1 decimal
sex <- factor(sample(x = c(0, 1), size = n, replace = TRUE), levels = c(0, 1), labels = c("Female", "Male")) # Generate 20 random sex values
smoke <- factor(sample(x = c(0, 1), size = n, replace = TRUE), levels = c(0, 1), labels = c("No", "Yes")) # Generate 20 random smoker values
bmi <- round(x = rnorm(n = n, mean = 25, sd = 5), digits = 2) # Generate 20 BMIs randomly, normally distributed (mean = 25, SD = 5), rounded to 2 decimals

df <- data.frame(Id = id, Age = age, Sex = sex, BMI = bmi, Smoke = smoke) # Create dataframe

View(x = df, title = "Dataframe created") # Open dataframe in spreadsheet-style viewer
df # Display entire dataframe in console
head(x = df, n = 5L) # Show first 5 rows
tail(x = df, n = 5L) # Show last 5 rows

str(df) # Show internal structure and variable types
dim(df) # Show number of observations (rows) and variables (columns)
length(df) # Show number of variables
names(df) # Show variable names
class(df) # Show object type

df$Id <- as.integer(df$Id) # Convert Id variable to integer
sapply(X = df, FUN = class) # Show variable types as a vector
lapply(X = df, FUN = class) # Show variable types as a list

summary(df) # Show basic descriptive statistics for all variables
table(df$Sex) # Display frequency table for Sex variable

df[1,] # Access first row of the dataframe
df[,1] # Access first column of the dataframe
df[1,2] # Access value in first row, second column
df$Age[1] # Access first value of Age variable

df_young <- subset(x = df, subset = Age <= 30) # Create a dataframe with only young participants (Age <= 30)
df_young # Display young participants

df_female <- subset(x = df, subset = Sex == "Female") # Create a dataframe with only female observations
df_female # Display female participants

df_young_female <- subset(x = df, subset = Age <= 30 & Sex == "Female") # Create a dataframe with only young female participants
df_young_female # Display young female participants