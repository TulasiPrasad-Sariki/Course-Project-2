library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr)

setwd("~/Downloads/exdata_data_NEI_data/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "./Plot1.png", width = 480, height = 480, units = "px")
if (!"totalEmissions" %in% ls()) {
  totalEmissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")
}
plot(totalEmissions, type = "b", pch = 13, col = "red", xlab = "Year", main = expression('Total PM'[2.5]*" Emissions in the United States from 1999 to 2008"), ylab = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()
