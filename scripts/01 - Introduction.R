# 🧬 Clone GitHub repository with Git Bash #### 🆕
browseURL("https://github.com/EasySportsApps/LearnR") # Open the repository page

# Open Git Bash and execute the following commands step by step:
# mkdir "/c/Users/rhile/Desktop/GitHub-clones" # Create a new folder where the desired GitHub repository will be cloned
# pwd # Show the current working directory (e.g., /c/Users/rhile)
# cd "/c/Users/rhile/Desktop/GitHub-clones" # Set the new working directory
# pwd # Show the current working directory 
# git clone https://github.com/EasySportsApps/LearnR.git # Clone the desired repository from GitHub into the local repositories folder

# Or open Git GUI and execute the following steps:
# 1. Click "Clone Existing Repository"
# 2. Paste https://github.com/EasySportsApps/LearnR in Source Location
# 3. Paste C:/Users/rhile/Desktop/GitHub-clones in Target Directory
# 4. Click "Clone"

# Note: replace 'rhile' with your own username



# 🌐 Download and install R-related software ####
browseURL("https://cran.r-project.org/") # Open the official R download website
browseURL("https://cran.r-project.org/bin/windows/Rtools/") # Open the official Rtools download page (required only on Windows to build packages from source written in C/C++ or Fortran) 🆕
browseURL("https://posit.co/downloads/") # Open the official RStudio download website
browseURL("https://positron.posit.co/download.html") # Open the official Positron download website



# 📦 Install R packages ####
browseURL("https://r-universe.dev/search") # Open R-universe package search site
utils::install.packages(c("installr", "remotes", "rstudioapi", "pak", "MASS", "ggplot2")) # Install multiple packages from CRAN
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



# 🔄 Update RStudio software ####
rstudioapi::versionInfo() # Display detailed information about the current RStudio version
# Help > About RStudio # Check the currently installed version of RStudio
# Help > Check for Updates # Download and install the latest RStudio version (if available)

# 🔄 Update R programming language version #### 🆕
R.home() # Show the directory where the current R installation is located
getRversion() # Display the current R version
shell("Rgui.exe", wait = FALSE) # Open RGui (R Graphical User Interface). Recommended: run the next command from RGui, not RStudio
installr::updateR() # Update R to the latest available version
.libPaths() # Show the paths to user and system library folders
old_libraries <- as.character(installed.packages(lib.loc = .libPaths()[1])[, "Package"]) # List all user-installed packages from the previous R version
install.packages(old_libraries) # Install all these user packages in the current R version
# Go to Tools > Global Options... > General > Basic > R Sessions > R version: Change... > Choose a specific version of R: OK
# Restart the R session to apply the new R version in RStudio

# 🔄 Update R packages #### 🆕
library() # List all installed packages
update.packages() # Update all installed packages (not recommended: may cause compatibility issues)

packageVersion("abind") # Check the currently installed version of abind
update.packages(oldPkgs = "abind", ask = TRUE) # Update abind from CRAN if a newer version is available
browseURL("https://cran.r-project.org/package=abind") # Open the official CRAN package page for abind to review all available versions. Navigate to Old sources: abind archive
remotes::install_version("abind", version = "1.4-5", repos = "https://cran.r-project.org") # Install a specific older version of abind from CRAN using remotes
pak::pak("cran/abind@1.4-5") # Install a specific older version of abind from CRAN using pak. Recommended: faster and resolves dependencies automatically

packageVersion("ggplot2") # Check the currently installed version of ggplot2
update.packages(oldPkgs = "ggplot2", ask = TRUE) # Update ggplot2 from CRAN if a newer version is available
browseURL("https://github.com/tidyverse/ggplot2/releases") # Open the official GitHub releases page for ggplot2 to review all available versions
remotes::install_github("tidyverse/ggplot2@v3.5.2") # Install a specific older version of ggplot2 from GitHub using remotes
pak::pak("tidyverse/ggplot2@v3.5.2") # Install a specific older version of ggplot2 from GitHub using pak. Recommended: faster and resolves dependencies automatically



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