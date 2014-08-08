# Exploritory Data Analysis, Project 1 Plot 2

#Note: The Date range for this assignment is 2007-02-01 - 2007-02-02

dataDir <- "./"
dataFileName <- "household_power_consumption.txt"
dataFile <- paste(dataDir, dataFileName, sep = "")
outputFile <- "plot2.png"

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

# Save plot as 480 x 480 PNG file (480 x 480 is the default of the png function)
png(file = outputFile)

# Create the plot
# Create blank plot
#par( mar = c(5.1, 4.1, 4.1, 2.1)) # Default settings
par( mar = c(5.1, 4.1,2,0), , bg = "transparent")

with(dfPowerDtRange, plot(Time, Global_active_power, xlab = "",
                          cex.axis = 1.0, cex.lab = 1.0,
                          ylab = "Global Active Power (kilowatts)", type = "n"))
# Add lines
with(dfPowerDtRange, lines(Time, Global_active_power,))

# Close png file
dev.off()

