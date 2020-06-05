#Files for all global values of the app
library(dplyr)
library(geojsonio)
library(lubridate)

# Open the departements geojson
departements <- geojsonio::geojson_read("departements.geojson", what = "sp")

covidData <- read.csv("donnees-hospitalieres-covid19-2020-05-15-19h00.csv", sep = ';')

covidData <- filter(covidData, sexe == 0)

plotData <- covidData %>% group_by(jour) %>% summarise( hosp = sum(hosp), rea = sum(rea), rad = sum(rad), dc = sum(dc))

plotData$jour = ymd(plotData$jour)
