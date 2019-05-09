# 5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#load data

SCC <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#subset data

baltimore_motor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimore_motor_grp <- aggregate(Emissions ~ year, baltimore_motor, sum)

#plot data

ggplot(baltimore_motor_grp, aes(year, Emissions)) +
  geom_line(col = "lime green") +
  geom_point(col = "lime green") + 
  ggtitle("Baltimore Motor Vehicle PM2.5 Emissions by Year") +
  xlab("Year") +
  ylab("PM2.5 Motor Vehicle Emissions")
