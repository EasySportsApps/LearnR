# 📦 Installation and removal ####
browseURL("https://cran.r-project.org/") # Open the official R download website
browseURL("https://posit.co/downloads/") # Open the official RStudio download website
install.packages(c("installr", "remotes", "pak", "MASS", "ggplot2")) # Install multiple packages from CRAN
remotes::install_github("talgalili/installr") # Install a package from GitHub using "remotes" package
pak::pak("talgalili/installr") # Install a package from GitHub using "pak" package (faster, resolves dependencies)
remove.packages("remotes") # Remove/uninstall a specific package (e.g., "remotes")

# 🔄 Update R ####
library("installr") # Load installr package
updateR(copy.packages = TRUE) # Update R and copy all user-installed packages to the new version

# 🔄 Update RStudio ####
# RStudio menu path: Help > Check for Updates

# 🔄 Update packages ####
update.packages() # Update all installed package
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
.libPaths() # Display the paths where R stores and looks for packages
library() # List all installed packages
cat("\014") # Clear console (keyboard shortcut: Ctrl + L)
q() # Quit R (keyboard shortcut: Ctrl + Q)