# Preliminary analysis of inflammation in arthritis patients

# Load data (no headers, CSV)
data <- read.csv(file = "data/inflammation-01.csv",
                 header = FALSE)

# Calculate average inflammation by patient and day
avg_inflammation_patient <- apply(data, 1, mean)
avg_inflammation_day <- apply(data, 2, mean)

# Plot data summaries
# Average inflammation by patient/day
plot(avg_inflammation_patient)
plot(avg_inflammation_day)

# Maximum inflammation per day
max_inflammation_day <- apply(data, 2, max)
plot(max_inflammation_day)

# Minimum inflammation per day
plot(apply(data, 2, min))

# Histogram average patient inflammation
hist(avg_inflammation_patient, breaks=seq(5, 8, by=0.2))

# Plot standard deviation of inflammation across all patients each day
sd_inflammation_day <- apply(data, 2, sd)
plot(sd_inflammation_day)

hist(avg_inflammation_day, breaks=seq(0, 14, by=1))
