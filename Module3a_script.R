# ===== Chi-square Test of Independence (Gender and Course Selection) =====
# Create a contingency table
course_data <- matrix(c(45, 30, 25, 20, 35, 45), nrow = 2, byrow = TRUE)
rownames(course_data) <- c("Male", "Female")
colnames(course_data) <- c("Science", "Arts", "Business")
print(course_data)

# Step 1: Visualize the Data
# Create a bar plot
barplot(course_data, beside = TRUE, 
        main = "Course Selection by Gender",
        xlab = "Course", ylab = "Frequency",
        col = c("lightblue", "lightpink"),
        legend.text = rownames(course_data))

# Create a mosaic plot
mosaicplot(course_data, 
           main = "Course Selection by Gender",
           color = c("lightblue", "lightpink"),
           shade = FALSE)

# Step 2: Perform the Chi-square Test
chi_result <- chisq.test(course_data)
print(chi_result)
print(chi_result$expected)  # Expected frequencies

# Step 3: Calculate Effect Size (Cramer's V)
n <- sum(course_data)
k <- min(nrow(course_data) - 1, ncol(course_data) - 1)
cramer_v <- sqrt(chi_result$statistic / (n * k))
cat("Cramer's V =", cramer_v, "\n")

# ===== Example 5: Chi-square Goodness of Fit Test (Dice Rolls) =====
# Observed frequencies of dice rolls
observed <- c(42, 60, 53, 47, 58, 40)
names(observed) <- c("1", "2", "3", "4", "5", "6")

# Expected frequencies (equal probability for a fair die)
expected_prob <- rep(1/6, 6)

# Step 1: Visualize the Data
# Create a bar plot
barplot(observed, 
        main = "Observed Frequencies of Dice Rolls",
        xlab = "Dice Value", ylab = "Frequency",
        col = "lightgreen")

# Add a horizontal line for the expected frequency
abline(h = sum(observed)/6, col = "red", lwd = 2)
legend("topright", legend = "Expected Frequency", col = "red", lwd = 2)

# Step 2: Perform the Chi-square Goodness of Fit Test
chi_gof_result <- chisq.test(observed, p = expected_prob)
print(chi_gof_result)

# ===== Example 6: Fisher's Exact Test (Treatment Effectiveness) =====
# Create a 2x2 contingency table
treatment_data <- matrix(c(9, 3, 2, 6), nrow = 2, byrow = TRUE)
rownames(treatment_data) <- c("Treatment", "Control")
colnames(treatment_data) <- c("Improved", "Not Improved")
print(treatment_data)

# Step 1: Visualize the Data
# Create a mosaic plot
mosaicplot(treatment_data, 
           main = "Treatment Effectiveness",
           color = c("lightgreen", "lightcoral"),
           shade = FALSE)

# Step 2: Perform Fisher's Exact Test
fisher_result <- fisher.test(treatment_data)
print(fisher_result)

# ===== Generate a Larger Dataset for Practice =====
# Create a dataset for a market research study
set.seed(123)  # For reproducibility
n <- 500

# Generate demographic and purchasing data
market_data <- data.frame(
  id = 1:n,
  age_group = factor(sample(c("18-24", "25-34", "35-44", "45-54", "55+"), n, replace = TRUE, 
                            prob = c(0.15, 0.25, 0.25, 0.20, 0.15))),
  gender = factor(sample(c("Male", "Female"), n, replace = TRUE)),
  income_level = factor(sample(c("Low", "Medium", "High"), n, replace = TRUE, 
                               prob = c(0.3, 0.5, 0.2))),
  education = factor(sample(c("High School", "College", "Graduate"), n, replace = TRUE, 
                            prob = c(0.4, 0.4, 0.2))),
  product_category = factor(sample(c("Electronics", "Clothing", "Home", "Beauty", "Food"), n, replace = TRUE)),
  purchase_amount = numeric(n),
  satisfaction = numeric(n),
  frequency = numeric(n)
)

# Generate purchase amount based on income level and product category
for (i in 1:nrow(market_data)) {
  # Base amount by income level
  if (market_data$income_level[i] == "Low") {
    base_amount <- runif(1, 10, 100)
  } else if (market_data$income_level[i] == "Medium") {
    base_amount <- runif(1, 50, 200)
  } else {
    base_amount <- runif(1, 100, 500)
  }
  
  # Adjust by product category
  if (market_data$product_category[i] == "Electronics") {
    market_data$purchase_amount[i] <- base_amount * runif(1, 1.5, 3)
  } else if (market_data$product_category[i] == "Clothing") {
    market_data$purchase_amount[i] <- base_amount * runif(1, 0.5, 1.5)
  } else if (market_data$product_category[i] == "Home") {
    market_data$purchase_amount[i] <- base_amount * runif(1, 1, 2)
  } else if (market_data$product_category[i] == "Beauty") {
    market_data$purchase_amount[i] <- base_amount * runif(1, 0.3, 1)
  } else {
    market_data$purchase_amount[i] <- base_amount * runif(1, 0.2, 0.8)
  }
}

# Round purchase amounts to 2 decimal places
market_data$purchase_amount <- round(market_data$purchase_amount, 2)

# Generate satisfaction scores (1-10)
market_data$satisfaction <- sample(1:10, n, replace = TRUE, 
                                   prob = c(0.02, 0.03, 0.05, 0.07, 0.10, 0.15, 0.20, 0.18, 0.12, 0.08))

# Generate purchase frequency (times per month)
market_data$frequency <- sample(0:10, n, replace = TRUE, 
                                prob = c(0.10, 0.15, 0.20, 0.15, 0.12, 0.10, 0.08, 0.05, 0.03, 0.01, 0.01))

# View the first few rows of the dataset
head(market_data)

# Summary statistics
summary(market_data)

# Correlation between purchase amount, satisfaction, and frequency
cor_subset <- cor(market_data[, c("purchase_amount", "satisfaction", "frequency")])
print(cor_subset)

# Visualize the correlation
corrplot(cor_subset, method = "circle", type = "upper", 
         tl.col = "black", addCoef.col = "black")

# Chi-square test for association between gender and product category
gender_product_table <- table(market_data$gender, market_data$product_category)
print(gender_product_table)
chi_gender_product <- chisq.test(gender_product_table)
print(chi_gender_product)

# Visualize the association
mosaicplot(gender_product_table, 
           main = "Product Category by Gender",
           color = c("lightblue", "lightpink"),
           shade = FALSE)

# Chi-square test for association between age group and product category
age_product_table <- table(market_data$age_group, market_data$product_category)
print(age_product_table)
chi_age_product <- chisq.test(age_product_table)
print(chi_age_product)

# Visualize the association
mosaicplot(age_product_table, 
           main = "Product Category by Age Group",
           color = rainbow(5),
           shade = FALSE)

# Save the dataset for future use
write.csv(market_data, "market_research_data.csv", row.names = FALSE)

# Print a message indicating the script has completed
cat("Module 3 script has completed successfully!\n")
