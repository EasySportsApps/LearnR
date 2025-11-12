# 🗂️ Dataframe ####
set.seed(123) # Reproducible results
n <- 20 # Sample size

id <- seq(from = 1, to = n, by = 1) # Generate ID sequence from 1 to 20
sex <- factor(sample(x = c(0, 1), size = n, replace = TRUE), levels = c(0, 1), labels = c("Female", "Male")) # Generate 20 random sex values (categorical variable)
age <- round(x = rnorm(n = n, mean = 30, sd = 5), digits = 1) # Generate 20 ages (years), normally distributed (mean = 30, SD = 5), rounded to 1 decimal (continuous variable)
bmi <- round(x = rnorm(n = n, mean = 25, sd = 5), digits = 2) # Generate 20 body mass indexes (kg/m²), normally distributed (mean = 25, SD = 5), rounded to 2 decimals (continuous variable)
smoke <- factor(sample(x = c(0, 1), size = n, replace = TRUE), levels = c(0, 1), labels = c("No", "Yes")) # Generate 20 random smoker values (categorical variable)
parents_smoke <- sample(x = 0:2, size = n, replace = TRUE) # Generate 20 random values of number of smoking parents (discrete variable)
sbp <- round(x = rnorm(n = n, mean = 120, sd = 10), digits = 0) # Generate 20 systolic blood pressures (mmHg), normally distributed (mean = 120, SD = 10), rounded to 0 decimals (continuous variable)

df <- data.frame(Id = id, Sex = sex, Age = age, BMI = bmi, Smoke = smoke, ParentsSmoke = parents_smoke, SBP = sbp) # Create dataframe
df$Id <- as.integer(df$Id) # Convert Id variable to integer



# 📦 Check, install, and load R packages for graphics ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R")
check_install_load_packages(c("ggplot2", "lattice")) # Static graphics
check_install_load_packages(c("plotly", "ggiraph", "highcharter")) # Interactive graphics
check_install_load_packages(c("cowplot", "patchwork")) # Combination



# 📚 Readme and manuals ####
browseURL("https://r-graph-gallery.com/") # R Graph Gallery (examples for all main packages)
browseURL("https://ggplot2.tidyverse.org/") # Open ggplot2 documentation
browseURL("https://lattice.r-forge.r-project.org/") # Open lattice documentation
browseURL("https://plotly.com/r/") # Open plotly documentation
browseURL("https://davidgohel.github.io/ggiraph/") # Open ggiraph documentation
browseURL("https://jkunst.com/highcharter/") # Open highcharter documentation
browseURL("https://wilkelab.org/cowplot/index.html") # Open cowplot documentation
browseURL("https://patchwork.data-imaginist.com/") # Open patchwork documentation


# Introduction to ggplot2 ####
# Note: ggplot2 is a package for creating graphics, built around three essential components (data, mapping, layers)
# and four optional components (scales, facets, coordinates, theme).

# Data and mapping components
ggplot(data = df, mapping = aes(x = Age, y = BMI, color = Sex)) +  # Specify dataset, axes, and color mapping
  
  # Layer component
  geom_point(size = 3) + # Add scatter plot
  
  # Scale component: scale_{aesthetic}_{type}
  scale_color_manual(values = c("Female" = "#99DEF8", "Male" = "#1F77B4")) +  # Custom colors for Sex variable
  
  # Facet component
  facet_grid(rows = vars(Smoke), cols = vars(ParentsSmoke), labeller = label_both) + # Facet plot by Smoke and ParentsSmoke variables
  
  # Coordinate component
  scale_x_continuous(name = "Age (years)", breaks = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) +  # Define X-axis ticks
  scale_y_continuous(name = "BMI (m/kg²)", breaks = seq(floor(min(df$BMI)), ceiling(max(df$BMI)/2)*2, by = 2)) +  # Define Y-axis ticks
  
  # Theme component
  labs(title = "Scatter plot") + # Add title and axis labels
  theme_classic() +  # Clean minimal theme
  theme(
    legend.position = "top", # Define position legend at the top
    panel.border = element_rect(color = "#000000", fill = NA), # Define facet borders color
    strip.background = element_rect(color = "#000000", fill = "#FFFFFF"), # Define facet headers color
    strip.text = element_text(face = "bold") # Facet header text bold
  )

