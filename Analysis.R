# =====================================================================
# 7COM1079 Team Research and Development Project
# Group G-79-B | Dataset 12: Student Performance (student-mat.csv)
#
# Research question: Does the mean final maths grade (G3, 0-20) differ
# between students with internet access at home and students without it?
#   H0: mean G3 (internet = yes) = mean G3 (internet = no)
#   H1: mean G3 (internet = yes) != mean G3 (internet = no)
#   Two-sided test, significance level alpha = 0.05
#
# Run from the project folder:  Rscript Analysis.R > Rscript.log 2>&1
# =====================================================================

library(dplyr, warn.conflicts = FALSE)
library(ggplot2)

# ---- 1. Load the data ------------------------------------------------
students <- read.csv("student-mat.csv")
cat("Rows and columns in the raw data:", dim(students), "\n")

# ---- 2. Clean and prepare --------------------------------------------
# Keep only the two variables needed for the research question
grades <- students %>%
  select(internet, G3)

# Check for missing values and for grades outside the 0-20 scale
cat("\nMissing values per column:\n")
print(colSums(is.na(grades)))
cat("Grades outside the 0-20 scale:", sum(grades$G3 < 0 | grades$G3 > 20), "\n")

