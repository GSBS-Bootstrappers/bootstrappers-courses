require(readr)
require(dplyr)
library(ggplot2)

tmax = read_tsv("~/ownCloud/documents/r_course/tmax_worldTemp/data.txt", col_names = F, comment = "%")
tmin = read_tsv("~/ownCloud/documents/r_course/tmin_worldTemp/data.txt", col_names = F, comment = "%")
tavg = read_tsv("~/ownCloud/documents/r_course/tavg_worldTemp/data.txt", col_names = F, comment = "%")


tmax_meta = read_tsv("~/ownCloud/documents/r_course/tmax_worldTemp/site_detail.txt", col_names = F, comment = "%")
tmin_meta = read_tsv("~/ownCloud/documents/r_course/tmin_worldTemp/site_detail.txt", col_names = F, comment = "%")
tavg_meta = read_tsv("~/ownCloud/documents/r_course/tavg_worldTemp/site_detail.txt", col_names = F, comment = "%")

colnames(tmax) = c("Station ID", "Series Number", "Date", "Temperature (C)", "Uncertainty (C)","Observations","Time of Observation")
colnames(tmin) = c("Station ID", "Series Number", "Date", "Temperature (C)", "Uncertainty (C)","Observations","Time of Observation")
colnames(tavg) = c("Station ID", "Series Number", "Date", "Temperature (C)", "Uncertainty (C)","Observations","Time of Observation")

colnames(tmax) = gsub(" ", "_", colnames(tmax))
colnames(tmin) = gsub(" ", "_", colnames(tmin))
colnames(tavg) = gsub(" ", "_", colnames(tavg))

metaCols = "Station ID, Station Name, Latitude, Longitude, Elevation (m), Lat. Uncertainty, Long. Uncertainty, Elev. Uncertainty (m), Country, State / Province Code, County, Time Zone, WMO ID, Coop ID, WBAN ID, ICAO ID, # of Relocations, # Suggested Relocations, # of Sources, Hash"

colnames(tmax_meta) = gsub(" ", "_",unlist(strsplit(metaCols, ", ")))
colnames(tmin_meta) = gsub(" ", "_",unlist(strsplit(metaCols, ", ")))
colnames(tavg_meta) = gsub(" ", "_",unlist(strsplit(metaCols, ", ")))

tmax_meta = select(tmax_meta, one_of("Station_ID", "Station_Name", "Latitude", "Longitude", "Country", "State_/_Province_Code"))

tmax_sel = select(tmax, one_of("Station_ID", "Date", "Temperature_(C)"))
tmin_sel = select(tmin, one_of("Station_ID", "Date", "Temperature_(C)"))
tavg_sel = select(tavg, one_of("Station_ID", "Date", "Temperature_(C)"))

colnames(tmax_sel)[3] = "Temp_Max"
colnames(tmin_sel)[3] = "Temp_Min"
colnames(tavg_sel)[3] = "Temp_Avg"

temps = left_join(tmax_sel, tmin_sel, by = c("Station_ID", "Date"))
temps = left_join(temps, tavg_sel, by = c("Station_ID", "Date"))

temps$Date = as.character(temps$Date)
temps = separate(temps, Date, c("Year", "Month"), sep = c("\\."))

temps$Year = as.numeric(temps$Year)
temps$Month = as.numeric(temps$Month)

temps = mutate(temps, Month = round((Month/1000) * 12 + 0.5 ))
temps = mutate(temps, MonthName = month.name[Month])

temps = left_join(temps, tmax_meta, by = "Station_ID")

temps_usa = filter(temps, Country == "United States")

fullDataCounnts = temps_usa  %>% 
  group_by(Station_Name, Year)  %>% 
  summarise(n = n())  %>% 
  filter(n == 12) %>%
  group_by(Station_Name)  %>%  
  summarise(n = n())  %>% 
  filter(n == 10)

fullData = filter(temps_usa, Station_Name %in% fullDataCounnts$Station_Name)

fullData = separate(fullData, Station_Name, c("City", "Airport"), "/")
fullData = unite(fullData, Station_Name, City, `State_/_Province_Code`, sep = "/")

temps_usa_filtered = filter(temps_usa, Year ==2000, Station_Name %in% c("SAN FRANCISCO/INTERNATIO", "BOSTON/LOGAN INT'L ARPT"))


fullData$MonthName = factor(fullData$MonthName, levels = month.name)
plotObj = ggplot(filter(fullData), aes(x = interaction(Year, MonthName), y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_line()
plotObj = plotObj + theme(axis.text.x = element_text(family = "Helvetica", face="bold", colour="#000000", size=10, angle = 90, hjust = 1))
#now lets call print(plotObj) to generate the plot
print(plotObj)


plotObj = ggplot(filter(fullData), aes(x = interaction(Year, MonthName), y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_line() + guides(color = F)
plotObj = plotObj + theme(axis.text.x = element_text(family = "Helvetica", face="bold", colour="#000000", size=10, angle = 90, hjust = 1))
#now lets call print(plotObj) to generate the plot
print(plotObj)

fullData = mutate(fullData, Date = Year + (Month - 0.5)/12)

plotObj = ggplot(filter(fullData), aes(x = Date, y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_line() + guides(color = F)
plotObj = plotObj + theme(axis.text.x = element_text(family = "Helvetica", face="bold", colour="#000000", size=10, angle = 90, hjust = 1))
#now lets call print(plotObj) to generate the plot
print(plotObj)


plotObj = ggplot(filter(fullData, Month == 1), aes(x = Date, y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_line() + guides(color = F)
plotObj = plotObj + theme(axis.text.x = element_text(family = "Helvetica", face="bold", colour="#000000", size=10, angle = 90, hjust = 1))
#now lets call print(plotObj) to generate the plot
print(plotObj)



plotObj = ggplot(fullData, aes(x = Date, y = Station_Name, fill = Temp_Avg) ) 
plotObj = plotObj + geom_tile() 
plotObj = plotObj + theme(axis.text.x = element_text(family = "Helvetica", face="bold", colour="#000000", size=10, angle = 90, hjust = 1))
#now lets call print(plotObj) to generate the plot
print(plotObj)


fullData = filter(temps_usa, Station_Name %in% fullDataCounnts$Station_Name)
#fullData = separate(fullData, Station_Name, c("City", "Airport"), "/")
fullData = unite(fullData, Station_Name, Station_Name, `State_/_Province_Code`, sep = "/")
fullData = mutate(fullData, Date = Year + (Month - 0.5)/12)
fullData_Sel = select(fullData, Station_Name, Date, Temp_Avg)
fullData_Sel_wide = spread(fullData_Sel, Date, Temp_Avg)

stationNames = fullData_Sel_wide$Station_Name
fullData_Sel_wide = fullData_Sel_wide[,-1]
fullData_Sel_wide_mat = as.matrix(fullData_Sel_wide)
rownames(fullData_Sel_wide_mat) = stationNames

library(d3heatmap)

d3heatmap(fullData_Sel_wide_mat)

d3heatmap(fullData_Sel_wide_mat, Colv=NA)

d3heatmap(fullData_Sel_wide_mat, Colv=NA, colors = rev(RColorBrewer::brewer.pal(11,"RdBu")))

temps_usa_filtered = mutate(temps_usa_filtered, Temp_Avg_F = Temp_Avg * 1.8 + 32)


library(ggplot2)
plotObj = ggplot(temps_usa_filtered, aes(x = MonthName, y = Temp_Avg_F, group = Station_Name, fill = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_bar(stat = "identity",  position = "dodge", width = .5)
plotObj = plotObj + geom_text(aes(y = Temp_Avg_F + 2, label = Temp_Avg_F), position = position_dodge(width = .5), color = "black")
plotObj = plotObj + ylab(expression(paste("Temperature ( ", degree ~ F, " )"))) 
#now lets call print(plotObj) to generate the plot
print(plotObj)

library(ggplot2)
plotObj = ggplot(temps_usa_filtered, aes(x = MonthName, y = Temp_Avg_F, group = Station_Name, fill = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_bar(stat = "identity",  position = "dodge", width = .5)
plotObj = plotObj + geom_text(aes(y = Temp_Avg_F + 2, label = Temp_Avg_F), position = position_dodge(width = .5), color = "black")
plotObj = plotObj + ylab(expression(paste("Temperature ( ", degree ~ F, " )"))) + xlab("Month")
plotObj = plotObj + ggtitle("Year 2000")
#now lets call print(plotObj) to generate the plot
print(plotObj)



temps_usa_filtered$MonthName = factor(temps_usa_filtered$MonthName, levels = month.name)
library(ggplot2)
plotObj = ggplot(temps_usa_filtered, aes(x = MonthName, y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_ribbon(aes(ymin = Temp_Min, ymax = Temp_Max, fill = Station_Name), color = "#FFFFFF00")
plotObj = plotObj + geom_line()
plotObj = plotObj + scale_fill_brewer(palette = 1, type = "qual")
plotObj = plotObj + scale_color_brewer(palette = 1, type = "qual")
#now lets call print(plotObj) to generate the plot
print(plotObj)


temps_usa_filtered$MonthName = factor(temps_usa_filtered$MonthName, levels = month.name)
library(ggplot2)
plotObj = ggplot(temps_usa_filtered, aes(x = MonthName, y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_ribbon(aes(ymin = Temp_Min, ymax = Temp_Max, fill = Station_Name), color = "#FFFFFF00")
plotObj = plotObj + geom_line()
plotObj = plotObj + scale_fill_manual(values = RColorBrewer::brewer.pal(3, "Dark2"), 0.5)
plotObj = plotObj + scale_color_manual(values = RColorBrewer::brewer.pal(3, "Dark2"))
#now lets call print(plotObj) to generate the plot
print(plotObj)


temps_usa_filtered$MonthName = factor(temps_usa_filtered$MonthName, levels = month.name)
library(ggplot2)
plotObj = ggplot(temps_usa_filtered, aes(x = MonthName, y = Temp_Avg, group = Station_Name, color = Station_Name) ) 
plotObj = plotObj + geom_ribbon(aes(ymin = Temp_Min, ymax = Temp_Max, fill = Station_Name), color = "#FFFFFF00")
plotObj = plotObj + geom_line()
plotObj = plotObj + scale_fill_manual(values = scales::alpha(RColorBrewer::brewer.pal(3, "Dark2"), 0.5))
plotObj = plotObj + scale_color_manual(values = RColorBrewer::brewer.pal(3, "Dark2"))
#now lets call print(plotObj) to generate the plot
print(plotObj)



