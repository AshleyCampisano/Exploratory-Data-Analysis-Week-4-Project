# 2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#Load data

SCC <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#subset data

baltimoreNEI <- subset(NEI, NEI$fips == 24510 )
baltimoreNEItotal <- aggregate(Emissions ~ year, baltimoreNEI, sum)

#plot data

plot(baltimoreNEItotal$year, baltimoreNEItotal$Emissions,xlab = "Year", ylab = "PM2.5 Emissions", 
     main = "Total PM2.5 Emissions From Baltimore by Year", type = "o", col = "dark blue" )
