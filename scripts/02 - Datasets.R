# 📋 Demo datasets ####
library(help = "datasets") # List all datasets included in base R
data(iris) # Load the "iris" dataset

library(help = "MASS") # List all functions and datasets included in MASS
library("MASS") # Load MASS package
data(package = "MASS") # Show all datasets available in MASS
data("cats") # Load the "cats" dataset
data("cats", package = "MASS") # Load the "cats" dataset without loading entire package

library(help = "ggplot2") # List all functions and datasets included in ggplot2
library(ggplot2) # Load ggplot2 package
data(diamonds) # Load "diamonds" dataset for visualization
data("diamonds", package = "ggplot2") # Load the "diamonds" dataset without loading entire package

# 📁 Output directory ####
output_dir <- "C:/Users/rhile/Desktop/LearnR/datasets" # Set base output folder
dir.create(output_dir, showWarnings = FALSE) # Create folder if it doesn't exist (optional)

# 📤 Export dataset to TXT ####
write.table(iris, # Use the "iris" dataset
            file = file.path(output_dir, "iris_tab.txt"), # Set output file path
            sep = "\t", # Use tab as column separator
            row.names = FALSE, # Do not include row names
            quote = FALSE) # Do not use quotes around text values

write.table(iris, # Use the "iris" dataset
            file = file.path(output_dir, "iris_comma.txt"), # Set output file path
            sep = ",", # Use comma as column separator
            row.names = FALSE, # Do not include row names
            quote = FALSE) # Do not use quotes around text values

write.table(iris, # Use the "iris" dataset
            file = file.path(output_dir, "iris_semicolon.txt"), # Set output file path
            sep = ";", # Use semicolon as column separator
            row.names = FALSE, # Do not include row names
            quote = FALSE) # Do not use quotes around text values

# 📤 Export dataset to CSV ####
write.csv(iris, # Use the "iris" dataset
          file = file.path(output_dir, "iris_comma.csv"), # Set output file path
          row.names = FALSE, # Do not include row names
          quote = FALSE) # Do not use quotes around text values

write.csv2(iris, # Use the "iris" dataset
           file = file.path(output_dir, "iris_semicolon.csv"), # Set output file path
           row.names = FALSE, # Do not include row names
           quote = FALSE) # Do not use quotes around text values

# 📤 Export dataset to XLSX/XLS ####
packages_list <- c("openxlsx", "xlsx") # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}

openxlsx::write.xlsx(iris,  # Load "openxlsx" package (recommended) and use the "iris" dataset
                     file = file.path(output_dir, "iris_openxlsxlib.xlsx")) # Set output file path

xlsx::write.xlsx(iris, # Load "xlsx" package and use the "iris" dataset
                 file = file.path(output_dir, "iris_xlsxlib.xlsx")) # Set output file path

xlsx::write.xlsx(iris, # Load "xlsx" package and use the "iris" dataset
                 file = file.path(output_dir, "iris_xlsxlib.xls")) # Set output file path


# 📥 Import dataset from TXT ####
df_iris_tab_txt_local <- read.table(
  file = "C:/Users/rhile/Desktop/LearnR/datasets/iris_tab.txt", # Local path
  header = TRUE, # Column names in first row
  sep = "\t", # Tab separator
  dec = "."  # Decimal point
)

df_iris_tab_txt_github <- read.table(
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_tab.txt", # Public GitHub raw URL (can be read directly)
  header = TRUE, # Column names in first row
  sep = "\t", # Tab separator
  dec = "."  # Decimal point
)

df_iris_comma_txt_github <- read.table(
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_comma.txt", # Public GitHub raw URL (can be read directly)
  header = TRUE, # Column names in first row
  sep = ",", # Comma separator
  dec = "."  # Decimal point
)

df_iris_semicolon_txt_github <- read.table(
  "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_semicolon.txt", # Public GitHub raw URL (can be read directly)
  header = TRUE, # Column names in first row
  sep = ";", # Semicolon separator
  dec = "."  # Decimal point
)

# 📥 Import dataset from CSV ####
df_iris_comma_csv_github <- read.csv(
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_comma.csv", # Public GitHub raw URL (can be read directly)
  header = TRUE, # Column names in first row
  sep = ",", # Comma separator
  dec = "."  # Decimal point
)

df_iris_semicolon_csv_github <- read.table(
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_semicolon.csv", # Public GitHub raw URL (can be read directly)
  header = TRUE, # Column names in first row
  sep = ";", # Semicolon separator
  dec = "."  # Decimal point
)

# Note: use read.csv2() if sep = ";" and dec = "," (European format)

# 📥 Import dataset from XLSX/XLS ####
packages_list <- c("readxl") # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}

df_iris_openxlsxlib_xlsx_local <-  readxl::read_excel(
  path = "C:/Users/rhile/Desktop/LearnR/datasets/iris_openxlsxlib.xlsx", # Local path
  col_names = TRUE  # Column names in first row
)

df_iris_openxlsxlib_xlsx_github <- local({
  tmp <- tempfile(fileext = ".xlsx") # Temporary file
  download.file(
    url = "https://github.com/EasySportsApps/LearnR/raw/main/datasets/iris_openxlsxlib.xlsx", # Public GitHub raw URL (needs download first)
    destfile = tmp, # Save to temporary file
    mode = "wb" # Write in binary mode
  )
  readxl::read_excel(
    path = tmp,       # Read the XLSX from temporary file
    col_names = TRUE  # Column names in first row
  )
})

df_iris_xlsxlib_xls_github <- local({
  tmp <- tempfile(fileext = ".xls") # Temporary file
  download.file(
    url = "https://github.com/EasySportsApps/LearnR/raw/main/datasets/iris_xlsxlib.xls", # Public GitHub raw URL (needs download first)
    destfile = tmp, # Save to temporary file
    mode = "wb" # Write in binary mode
  )
  readxl::read_excel(
    path = tmp,       # Read the XLSX from temporary file
    col_names = TRUE  # Column names in first row
  )
})
df_iris_xlsxlib_xls_github <- df_iris_xlsxlib_xls_github[, -1] # Remove the first column