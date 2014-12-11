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

## Plot 3
png(file = 'plot3.png')
plot(data$DateTime,
     data$Sub_metering_1,
     type = 'n',
     xlab = '',
     ylab = 'Energy sub metering')
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = 1,
       col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
