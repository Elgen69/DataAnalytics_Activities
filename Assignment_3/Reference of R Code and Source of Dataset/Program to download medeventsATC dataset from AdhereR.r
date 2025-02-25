# Load the required package
library(AdhereR)

# Load the data from the AdhereR package
data("medevents", package = "AdhereR")

# Save the data to a CSV file
write.csv(med.events.ATC, "medeventsATC.csv", row.names = FALSE)
