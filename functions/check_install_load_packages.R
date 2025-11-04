# Function to check, install, and load required packages ####

check_install_load_packages <- function(packages_list) {
  for (pkg in packages_list) {  # Loop over each package in the list
  
    if (!requireNamespace(pkg, quietly = TRUE)) {  # Check if the package is NOT installed
      install.packages(pkg)  # Install the package from CRAN if missing
      message(pkg, " has been installed.")  # Inform the user that the package was installed
    } else {  # If the package is already installed
      message(pkg, " is already installed.")  # Inform the user that the package is available
    }
    
    suppressPackageStartupMessages(library(pkg, character.only = TRUE))  # Load the package quietly
    message(pkg, " version ", as.character(packageVersion(pkg)), " has been loaded successfully.\n")  # Inform the user that the package was loaded and display its version
  }
}
