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


# Basic plots ###