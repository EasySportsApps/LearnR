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
df$Sex[c(3, 10)] <- NA # Introduce missing values (NA) in rows 3 and 10 of the Sex variable



# 📈 Description of quantitative data ####
summary(object = df$Age, quantile.type = 7) # Summary of age
fivenum(x = df$Age, na.rm = TRUE) # Tukey's five-number summary of age (min, Q1, median, Q2, max)

min(x = df$Age, na.rm = TRUE) # Minimum age
quantile(x = df$Age, probs = 0.25, na.rm = TRUE, type = 7) # 1st quartile age (25th percentile)
median(x = df$Age, na.rm = TRUE) # Median age (2nd quartile / 50th percentile)
quantile(x = df$Age, probs = 0.75, na.rm = TRUE, type = 7) # 3rd quartile age (75th percentile)
max(x = df$Age, na.rm = TRUE) # Maximum age
diff(x = range(x = df$Age, na.rm = TRUE)) # Age range (max - min)

mean(x = df$Age, na.rm = TRUE) # Mean age
var(x = df$Age, na.rm = TRUE) # Age variance
sd(x = df$Age, na.rm = TRUE) # Age standard deviation

sapply(df[, c("Age","BMI")], mean, na.rm=TRUE) # Age and BMI means

cor.test(x = df$Age, y = df$BMI, use = "pairwise.complete.obs", method = "pearson") # Pearson correlation coefficient between age and BMI (ignoring missing values pairwise)

# Note:
# type = 1 → empirical distribution (Stata)
# type = 2 → Tukey method (median of halves)
# type = 6 → SPSS/Minitab method
# type = 7 → R default / Excel weighted average
# na.rm = TRUE → remove NAs before calculation



# 🗃️ Description of categorical data ####
summary(object = df$Sex, quantile.type = 7) # Summary of the sex
table(x = df$Sex) # Absolute frequency table of sex (ignores NAs)
table(x = df$Sex, useNA = "ifany") # Absolute frequency table of sex (including NAs if present)
prop.table(x = table(x = df$Sex)) # Relative frequency table of Sex (proportions)

table(x = df$Sex, y = df$Smoke) # Cross-tabulation: absolute frequencies of sex by smoke
prop.table(x = table(x = df$Sex, y = df$Smoke)) # Cross-tabulation: relative frequencies (proportions) of sex by smoke
chisq.test(x = df$Sex, y = df$Smoke) # Pearson's chi-squared test for independence between sex and smoke
fisher.test(x = df$Sex, y = df$Smoke) # Fisher's exact test for independence between sex and smoke (useful for small samples)



# 📚 Packages for summarizing data ####
source("https://raw.githubusercontent.com/EasySportsApps/LearnR/main/functions/check_install_load_packages.R")
check_install_load_packages(c("summarytools", "skimr", "Hmisc", "dplyr", "gt", "gtsummary"))

# summarytools
browseURL("https://github.com/dcomtois/summarytools?tab=readme-ov-file") # Open summarytools GitHub page
view(dfSummary(df)) # Detailed descriptive summary of the dataframe
view(freq(x = df$Sex, report.nas = TRUE)) # Frequency table of sex including NA counts
view(ctable(x = df$Sex, y = df$Smoke)) # Contingency table of sex by smoke

# skimr
browseURL("https://docs.ropensci.org/skimr/") # Open skimr documentation
skim(df) # Quick skim of the dataframe showing mean, SD, missing, etc.

# Hmisc
browseURL("https://hbiostat.org/r/hmisc/") # Open Hmisc homepage
describe(df) # Detailed description of each variable including counts, missing, percentiles, etc.

# dplyr + gt
browseURL("https://gt.rstudio.com/") # Open gt documentation
df |> 
  summarise(
    Mean_Age = mean(x = Age, na.rm = TRUE), # Mean age
    SD_Age = sd(x = Age, na.rm = TRUE), # Age standard deviation
    Mean_BMI = mean(x = BMI, na.rm = TRUE), # Mean BMI
    SD_BMI = sd(x = BMI, na.rm = TRUE) # BMI standard deviation
  ) |>
  gt() |> 
  tab_header(title = "Summary table of quantitative variables") # Create gt table with header

df |> 
  group_by(Sex) |> # Group data by Sex
  summarise(
    n = n(), # Count of each sex category
    `%` = 100 * n() / nrow(df) # Percentage of each sex category
  ) |>
  gt() |> 
  tab_header(title = "Categorical summary by sex") |> # Add header
  fmt_number( # Format percentage with 1 decimal
    columns = `%`,
    decimals = 1                  
  )

# dplyr + gt + gtsummary
browseURL("https://www.danieldsjoberg.com/gtsummary/") # Open gtsummary documentation
df |>
  select(-Id) |> # Remove Id column from the summary
  tbl_summary(
    type = list(
      Age ~ "continuous", # Treat age as continuous
      Sex ~ "categorical", # Treat sex as categorical
      BMI ~ "continuous", # Treat BMI as continuous
      Smoke ~ "categorical" # Treat smoke as categorical
    ),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})", # Show mean (SD) for continuous variables
      all_categorical() ~ "{n} ({p}%)" # Show n (%) for categorical variables
    ),
    missing = "ifany" # Show missing values if any
  ) |>
  as_gt() |> # Convert tbl_summary object to gt table
  tab_header(title = "Summary table") # Add title to the gt table
