# Install the TrialEmulation package (if not already installed)
install.packages("TrialEmulation")

# Load the TrialEmulation package
library(TrialEmulation)

# Load the dataset
data("data_censored")

# Show the first few rows to confirm the dataset is loaded
head(data_censored)

# Save the dataset as a CSV file in your current working directory
write.csv(data_censored, "data_censored.csv", row.names = FALSE)

# Print the working directory so you know where the file is saved
getwd()
