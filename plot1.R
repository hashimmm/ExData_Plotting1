if (!file.exists('working_data.RDS')) {
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                  method='curl', destfile='working_data.zip')
    unzip('working_data.zip')


    working_data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

    working_data['Date'] <- as.Date(working_data[,'Date'], format="%d/%m/%Y")

    needed_data <- subset(working_data, Date >= "2007-02-01" & Date <= "2007-02-02")

    saveRDS(needed_data, file = "working_data.RDS")
} else {
    needed_data <- readRDS('working_data.RDS')
}

png(filename='plot1.png')

hist(needed_data$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()
