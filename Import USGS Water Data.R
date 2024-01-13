### Import USGS Water Data

require(waterData)
require(lubridate)

fonty <- importDVs("09211200", #select station
                   code = "00060", #select streamflow data
                   stat = "00003", sdate = "2020-01-01", edate = "2020-12-31") #select data date range

fontyt <- importDVs("09211200", code = "00010", #select temperature data
                    stat = "00003", sdate = "2020-01-01", edate = "2020-12-31")

fonty$dates <- ymd(fonty$dates) #format dates
fontyt$dates <- ymd(fontyt$dates) #format dates

fonty <- merge(fonty, fontyt, by = "dates") #merge dataframes
colnames(fonty)[colnames(fonty) == "val.y"] <- "temp"
colnames(fonty)[colnames(fonty) == "val.x"] <- "discharge"


ggplot(fonty, aes(dates, discharge, color = "discharge")) + geom_line() + 
  xlab("Date") + ylab("Discharge") + 
  labs(title = "Green River at Fontenelle",
    subtitle = "2020 Streamflow (cfs)", )
  



