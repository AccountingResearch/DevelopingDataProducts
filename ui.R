#Loading required library
   library(shiny)

#Creating the user interface
   shinyUI(pageWithSidebar(
    
#Creating the title
   headerPanel("Impact of Vehicle Characteristics on Fuel Efficiency"),
    
#Creating the sidebar where vehicle variables and whether to include outliers can be selected
   sidebarPanel(
      selectInput("variable", "Vehicle Variable:",
         list("Number of Cylinders"="cyl","Number of Gears"="gear","Transmission Type"="am")),
         checkboxInput("outliers","Display Outliers",FALSE),
      "Supporting Documentation: This Shiny app displays graphically how fuel efficiency varies
      with different vehicle characteristics. The data for this app was obtained from the mtcars
      dataset included in the R datasets library. Select a vehicle variable of your choice using
      the dropdown box. If you wish to include outliers, check the Display Outliers box.
      Currently, only the Number of Cylinders variable has fuel efficiency outliers."
   ),
    
#Creating the display label, graph, and supporting documentation
   mainPanel(h3(textOutput("Label")),plotOutput("EfficiencyGraph"))

   ))