## Code for Yuxuan's Gaussian Copula model

# Set working directory
setwd("~/Desktop/mimic3-research/code")

# Import the GC package and other packages
library(mixedgcImp)
library(tibble)
library(dplyr)
library(MASS)

# Import the dataset
pat <- as_tibble(read.csv("../data/Diabetes_Numerical.csv"))
pat

# Check data types
sapply(pat, class)
age_ordinal <- ordered(pat$ORDINAL_AGE, levels = 1:10, 
                       labels = c(1:10))
class(age_ordinal)
pat$ORDINAL_AGE <- age_ordinal

# Generate training data
X_origin <- pat[, -c(1, 2)]
X_predictors <- pat[, -c(1, 2, 3)]
los <- X_origin$HOSPITALIZATION

# Fit the GC model
X_fit <- impute_mixedgc_ppca(X_origin, early.stop = TRUE, verbose = TRUE)
X_fit2 <- impute_mixedgc_ppca(X_predictors, early.stop = TRUE, verbose = TRUE)

