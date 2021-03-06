# Exploritory Data Analysis, Project 1 Plot 3

#Note: The Date range for this assignment is 2007-02-01 - 2007-02-02

dataDir <- "./"
dataFileName <- "household_power_consumption.txt"
dataFile <- paste(dataDir, dataFileName, sep = "")
outputFile <- "plot3.png"

# Read data, seperator = ; , NA = ?
dfPowerFull <- read.table(dataFile, header = TRUE, sep = ";", na.strings = "?",
                          as.is = TRUE)

# Convert date to type date
dfPowerFull <- transform(dfPowerFull, Date = as.Date(Date, format = "%d/%m/%Y"))

# Create a data frame with just the date range we want, 2007-02-01 - 2007-02-02
dfPowerDtRange <- subset(dfPowerFull, Date =="2007-02-01" | Date =="2007-02-02")

# Convert time to POSIXlt, which inludes the date
dfPowerDtRange <- transform(dfPowerDtRange, Time = 
            strptime(paste(Date, Time, sep = " "),format = "%Y-%m-%d %H:%M:%S"))

# Save plot as 480 x 480 PNG file (480 x 480 is the default of the PNG function)
png(file = outputFile)

# Create the plot
# Create blank plot, use sub_metering_1 becasue it has the largest values.
#par( mar = c(5.1, 4.1, 4.1, 2.1)) # Default settings
par( mar = c(5.1, 4.1, 4.1, 2.1), bg = "transparent")

with(dfPowerDtRange, plot(Time, Sub_metering_1, xlab = "",
                          cex.axis = 1.0, cex.lab = 1.0,
                          ylab = "Energy sub metering", type = "n"))

# Add 3 sets of color coded lines, 1 for each sub_metering column.
with(dfPowerDtRange, lines(Time, Sub_metering_1, col = "black"))
with(dfPowerDtRange, lines(Time, Sub_metering_2, col = "red"))
with(dfPowerDtRange, lines(Time, Sub_metering_3, col = "blue"))

# Add legend
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2",
                            "Sub_metering_3"),col =c("black", "red", "blue"),
       cex = 1.0, xjust = 0)

# Close png file
dev.off()

