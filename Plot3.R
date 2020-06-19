library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
if (!"BaltimoreData" %in% ls()) {
  BaltimoreData <- NEI[NEI$fips == "24510", ]
}
if (!"BData" %in% ls()) {
  BData <- ddply(BaltimoreData, .(type, year), summarize, TotalEmissions = sum(Emissions))
}
png(filename = "Plot3.png", width = 500, height = 480, units = "px")
ggplot(BData, aes(year, TotalEmissions, colour = type)) + geom_line() + geom_point() + labs(title = expression('Total PM'[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008"), x = "Year", y = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()
