

## Download file and unzip
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile
              = "exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")

## Set classes of data to be read in
classes = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

## Read in data file
p1_df <- read.table("household_power_consumption.txt"
                    , sep = ";"
                    , colClasses = classes
                    , header = T
                    , na.strings = "?")


## Convert Date to date and time to date and time
p1_df$Time <- strptime(paste(p1_df$Date, p1_df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
p1_df$Date <- as.Date(p1_df$Date, "%d/%m/%Y")

## Filter for only "2007-02-01", "2007-02-02"
p1_dfSample <- p1_df[p1_df$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

## Generate png of plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")

        with(p1_dfSample, plot(Time, Global_active_power, type = "n"
                               , xlab = ""
                               , ylab = "Global Active Power (kilowatts)"
                               )
             )
        with(p1_dfSample, lines(Time, Global_active_power))

#dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
