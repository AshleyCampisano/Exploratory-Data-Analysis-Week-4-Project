# 4 - Across the United States, how have emissions from coal combustion-related sources changed
# from 1999–2008?

#load data 

SCC <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("/Users/ashleycampisano/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#Subset data

SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC,]
total_coal <- aggregate(Emissions ~ year + type, NEI_coal, sum)

#plot data

ggplot(total_coal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle("Total PM2.5 Coal Emissions by Type and Year") +
  xlab("Year") +
  ylab("PM2.5 Coal Emissions")
  

