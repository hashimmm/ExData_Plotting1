household_table <- read.table('C:/Users/hashim/Downloads/coursera/exploratory data analysis/ass1/household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

household_table['Date'] <- as.Date(household_table[,'Date'], format="%d/%m/%Y")

needed_data <- subset(household_table, Date >= "2007-02-01" & Date <= "2007-02-02") 

png(filename='plot1.png')

hist(needed_data$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()
