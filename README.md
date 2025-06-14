# Module 3a: Chi-square Tests and Fisher's Exact Test

This repository provides analysis scripts and examples for conducting **Chi-square tests** (test of independence and goodness of fit) and **Fisher's Exact Test** in R, with supporting HTML outputs. These tests are essential for analyzing categorical data in biological, social, and medical sciences.

---

## Table of Contents

- [Introduction](#introduction)
- [Types of Chi-square Tests](#types-of-chi-square-tests)
- [Assumptions](#assumptions)
- [Interpretation of Results](#interpretation-of-results)
- [Fisher's Exact Test](#fishers-exact-test)
- [Reporting Results](#reporting-results)
- [Usage](#usage)
- [References](#references)

---

## Introduction

Chi-square tests are used to analyze categorical data and determine if there is a significant association between categorical variables, or if observed data fits an expected distribution.

---

## Types of Chi-square Tests

### Chi-square Test of Independence
Tests if there is a relationship between two categorical variables (e.g., gender and course selection).

### Chi-square Goodness of Fit Test
Tests if the observed frequency distribution differs from the expected distribution (e.g., is a die fair?).

---

## Assumptions

- Data is randomly sampled from the population
- Observations are independent
- Categories are mutually exclusive
- Expected frequencies are at least 5 in each cell (for small tables)

---

## Interpretation of Results

### For Chi-square Test of Independence

If the p-value < significance level (e.g., 0.05), reject the null hypothesis and conclude a significant association exists.

**Effect size (Cramer's V):**
- 0.1: Small effect
- 0.3: Medium effect
- 0.5: Large effect

### For Chi-square Goodness of Fit Test

If the p-value < significance level (e.g., 0.05), reject the null hypothesis and conclude that the observed distribution differs from the expected.

---

## Fisher's Exact Test

When sample sizes are small and expected frequencies are less than 5 in some cells, Fisher's Exact Test is preferable to the Chi-square test for analyzing categorical data.

If the p-value < significance level (e.g., 0.05), reject the null hypothesis and conclude a significant association exists.

---

## Reporting Results

### Reporting Correlation Results

Include:
- Type of correlation used (Pearson, Spearman, or Kendall)
- Correlation coefficient (r, ρ, or τ)
- p-value
- Sample size (n)
- Brief interpretation

### Reporting Chi-square Results

Include:
- Type of chi-square test used (independence or goodness of fit)
- Chi-square statistic (χ²)
- Degrees of freedom (df)
- p-value
- Effect size (e.g., Cramer's V)
- Brief interpretation

---

## Usage

1. Clone this repository:
    ```bash
    git clone https://github.com/Brig-Bayo/3a_Chi_Square_FET_analysis.git
    cd 3a_Chi_Square_FET_analysis
    ```
2. Open the R scripts (`.R`) or R Markdown (`.Rmd`) files in RStudio.
3. Run the scripts or knit the `.Rmd` files to produce HTML output.
4. Review the generated HTML files for results and interpretation.

---

## References

- Agresti, A. (2018). Statistical Methods for the Social Sciences.
- McDonald, J.H. (2014). Handbook of Biological Statistics.
- [R Documentation: chisq.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/chisq.test.html)
- [R Documentation: fisher.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/fisher.test.html)
