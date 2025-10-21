# 📋 Demo datasets ####
library(help = "datasets") # List all datasets included in base R
data(iris) # Load the "iris" dataset

library(help = "MASS") # List all functions and datasets included in "MASS" package
library("MASS") # Load "MASS" package
data(package = "MASS") # Show all datasets available in "MASS" package
data("cats") # Load the "cats" dataset
data("cats", package = "MASS") # Load the "cats" dataset without loading entire package

library(help = "ggplot2") # List all functions and datasets included in "ggplot2" package
library("ggplot2") # Load "ggplot2" package
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
packages_list <- c("readxl") # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}

library("readxl") # Load "readxl" package

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
packages_list <- c("rio") # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}

library("rio") # Load "rio" package

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

df_iris_riolib_xlsx_local <- import( # Import public Github XLSX dataset
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
packages_list <- c("httr", "rio", "usethis", "stringr", "stringi")  # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}
lapply(packages_list, library, character.only = TRUE) # Load multiple packages

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

rm(packages_list, pkg, response, temp_file, df_list_raw, sheet_name, name_clean, df_name, df_total) # Remove unnecessary objects from the environment

# 🔧 Data manipulation ####
packages_list <- c("dplyr", "tidyr", "stringr", "purrr")  # List of required packages available on CRAN
for (pkg in packages_list) {  # Loop over each package in the list
  if (!requireNamespace(pkg, quietly = TRUE)) { # Check if the package is NOT installed
    install.packages(pkg) # Install the package from CRAN if missing
    message(pkg, " has been installed.") # Inform the user that the package was installed
  } else { # If the package is already installed
    message(pkg, " is already installed.") # Inform the user that the package is available
  }
}
lapply(packages_list, library, character.only = TRUE) # Load multiple packages

# Clean and transform "df_ajedrez"
df_ajedrez_clean <- df_ajedrez |>
  
  # Create the "deporte" column
  mutate(
    deporte = str_to_title(trimws(sub("\\..*", "", names(df_ajedrez)[2])))
  ) |>
  
  # Assign appropriate column names
  setNames(c(
    "id", "universidad",
    "m_oro", "m_plata", "m_bronce", "m_total",
    "f_oro", "f_plata", "f_bronce", "f_total",
    "x_oro", "x_plata", "x_bronce", "x_total", 
    "total_general", "deporte")
  ) |>
  
  # Remove all columns containing "total" (case-insensitive)
  select(
    -contains("total", ignore.case = TRUE)
  ) |>
  
  # Keep rows where 'id' is not NA and 'universidad' does not contain "TOTAL"
  filter(
    !is.na(id), 
    !grepl(x = universidad, pattern = "TOTAL", ignore.case = TRUE)
  ) |>
  
  # Modify and format columns
  mutate(
    id = as.integer(row_number()), # Renumber column "id" as integer
    universidad = as.factor(universidad), # Convert "universidad" to factor
    tipo = if_else(between(id, 1, 49), true = "Pública", false = "Privada"), # Classify universities as public or private
    tipo = factor(x = tipo, levels = c("Pública", "Privada")), # Convert "tipo" to factor with explicit levels
    deporte = as.factor(deporte), # Convert "deporte" to factor
    across(c(m_oro:x_bronce), ~ replace_na(as.numeric(.x), 0)) # Convert medal columns to numeric and replace NA with 0
  ) |>
  
  # Reorder columns
  select(
    id, universidad, tipo, deporte, m_oro:x_bronce
  ) |>
  
  # Reshape wide medal columns into long format
  pivot_longer(
    cols = c(m_oro:x_bronce), # Columns to pivot
    names_pattern = "(.)_(oro|plata|bronce)",  # Extract gender and medal
    names_to = c("sexo", ".value") # Split column names into 'sexo' and medal type
  ) |>
  
  # Modify and format columns
  mutate(
    sexo = factor(x = sexo, levels = c("m", "f", "x"), labels = c("Masculino", "Femenino", "Mixto")) # Convert "sexo" to factor with explicit levels and labels
  ) |>
  
  # Rename final columns
  select(
    Id = id,
    Universidad = universidad,
    Tipo = tipo,
    Deporte = deporte,
    Sexo = sexo,
    Oro = oro,
    Plata = plata,
    Bronce = bronce
  ) |>
  
  # Sort rows by university ID and gender order
  arrange(Id, match(Sexo, c("Masculino", "Femenino", "Mixto")))

# Function to clean and combine multiple datasets
clean_and_combine_df <- function(dataframes_list) {
  
  # Apply the pipeline to each dataframe in the list
  df_combined <- map_dfr(dataframes_list, ~ .x |>
                           
                           # Create the "deporte" column
                           mutate(
                             deporte = str_to_title(trimws(sub("\\..*", "", names(.x)[2])))
                           ) |>
                           
                           # Assign appropriate column names
                           setNames(c(
                             "id", "universidad",
                             "m_oro", "m_plata", "m_bronce", "m_total",
                             "f_oro", "f_plata", "f_bronce", "f_total",
                             "x_oro", "x_plata", "x_bronce", "x_total", 
                             "total_general", "deporte"
                           )) |>
                           
                           # Remove all columns containing "total" (case-insensitive)
                           select(
                             -contains("total", ignore.case = TRUE)
                           ) |>
                           
                           # Keep rows where 'id' is not NA and 'universidad' does not contain "TOTAL"
                           filter(
                             !is.na(id),
                             !grepl("TOTAL", universidad, ignore.case = TRUE)
                           ) |>
                           
                           # Modify and format columns
                           mutate(
                             id = as.integer(row_number()), # Renumber column "id" as integer
                             universidad = as.factor(universidad), # Convert "universidad" to factor
                             tipo = if_else(between(id, 1, 49), "Pública", "Privada"), # Classify universities as public or private
                             tipo = factor(tipo, levels = c("Pública", "Privada")), # Convert "tipo" to factor with explicit levels
                             deporte = as.factor(deporte), # Convert "deporte" to factor
                             across(c(m_oro:x_bronce), ~ replace_na(as.numeric(.x), 0)) # Convert medal columns to numeric and replace NA with 0
                           ) |>
                           
                           # Reorder columns
                           select(
                             id, universidad, tipo, deporte, m_oro:x_bronce
                           ) |>
                           
                           # Reshape wide medal columns into long format
                           pivot_longer(
                             cols = c(m_oro:x_bronce), # Columns to pivot
                             names_pattern = "(.)_(oro|plata|bronce)", # Extract gender and medal
                             names_to = c("sexo", ".value") # Split column names into 'sexo' and medal type
                           ) |>
                           
                           # Modify and format columns
                           mutate(
                             sexo = factor(sexo, levels = c("m", "f", "x"), labels = c("Masculino", "Femenino", "Mixto")) # Convert "sexo" to factor with explicit levels and labels
                           ) |>
                           
                           # Rename final columns
                           select(
                             Id = id,
                             Universidad = universidad,
                             Tipo = tipo,
                             Deporte = deporte,
                             Sexo = sexo,
                             Oro = oro,
                             Plata = plata,
                             Bronce = bronce
                           )
  )
  
  # Sort rows by university ID, sport, and gender
  df_combined <- df_combined |>
    arrange(Id, Deporte, match(Sexo, c("Masculino", "Femenino", "Mixto"))
    )
  
  return(df_combined)
}

df_total_medallero_ceu_2024 <- clean_and_combine_df(list(df_ajedrez, df_atletismo)) # Combine specific dataframes into a single cleaned dataset
df_total_medallero_ceu_2024 <- clean_and_combine_df(df_list) # Combine all dataframes stored in the list "df_list"

df_total_medallero_ceu_2024 <- df_total_medallero_ceu_2024 |>
  filter(!(Oro == 0 & Plata == 0 & Bronce == 0)) # Keep only rows where not all medal counts are zero

rm(packages_list, pkg) # Remove unnecessary objects from the environment

# library(dplyr)
# df_totales_uni <- df_total_medallero_ceu_2024 |>
#   group_by(Universidad) |>
#   summarise(
#     Oro = sum(Oro),
#     Plata = sum(Plata),
#     Bronce = sum(Bronce),
#     Total = Oro + Plata + Bronce
#   ) |>
#   arrange(desc(Total))

