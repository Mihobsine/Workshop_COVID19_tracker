###### ui.R
# Create User Interface
library(shiny)
library(dplyr)
library(leaflet)
library(sp)
library(ggplot2)
source("server.R")

ui <- navbarPage("COVID19 TRACKER",
                 tabPanel( "Map",
                  sidebarLayout(
                    sidebarPanel(
                            selectInput("col","Heatmap info:", c("hosp", "rea", "rad", "dc")),
                            selectInput("jour", "Jour:", unique(covidData$jour), selected = "2020-05-15")
                      ),
                    mainPanel(h4(" Map"), leafletOutput("myMap",  height = 800))
                  )),
                 tabPanel("Plot",
                          plotOutput("plot")
                 )
)

shinyApp(ui, server, options = list(height = 1080))