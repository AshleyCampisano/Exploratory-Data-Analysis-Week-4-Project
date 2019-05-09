# 6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

#load data into R

SCC <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#subset data

BALT_LA_motors <- subset(NEI, NEI$fips %in% c("24510", "06037") & NEI$type == "ON-ROAD")
BALT_LA_motors_grp <- aggregate(Emissions ~ year + fips, BALT_LA_motors, sum)

#plot data

ggplot(BALT_LA_motors_grp, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle("Motor Vehicle PM2.5 Emissions by Year for Baltimore and Los Angeles") +
  xlab("Year") +
  ylab("PM2.5 Motor Vehicle Emissions") +
  scale_color_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))
