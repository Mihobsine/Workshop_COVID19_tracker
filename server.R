##### server.R



server <- shinyServer(function(input, output, session) {
  
  # Step 2 - Create a color palette for the map here
  
  
  # Step 2 - Put a leaflet in the output value
  output$myMap <- renderLeaflet({
    
  })
  
  # Step 4 - Put a plot in the output value
  output$plot <- renderPlot({
    
  })
  
  
  
})