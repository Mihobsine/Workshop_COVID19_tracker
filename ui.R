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
                               # Step 3 - Add selectInput here for changing the data
                               # of the heatmap and to select a day
                             ),
                             mainPanel(h4(" Map"), leafletOutput("myMap",  height = 800))
                           )),
                 tabPanel("Plot",
                          plotOutput("plot")
                 )
)

shinyApp(ui, server, options = list(height = 1080))