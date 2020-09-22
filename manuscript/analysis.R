# Load libraries
library(bain)
library(lavaan)

# Load sem syntax
source("model_syntax.R")

# Read the data
load_data()

# Run the SEM-analysis
model <- sem(syntax, data = df, missing = "fiml", group = "sex")

# Inspect model fit
fitmeasures(model, fit.measures = c("chisq", "df", "rmsea", "cfi", "tli"))

# Inspect coefficients
summary(model, ci = TRUE)

# Evaluate informative hypotheses
bain(model, "(mg, mb, fb, fg) > 0;
             (mg, mb) > (fb, fg);
             mg > mb;
             (mg, mb, fb, fg) > 0 & (mg, mb) > (fb, fg) & mg > mb")