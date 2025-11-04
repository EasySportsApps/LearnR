# 📋 Demo datasets ####
library(help = "datasets") # List all datasets included in base R
data(iris) # Load the "iris" dataset

source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages(c("ggplot2", "MASS")) # Execute the custom function to check, install, and load all required packages

library(help = "MASS") # List all functions and datasets included in "MASS" package
data(package = "MASS") # Show all datasets available in "MASS" package
data("cats") # Load the "cats" dataset
data("cats", package = "MASS") # Load the "cats" dataset without loading entire package

library(help = "ggplot2") # List all functions and datasets included in "ggplot2" package
data(package = "MASS") # Show all datasets available in "ggplot2" package
data("diamonds") # Load "diamonds" dataset for visualization
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
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages(c("openxlsx", "xlsx")) # Execute the custom function to check, install, and load all required packages

openxlsx::write.xlsx(iris,  # Load "openxlsx" package (recommended) and use the "iris" dataset
                     file = file.path(output_dir, "iris_openxlsxlib.xlsx")) # Set output file path

xlsx::write.xlsx(iris, # Load "xlsx" package and use the "iris" dataset
                 file = file.path(output_dir, "iris_xlsxlib.xlsx")) # Set output file path

xlsx::write.xlsx(iris, # Load "xlsx" package and use the "iris" dataset
                 file = file.path(output_dir, "iris_xlsxlib.xls")) # Set output file path



# 📥 Import dataset from TXT ####
df_iris_tab_txt_local <- read.table(
  file = file.path(output_dir, "iris_tab.txt"), # Local path
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
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages("readxl") # Execute the custom function to check, install, and load all required packages

df_iris_openxlsxlib_xlsx_local <-  read_excel(
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
  read_excel(
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



# 📤📥 Export/import dataset with rio ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages("rio") # Execute the custom function to check, install, and load all required packages

export(x = iris, # Use the "iris" dataset
       file = file.path(output_dir, "iris_tab.txt"), # Set output file path 
       format = "tsv", # Export dataset to TXT with tab as separator
       row.names = FALSE, # Do not include row names
       quote = FALSE) # Do not use quotes around text values

export(x = iris, # Use the "iris" dataset
       file = file.path(output_dir, "iris_comma.txt"), # Set output file path 
       format = "csv", # Export dataset to TXT with comma as separator
       row.names = FALSE, # Do not include row names
       quote = FALSE) # Do not use quotes around text values

export(x = iris, # Use the "iris" dataset
       file = file.path(output_dir, "iris_semicolon.txt"), # Set output file path 
       format = "csv2", # Export dataset to TXT with semicolon as separator
       row.names = FALSE, # Do not include row names
       quote = FALSE) # Do not use quotes around text values

export(x = iris, # Use the "iris" dataset
       file = file.path(output_dir, "iris_comma.csv"), # Set output file path 
       format = "csv", # Export dataset to CSV with comma as separator
       row.names = FALSE, # Do not include row names
       quote = FALSE) # Do not use quotes around text values

export(x = iris, # Use the "iris" dataset
       file = file.path(output_dir, "iris_semicolon.csv"), # Set output file path 
       format = "csv2", # Export dataset to CSV with semicolon as separator
       row.names = FALSE, # Do not include row names
       quote = FALSE) # Do not use quotes around text values

export(x = iris, # Use the "iris" dataset
       file = file.path(output_dir, "iris_riolib.xlsx"), # Set output file path 
       format = "xlsx", # Export dataset to XLSX
       row.names = FALSE) # Do not include row names

df_iris_tab_txt_local <- import( # Import local TXT dataset with tab as separator 
  file = file.path(output_dir, "iris_tab.txt")
)

df_iris_tab_txt_github <- import( # Import public Github TXT dataset with tab as separator
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_tab.txt"
) 

df_iris_comma_txt_github <- import( # Import public Github TXT dataset with comma as separator
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_comma.txt"
) 

df_iris_semicolon_txt_github <- import( # Import public Github TXT dataset with semicolon as separator
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_semicolon.txt"
) 

df_iris_comma_csv_github <- import( # Import public Github CSV dataset with comma as separator
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_comma.csv"
) 

df_iris_semicolon_csv_github <- import( # Import public Github CSV dataset with semicolon as separator
  file = "https://raw.githubusercontent.com/EasySportsApps/LearnR/refs/heads/main/datasets/iris_semicolon.csv"
) 

df_iris_riolib_xlsx_local <- import( # Import local Github XLSX dataset 
  file = file.path(output_dir, "iris_riolib.xlsx")
) 

df_iris_riolib_xlsx_github <- import( # Import public Github XLSX dataset
  file = "https://github.com/EasySportsApps/LearnR/raw/main/datasets/iris_riolib.xlsx"
) 

df_iris_openxlsxlib_xlsx_github <- import( # Import public Github XLSX dataset
  file = "https://github.com/EasySportsApps/LearnR/raw/main/datasets/iris_openxlsxlib.xlsx"
) 

df_iris_xlsxlib_xlsx_github <- import( # Import public Github XLSX dataset
  file = "https://github.com/EasySportsApps/LearnR/raw/main/datasets/iris_xlsxlib.xlsx"
) 
df_iris_xlsxlib_xlsx_github <- df_iris_xlsxlib_xlsx_github[, -1] # Remove the first column

df_iris_xlsxlib_xls_github <- import( # Import public Github XLS dataset
  file = "https://github.com/EasySportsApps/LearnR/raw/main/datasets/iris_xlsxlib.xls"
) 
df_iris_xlsxlib_xls_github <- df_iris_xlsxlib_xls_github[, -1] # Remove the first column



# 📥 Import dataset from Private GitHub raw URL ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages(c("httr", "rio", "usethis", "stringr", "stringi")) # Execute the custom function to check, install, and load all required packages

# 🔑 Set up GitHub Personal Access Token (PAT) for accessing private repos
# Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) = https://github.com/settings/tokens
# Generate new token (classic) → Note/name: R-access-data → Expiration: No expiration → Select scopes: ✅ repo → Genarate token → Copy the token: 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
edit_r_environ() # Open .Renviron file → Add line: GITHUB_TOKEN=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 → Save file → Restart RStudio
Sys.getenv("GITHUB_TOKEN") # Verify the token is loaded correctly

response <- GET( # Send an HTTP GET request to download the XLSX file from a private GitHub repository
  url = "https://raw.githubusercontent.com/EasySportsApps/LearnR-private/main/TOTAL%20MEDALLERO%20CEU%202024.xlsx", # Direct URL to the raw Excel file in the private repo
  add_headers(Authorization = paste("token", Sys.getenv("GITHUB_TOKEN"))) # Add GitHub personal access token in the authorization header for authentication
)
stop_for_status(response) # Check if the HTTP request was successful; stops execution if there was an error

temp_file <- tempfile(fileext = ".xlsx") # Create a temporary file to store the downloaded XLSX content
writeBin(content(response, "raw"), temp_file) # Write the raw binary content of the response to the temporary file

df_list_raw <- import_list(temp_file) # Import all sheets into a list of dataframes
df_list <- list() # Initialize list to store cleaned dataframes

for (sheet_name in names(df_list_raw)) { # Loop through each sheet in the list
  name_clean <- stri_trans_general(sheet_name, "Latin-ASCII") # Convert accented characters (like Á, Ñ) to ASCII
  name_clean <- tolower(name_clean) # Convert to lowercase
  name_clean <- str_replace_all(name_clean, "[^a-z0-9]", "_") # Replace spaces/non-alphanumeric with underscores
  name_clean <- str_replace_all(name_clean, "_+", "_") # Collapse multiple consecutive underscores
  name_clean <- str_replace(name_clean, "^_|_$", "") # Remove leading/trailing underscores
  df_name <- paste0("df_", name_clean) # Add prefix 'df_'
  df_list[[df_name]] <- df_list_raw[[sheet_name]] # Store dataframe in the cleaned list
  assign(df_name, df_list[[df_name]], envir = .GlobalEnv) # Optionally assign to global environment
}

unlink(temp_file) # Delete the temporary file to clean up and free system resources

df_list <- df_list[setdiff(names(df_list), "df_total")] # Remove the dataframe named "df_total" from the list "df_list"

rm(response, temp_file, df_list_raw, sheet_name, name_clean, df_name, df_total) # Remove unnecessary objects from the environment