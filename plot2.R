library(dplyr)
library(lubridate)

## Load Data from File
data <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?') %>% 
  tbl_df %>%
  mutate(Date = dmy(Date))

## Filter only the data that is going to be used
## 2007-02-01 and 2007-02-02
data <- filter(data, Date == dmy('1/2/2007') | Date == dmy('2/2/2007'))

## Create column DateTime
data <- mutate(data, DateTime = ymd_hms(paste(Date, Time)))

## Plot 2
png(file = 'plot2.png')
plot(data$DateTime, data$Global_active_power,
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (killowatts)')
dev.off()
