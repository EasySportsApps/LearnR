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



# 🎨 Hex color codes ####
browseURL("https://www.color-hex.com/") # Open website to explore HEX color codes


# 📊 Histogram #####
freq_hist <- hist(x = df$Age, breaks = 4, freq = TRUE, # Create frequency histogram of age (continuous)
                  col = "#99DEF8", border = "#000000",
                  main = "Histogram", xlab = "Age (years)", ylab = "Frequency",
                  axes = FALSE, labels = FALSE)
axis(side = 1, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # Add X-axis
axis(side = 2, at = seq(0, max(freq_hist$counts), by = 1)) # Add Y-axis
abline(v = mean(df$Age), col = "#000000", lty = 2, lwd = 2) # Add vertical line
text(x = mean(df$Age), y = max(freq_hist$counts)/2, # Add text
     labels = paste("x̄ =", formatC(mean(df$Age), format = "f", digits = 1)),,
     pos = 4, cex = 1.0, col = "#000000")

dens_hist <- hist(x = df$Age, breaks = 4, freq = FALSE, # Create density histogram of age (continuous)
                  col = "#99DEF8", border = "#000000",
                  main = "Histogram", xlab = "Age (years)", ylab = "Density",
                  axes = FALSE, labels = FALSE)
axis(side = 1, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # Add X-axis
axis(side = 2, at = seq(0, ceiling(max(dens_hist$density)), by = 0.01)) # Add Y-axis: each 0.01 unit × 5-year bin ≈ 0.05 area (≈5% of total)
lines(x = density(df$Age), col = "#DB4C4C", lty = 1, lwd = 2) # Add smooth density curve (smoothed version of histogram using kernel density estimation)
abline(v = mean(df$Age), col = "#000000", lty = 2, lwd = 2) # Add vertical line
text(x = mean(df$Age), y = max(dens_hist$density)/2, # Add text
     labels = paste("x̄ =", formatC(mean(df$Age), format = "f", digits = 1)),
     pos = 4, cex = 1.0, col = "#000000")



# 🎁 Boxplot #####
boxplot(x = df$Age, # Create boxplot of age (continuous)
        col = "#99DEF8", border = "#000000",
        main = "Boxplot", ylab = "Age (years)", 
        ylim = c(floor(min(df$Age)), ceiling(max(df$Age)/5)*5),
        axes = FALSE, outline = TRUE)
axis(side = 2, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # Add Y-axis
mean_age <- mean(df$Age) # Calculate mean age
points(x = 1, y = mean_age, pch = 18, col = "#000000", cex = 1.5) # Add point
text(x = 1, y = mean_age, # Add text
     labels = paste(formatC(mean_age, format = "f", digits = 1)), 
     pos = 4, cex = 0.9, col = "#000000")
legend(x = "topright", # Add legend
       legend = "Mean", col = "#000000",
       pch = 18, pt.cex = 1.5, bty = "n")

boxplot(formula = Age ~ Sex, data = df, # Create boxplot of age by sex (continuous vs. categorical)
        col = "#99DEF8", border = "#000000",
        main = "Boxplot", xlab = "Sex", ylab = "Age (years)", 
        ylim = c(floor(min(df$Age)), ceiling(max(df$Age)/5)*5),
        axes = FALSE, outline = TRUE)
axis(side = 1, at = 1:2, labels = levels(df$Sex)) # Add X-axis
axis(side = 2, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # Add Y-axis
mean_age_sex <- tapply(X = df$Age, INDEX = df$Sex, FUN = mean) # Calculate mean age by sex
points(x = 1:2, mean_age_sex, pch = 18, col = "#000000", cex = 1.5) # Add points
text(x = 1:2, y = mean_age_sex, # Add text
     labels = paste(formatC(mean_age_sex, format = "f", digits = 1)), 
     pos = 4, cex = 0.9, col = "#000000")
legend(x = "topright", # Add legend
       legend = "Mean", col = "#000000",
       pch = 18, pt.cex = 1.5, bty = "n")


# 🔵 Scatter plot #####
plot(x = df$Age, y = df$BMI, # Create scatter plot of age and BMI (continuous vs. continuous)
     col = ifelse(df$Sex == "Female", "#99DEF8", "#1F77B4"),
     pch = 16, cex = 1.5, 
     main = "Scatter plot", xlab = "Age (years)", ylab = "BMI",
     xlim = c(floor(min(df$Age)), ceiling(max(df$Age)/5)*5),
     ylim = c(floor(min(df$BMI)), ceiling(max(df$BMI)/2)*2),
     axes = FALSE)
axis(side = 1, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # Add X-axis
axis(side = 2, at = seq(floor(min(df$BMI)), ceiling(max(df$BMI)/2)*2, by = 2)) # Add Y-axis
legend(x = "topright", # Add legend
       legend = c("Female", "Male"), col = c("#99DEF8", "#1F77B4"), 
       pch = 16, pt.cex = 1.5)

pairs(x = df[, c("Age", "BMI", "SBP")], # Create scatterplot matrix of age, BMI, and SBP (continuous vs. continuous vs. continuous)
      col = ifelse(df$Sex == "Female", "#99DEF8", "#1F77B4"),
      pch = 16, cex = 1.5, gap = 1.0,
      main = "Scatterplot matrix", labels = c("Age (years)", expression(BMI~(kg/m^2)), "SBP (mmHg)"))
par(xpd = TRUE) # Allow drawing outside the plot region
legend(x = "topright", # Add legend
       legend = c("Female", "Male"), col = c("#99DEF8", "#1F77B4"),
       pch = 16, pt.cex = 1.2, bty = "n")
par(xpd = FALSE) # Reset plotting area to default



# 📊 Barplot #####
freq_tab <- table(df$ParentsSmoke) # Compute frequency table of number of smoking parents (discrete)
freq_tab # Display frequency table
barplot(height = freq_tab, # Create barplot
        col = "#99DEF8", border = "#000000",
        main = "Barplot", xlab = "Number of smoking parents", ylab = "Frequency",
        axes = FALSE, axisnames = TRUE)
axis(side = 2, at = seq(0, max(freq_tab), by = 1)) # Add Y-axis

freq_tab <- table(df$Sex) # Compute frequency table of sex (categorical)
freq_tab # Display frequency table
barplot(height = freq_tab, # Create barplot
        col = "#99DEF8", border = "#000000",
        main = "Barplot", xlab = "Sex", ylab = "Frequency",
        axes = FALSE, axisnames = TRUE)
axis(side = 2, at = seq(0, max(freq_tab), by = 1)) # Add Y-axis

cont_tab <- t(x = prop.table(table(df$Sex, df$Smoke), margin = 1) * 100) # Compute contingency table showing percentage of smokers by sex (categorical vs. categorical)
cont_tab # Display contingency table
barplot(height =  cont_tab, # Create stacked barplot
        col = c("#F44336", "#6AA84F"), border = "#000000",
        ylim = c(0, 100),
        main = "Stacked barplot", xlab = "Sex", ylab = "Percentage (%)", 
        beside = FALSE, axes = FALSE, axisnames = TRUE)
axis(side = 2, at = seq(0, 100, by = 10)) # Add Y-axis
par(xpd = TRUE) # Allow drawing outside the plot region
legend(x = "topright", inset = c(0, -0.1), # Add legend
       legend = c("No", "Yes"), col = c("#F44336", "#6AA84F"),
       pch = 15, pt.cex = 1.2, bty = "n")
par(xpd = FALSE) # Reset plotting area to default

cont_tab <- t(x = prop.table(table(df$Sex, df$Smoke), margin = 1) * 100) # Compute contingency table showing percentage of smokers by sex (categorical vs. categorical)
cont_tab # Display contingency table
barplot(height = cont_tab, # Create grouped barplot
        beside = TRUE, col = c("#F44336", "#6AA84F"), border = "#000000",
        ylim = c(0, max(cont_tab) * 1.1),
        main = "Grouped barplot", xlab = "Sex", ylab = "Percentage (%)", 
        axes = FALSE, axisnames = TRUE)
axis(side = 2, at = seq(0, ceiling(max(cont_tab) * 1.1 / 10) * 10, by = 10)) # Add Y-axis
par(xpd = TRUE) # Allow drawing outside the plot region
legend(x = "topright", inset = c(0, -0.1), # Add legend
       legend = c("No", "Yes"), col = c("#F44336", "#6AA84F"),
       pch = 15, pt.cex = 1.2, bty = "n")
par(xpd = FALSE) # Reset plotting area to default



# 🧪 Combine plots with base R libraries ####
par(mfrow = c(2, 2)) # Combine 4 plots (2 rows x 2 columns) using the par function
hist(x = df$Age, freq = TRUE) # Create simplified frequency histogram of Age
boxplot(x = df$Age) # Create simplified boxplot of Age
boxplot(formula = Age ~ Sex, data = df) # Create simplified boxplot comparing Age by Sex
plot(x = df$Age, y = df$BMI) # Create simplified scatter plot: Age vs BMI
par(mfrow = c(1, 1)) # Reset layout to single plot

layout(mat = matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2), widths = c(1, 1), heights = c(1, 1)) # Combine 4 plots (2 rows x 2 columns, all plots same size) using the layout function
hist(x = df$Age, freq = TRUE) # Create simplified frequency histogram of Age
boxplot(x = df$Age) # Create simplified boxplot of Age
boxplot(formula = Age ~ Sex, data = df) # Create simplified boxplot comparing Age by Sex
plot(x = df$Age, y = df$BMI) # Create simplified scatter plot: Age vs BMI
layout(1)  # Reset layout to default single plot

