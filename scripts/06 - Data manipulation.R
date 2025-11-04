# 📥 Import dataset from Private GitHub raw URL ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R")
check_install_load_packages(c("httr", "rio", "usethis", "stringr", "stringi"))

edit_r_environ()
Sys.getenv("GITHUB_TOKEN")
response <- GET(
  url = "https://raw.githubusercontent.com/EasySportsApps/LearnR-private/main/TOTAL%20MEDALLERO%20CEU%202024.xlsx",
  add_headers(Authorization = paste("token", Sys.getenv("GITHUB_TOKEN")))
)
stop_for_status(response)
temp_file <- tempfile(fileext = ".xlsx")
writeBin(content(response, "raw"), temp_file)
df_list_raw <- import_list(temp_file)
df_list <- list()
for (sheet_name in names(df_list_raw)) { #
  name_clean <- stri_trans_general(sheet_name, "Latin-ASCII")
  name_clean <- tolower(name_clean)
  name_clean <- str_replace_all(name_clean, "[^a-z0-9]", "_")
  name_clean <- str_replace_all(name_clean, "_+", "_")
  name_clean <- str_replace(name_clean, "^_|_$", "")
  df_name <- paste0("df_", name_clean)
  df_list[[df_name]] <- df_list_raw[[sheet_name]]
  assign(df_name, df_list[[df_name]], envir = .GlobalEnv)
}
unlink(temp_file)
df_list <- df_list[setdiff(names(df_list), "df_total")]
rm(response, temp_file, df_list_raw, sheet_name, name_clean, df_name, df_total)



# 1️⃣ Data manipulation of a dataset ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R")
check_install_load_packages(c("dplyr", "tidyr", "stringr"))

# Clean and transform a dataset
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



# 🔢 Data manipulation of multiple datasets ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R")
check_install_load_packages(c("dplyr", "tidyr", "stringr", "purrr"))

# Function to clean, transform, and combine multiple datasets
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

# Combine specific dataframes into a single cleaned dataset
df_total_medallero_ceu_2024 <- clean_and_combine_df(list(df_ajedrez, df_atletismo)) 

# Combine all dataframes stored in the list "df_list"
df_total_medallero_ceu_2024 <- clean_and_combine_df(df_list)

# Keep only rows where not all medal counts are zero
df_total_medallero_ceu_2024 <- df_total_medallero_ceu_2024 |>
  filter(!(Oro == 0 & Plata == 0 & Bronce == 0)) 



# 🧮 Totals calculation ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R")
check_install_load_packages("dplyr")

# Totals by university
df_totales_uni <- df_total_medallero_ceu_2024 |> # Use the cleaned dataset
  group_by(Universidad) |> # Group data by university
  summarise(                                              
    Oro = sum(Oro, na.rm = TRUE), # Sum gold medals, ignoring missing values
    Plata = sum(Plata, na.rm = TRUE), # Sum silver medals, ignoring missing values
    Bronce = sum(Bronce, na.rm = TRUE), # Sum bronze medals, ignoring missing values
    Total = Oro + Plata + Bronce # Compute total medals
  ) |>
  arrange(desc(Total)) # Order universities by total medals (descending)

# Totals by university and sex
df_totales_uni_sexo <- df_total_medallero_ceu_2024 |> # Use the cleaned dataset
  group_by(Universidad, Sexo) |> # Group data by university and sex
  summarise(
    Oro = sum(Oro, na.rm = TRUE), # Sum gold medals, ignoring missing values
    Plata = sum(Plata, na.rm = TRUE), # Sum silver medals, ignoring missing values
    Bronce = sum(Bronce, na.rm = TRUE), # Sum bronze medals, ignoring missing values
    Total = Oro + Plata + Bronce, # Compute total medals
    .groups = "drop" # Drop grouping structure to return a clean dataframe
  ) |>
  arrange(Sexo, desc(Total)) # Sort results by sex and total medals

# Totals by university type and sport
df_totales_tipo_deporte <- df_total_medallero_ceu_2024 |> # Use the cleaned dataset
  group_by(Tipo, Deporte) |> # Group data by type and sport
  summarise(
    Oro = sum(Oro, na.rm = TRUE), # Sum gold medals, ignoring missing values
    Plata = sum(Plata, na.rm = TRUE), # Sum silver medals, ignoring missing values
    Bronce = sum(Bronce, na.rm = TRUE), # Sum bronze medals, ignoring missing values
    Total = Oro + Plata + Bronce, # Compute total medals
    .groups = "drop" # Drop grouping structure to return a clean dataframe
  ) |>
  arrange(Tipo, desc(Total)) # Sort results by type and total medals
