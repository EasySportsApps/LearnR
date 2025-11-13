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
check_install_load_packages(c("dplyr")) # Data manipulation
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



# 🎨 Hex color codes ####
browseURL("https://www.color-hex.com/") # Open website to explore HEX color codes



# 🔵 ggplot2 demonstration (scatter plot) ####

# Rename variables
df <- df |>
  rename(`Number of smoking parents` = ParentsSmoke,
         `Smoking habit` = Smoke)

# Create summary dataframe with mean Age and BMI by Number of smoking parents, Smoking habit, and Sex
df_summary <- df |>
  group_by(`Number of smoking parents`, `Smoking habit`, Sex) |>
  summarise(
    meanAge = mean(Age, na.rm = TRUE),
    meanBMI = mean(BMI, na.rm = TRUE),
    .groups = "drop"
  )

# Create an advanced plot with ggplot2
ggplot() + # Specify here the data and mapping components if the plot has only one layer
  
  # Data, mapping, and layers components (mandatory)  
  geom_point(data = df, # Add individual points on scatter plots
             mapping = aes(x = Age, y = BMI, color = Sex, shape = "Individual"), 
             size = 3) + 
  geom_point(data = df_summary, # Add mean points on scatter plots
             mapping = aes(x = meanAge, y = meanBMI, color = Sex, shape = "Mean"), 
             size = 4) +
  # Note: for this or other geoms like geom_bar or geom_col, you can also map aesthetics like fill, size, or group
  
  # Scales component (optional): scale_{aesthetic}_{type}
  scale_x_continuous(name = "Age (years)", # Set continuous variable Age (X-axis)
                     breaks = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) + 
  scale_y_continuous(name = "BMI (m/kg²)", # Set continuous variable BMI (Y-axis)
                     breaks = seq(floor(min(df$BMI)), ceiling(max(df$BMI)/2)*2, by = 2)) + 
  scale_color_manual(name = "Sex:", # Set color of categorical variable Sex
                     values = c("Female" = "#E41A1C", "Male" = "#377EB8"),
                     guide = guide_legend(order = 1)) + 
  scale_shape_manual(name = "Point shape:", # Set shape of individual and mean points 
                     values = c("Individual" = 16, "Mean" = 4),
                     guide = guide_legend(order = 2)) + 
  
  # Facets component (optional)
  facet_grid(cols = vars(`Number of smoking parents`), # Add facets by Number of smoking parents and Smoking habit categories
             rows = vars(`Smoking habit`), 
             labeller = label_both) + 
  
  # Coordinates component (optional)
  coord_cartesian(xlim = c(floor(min(df$Age)), ceiling(max(df$Age)/5)*5), # Set visible range of axes in a Cartesian coordinate system
                  ylim = c(floor(min(df$BMI)), ceiling(max(df$BMI)/2)*2)) +

  # Theme component (optional)
  labs( # Add title, subtitle, and caption
    title = "Relationship between Age and BMI by Number of smoking parents, Smoking habit, and Sex",
    subtitle = "Scatter plot with individual and mean points",
    caption = "Note: simulated data") +
  theme_classic() +  # Add classic theme
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 12), # Set title
    plot.subtitle = element_text(face = "italic", hjust = 0.5, size = 11), # Set subtitle
    plot.caption = element_text(face = "italic", hjust = 1, size = 10), # Set caption
    
    axis.title.x = element_text(face = "bold", size = 10),  # Set X-axis title
    axis.title.y = element_text(face = "bold", size = 10),  # Set Y-axis title
    
    strip.background = element_rect(color = "#000000", fill = "#FFFFFF"), # Set facet background headers
    strip.text = element_text(face = "bold", size = 10), # Set facet text header
    panel.border = element_rect(color = "#000000", fill = NA), # Set facet borders
    
    legend.position = "bottom", # Set legend position
    legend.background = element_rect(color = "#000000", fill = "#FFFFFF"), # Set legend border
    legend.title = element_text(face = "bold", size = 9), # Set legend title
    legend.text = element_text(size = 9), # Set legend text
    legend.key.size = unit(0.8, "lines") # Set legend symbol
  )