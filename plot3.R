# 3 - Of the four types of sources indicated by the \color{red}{\verb|type|}type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#load data

SCC <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#subset data

baltimoreNEI <- subset(NEI, NEI$fips == 24510 )
baltimoreNEI2 <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)

#plot data

ggplot(baltimoreNEI2, aes(year, Emissions, col = type)) + geom_line() + geom_point() + ggtitle("Baltimore's Total PM2.5 Emissions by Year and Type") + xlab("Year") + ylab("Total PM2.5 Emissions")
