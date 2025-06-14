## Introduction to Chi-square Tests

Chi-square tests are used to analyze categorical data and determine if there is a significant association between categorical variables.

There are two main types of chi-square tests:
1. **Chi-square test of independence**: Tests if there is a relationship between two categorical variables
2. **Chi-square goodness of fit test**: Tests if the observed frequency distribution differs from the expected distribution

### Assumptions for Chi-square Tests

1. Data is randomly sampled from the population
2. Observations are independent
3. Categories are mutually exclusive
4. Expected frequencies are at least 5 in each cell (for small tables)

### Interpretation

If the p-value from the chi-square test is less than the significance level (e.g., 0.05), we reject the null hypothesis and conclude that there is a significant association between gender and course selection. Cramer's V helps us understand the strength of this association:
- 0.1: Small effect
- 0.3: Medium effect
- 0.5: Large effect

### Interpretation

If the p-value from the chi-square goodness of fit test is less than the significance level (e.g., 0.05), we reject the null hypothesis and conclude that the die is not fair.

## Fisher's Exact Test for Small Sample Sizes

When the sample size is small and the expected frequencies are less than 5 in some cells, Fisher's exact test is more appropriate than the chi-square test.

### Interpretation

If the p-value from Fisher's exact test is less than the significance level (e.g., 0.05), we reject the null hypothesis and conclude that there is a significant association between the treatment and improvement.

## Reporting Correlation and Chi-square Results

### Reporting Correlation Results

When reporting correlation results, include:
1. The type of correlation used (Pearson, Spearman, or Kendall)
2. The correlation coefficient (r, ρ, or τ)
3. The p-value
4. The sample size (n)
5. A brief interpretation


### Reporting Chi-square Results

When reporting chi-square results, include:
1. The type of chi-square test used (independence or goodness of fit)
2. The chi-square statistic (χ²)
3. The degrees of freedom (df)
4. The p-value
5. The effect size (e.g., Cramer's V)
6. A brief interpretation
