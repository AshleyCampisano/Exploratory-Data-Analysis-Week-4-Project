# 1 - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

#load data
SCC <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#plot data

NEItotal <- aggregate(Emissions ~ year, NEI, sum)

plot(NEItotal$year, NEItotal$Emissions/10^6, xlab = "Year", ylab = "PM2.5 Emissions (10^6)", 
     main = "Total PM2.5 Emissions From All Sources by Year", type = "o", col = "lime green")
