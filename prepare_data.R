# In this file, write the R-code necessary to load your original data file
# (e.g., an SPSS, Excel, or SAS-file), and convert it to a data.frame. Then,
# use the function open_data(your_data_frame) or closed_data(your_data_frame)
# to store the data.

library(worcs)
df <- read.csv("data.csv", stringsAsFactors = FALSE)
df <- df[, c("sex", grep("^a.sup", names(df), value = TRUE), grep("de", names(df), value = TRUE))]
closed_data(df)

# Simulate data from the lavaan model, otherwise lavaan does not converge on simulated data
source("manuscript/model_syntax.R")
library(lavaan)
model <- sem(syntax, data = df, missing = "fiml", group = "sex")
df_sim <- simulateData(partable(model), sample.nobs = c(282, 215))
df_sim$sex <- factor(df_sim$group, labels = c("Boy", "Girl"))
df_sim$group <- NULL
write.csv(df_sim, "synthetic_df.csv", row.names = FALSE)
worcs:::store_checksum("synthetic_df.csv", entry_name = "synthetic_df.csv")