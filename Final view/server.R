##### server.R



server <- shinyServer(function(input, output, session) {
  
  
  pal <- colorNumeric(palette = "Oranges", domain = NULL)
  
  output$myMap <- renderLeaflet({
    
    covidData <- filter(covidData, jour == input$jour)
    
    departements <- sp::merge(departements, covidData, by.x = "code", by.y = "dep")
    
    leaflet(departements) %>% addTiles() %>%
      addPolygons(
        fillColor = ~pal(log10(departements@data$dc)),
        popup = paste(paste0("<strong>Departement : </strong>", departements$nom),
                      paste0("<strong>Personnes actuellement hospitalisees : </strong>", departements$hosp),
                      paste0("<strong>Personnes actuellement en reanimation : </strong>", departements$rea),
                      paste0("<strong>Personnes total gueries: </strong>", departements$rad),
                      paste0("<strong>Personnes total decedees: </strong>", departements$dc),
                      sep = "<br>"),
        color = "#BDBDC3",
        fillOpacity = 0.8,
        weight = 1)
  })
  
  output$plot <- renderPlot({
     ggplot(plotData, (aes(jour))) +
              geom_line(aes(y=hosp), colour="blue") +
              geom_line(aes(y=dc), colour="red") +
              geom_line(aes(y=rea), colour="orange") +
              geom_line(aes(y=rad), colour="green") +
              ylab("Nombre de personnes") + xlab("Temps") + theme_bw()
  })
  
  
  
})