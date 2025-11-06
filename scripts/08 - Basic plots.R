# 🗂️ Dataframe ####
set.seed(123) # Reproducible results
n <- 20 # Sample size
id <- seq(from = 1, to = n, by = 1) # Generate ID sequence from 1 to 20
age <- round(x = rnorm(n = n, mean = 30, sd = 5), digits = 1) # Generate 20 ages randomly, normally distributed (mean = 30, SD = 5), rounded to 1 decimal
sex <- factor(sample(x = c(0, 1), size = n, replace = TRUE), levels = c(0, 1), labels = c("Female", "Male")) # Generate 20 random sex values
smoke <- factor(sample(x = c(0, 1), size = n, replace = TRUE), levels = c(0, 1), labels = c("No", "Yes")) # Generate 20 random smoker values
bmi <- round(x = rnorm(n = n, mean = 25, sd = 5), digits = 2) # Generate 20 BMIs randomly, normally distributed (mean = 25, SD = 5), rounded to 2 decimals
df <- data.frame(Id = id, Age = age, Sex = sex, BMI = bmi, Smoke = smoke) # Create dataframe
df$Id <- as.integer(df$Id) # Convert Id variable to integer

# 🎨 Hex color codes ####
browseURL("https://www.color-hex.com/") # Open website to explore HEX color codes



# 🔵 Scatter plot #####
plot(x = df$Age, y = df$BMI, # Create scatter plot of age and BMI
     col = ifelse(df$Sex == "Female", "#99DEF8", "#1F77B4"),
     pch = 16, cex = 1.5, 
     xlab = "Age (years)", ylab = "BMI",
     main = "Scatter plot",
     axes = TRUE)
legend(x = "topright", legend = c("Female", "Male"), # Add legend for Sex
       col = c("#99DEF8", "#1F77B4"), 
       pch = 16, pt.cex = 1.5)

pairs(x = df[, c("Age", "BMI", "Sex")], # Create scatterplot matrix of age, BMI, and sex
      main = "Scatterplot matrix")



# 🎁 Boxplot #####
boxplot(formula = Age ~ Sex, data = df, # Create age boxplot
        col = "#99DEF8", border = "#000000",
        main = "Boxplot", xlab = "Sex", ylab = "Age (years)", 
        ylim = c(floor(min(df$Age)), ceiling(max(df$Age)/5)*5),
        axes = FALSE, outline = TRUE)
axis(side = 1, at = 1:2, labels = levels(df$Sex)) # X-axis
axis(side = 2, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # Y-axis
group_means <- tapply(X = df$Age, INDEX = df$Sex, FUN = mean) # Calculate mean age by sex
points(x = 1:2, group_means, pch = 18, col = "#000000", cex = 1.5) # Add mean age by sex text
text(x = 1:2, y = group_means, 
     labels = paste(formatC(group_means, format = "f", digits = 1)), 
     pos = 4, cex = 0.9, col = "#000000")
legend(x = "top", legend = "Mean age",
       col = "#000000", , bty = "n",
       pch = 18, pt.cex = 1.5)



# 📊 Histogram #####
hist_freq <- hist(x = df$Age, breaks = 4, freq = TRUE, # Create and store age histogram (frequency)
                  col = "#99DEF8", border = "#000000",
                  main = "Histogram", xlab = "Age (years)", ylab = "Frequency",
                  axes = FALSE, labels = FALSE)
axis(side = 1, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # X-axis
axis(side = 2, at = seq(0, max(hist_freq$counts), by = 1)) # Y-axis
abline(v = mean(df$Age), col = "#000000", lty = 2, lwd = 2) # Mean age vertical line
text(x = mean(df$Age), y = max(hist_freq$counts)/2, # Add mean age text
     labels = paste("x̄ =", formatC(mean(df$Age), format = "f", digits = 1)),,
     pos = 4, cex = 1.0, col = "#000000")


hist_dens <- hist(x = df$Age, breaks = 4, freq = FALSE, # Create and store age histogram (density)
                  col = "#99DEF8", border = "#000000",
                  main = "Histogram", xlab = "Age (years)", ylab = "Density",
                  ylim = c(0, max(density(df$Age)$y) * 1.0),
                  axes = FALSE, labels = FALSE)
axis(side = 1, at = seq(floor(min(df$Age)), ceiling(max(df$Age)/5)*5, by = 5)) # X-axis
axis(side = 2, at = seq(0, ceiling(max(hist_dens$density)), by = 0.01)) # Y-axis: each 0.01 unit × 5-year bin ≈ 0.05 area (≈5% of total)
lines(x = density(df$Age), col = "#DB4C4C", lty = 1, lwd = 2) # Add smooth density curve (smoothed version of histogram using kernel density estimation)
abline(v = mean(df$Age), col = "#000000", lty = 2, lwd = 2) # Mean age vertical line
text(x = mean(df$Age), y = max(hist_freq$density)/2, # Add mean age text
     labels = paste("x̄ =", formatC(mean(df$Age), format = "f", digits = 1)),
     pos = 4, cex = 1.0, col = "#000000")

# Hola Fork ####