# 🌐 Download and install R-related software ####
browseURL("https://cran.r-project.org/") # Open the official R download website
browseURL("https://posit.co/downloads/") # Open the official RStudio download website
browseURL("https://positron.posit.co/download.html") # Open the official Positron download website



# 📦 Install R packages ####
browseURL("https://r-universe.dev/search") # Open R-universe package search site
install.packages(c("installr", "remotes", "rstudioapi", "pak", "MASS", "ggplot2")) # Install multiple packages from CRAN
remotes::install_github("talgalili/installr") # Install a package from GitHub using "remotes" package
pak::pak("talgalili/installr") # Install a package from GitHub using "pak" package (faster, resolves dependencies)
remove.packages("remotes") # Remove/uninstall a specific package (e.g., "remotes")

# 📦 Check, install, and load R packages using a loop ####
packages_list <- c("installr", "remotes", "rstudioapi", "pak", "MASS", "ggplot2") # List of required packages available on CRAN
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

# 📦 Check, install, and load R packages using a custom function ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R") # Load a custom function from GitHub
check_install_load_packages(c("installr", "remotes", "rstudioapi", "pak", "MASS", "ggplot2")) # Execute the custom function to check, install, and load all required packages



# 🔄 Update R-related software ####
R.home() # Display the directory path where the current version of R is installed
getRversion() # Show the currently installed R version
installr::updateR(copy.packages = TRUE) # Update R to the latest version and copy all user-installed packages automatically
rstudioapi::versionInfo() # Display detailed information about the current RStudio version
# Help > About RStudio # Check the currently installed version of RStudio
# Help > Check for Updates # Download and install the latest RStudio version (if available)

# 🔄 Update R packages ####
.libPaths() # Display the paths where the packages are stored
library() # List all installed packages
update.packages() # Update all installed packages
packageVersion("abind") # Check the currently installed version of a specific package 
update.packages(oldPkgs = "abind", ask = TRUE) # Update a specific package
remotes::install_version("abind", version = "1.4-5", repos = "https://cran.r-project.org") # Install older version via remotes
pak::pak("cran/abind@1.4-5") # Install older version via pak (faster, resolves dependencies)



# 🆘 Help ####
help.start() # Open the main R help page
library(help = "base") # List all functions and datasets in any installed package (e.g., "base")
help("mean") # Display the help page for a specific function or package (e.g., "mean")
?mean # Shortcut to display the help page for a specific function or package (e.g., "mean")



# 🔧 Utilities ####
sessionInfo() # Display detailed R session info (R version, OS, locale, base packages loaded, other packages loaded)
search() # Show all loaded packages and environments in the current R session
ls() # List all objects in the current environment
rm(list = ls()) # Remove all objects from the environment
history() # Show command history
getwd() # Show current working directory
setwd("C:/Users/rhile/Desktop/LearnR") # Set working directory (keyboard shortcut: Ctrl + Shift + H; RStudio menu path: Session > Set working directory > Choose Directory)
cat("\014") # Clear console (keyboard shortcut: Ctrl + L)
q() # Quit R (keyboard shortcut: Ctrl + Q)

# HOLA