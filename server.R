#Loading required libraries
   library(shiny)
   library(datasets)

#Loading data
   FuelEfficiency<-mtcars
   FuelEfficiency$am<-factor(FuelEfficiency$am,labels=c("Automatic","Manual"))

#Plotting fuel efficiency vs. user-defined variables
   shinyServer(function(input,output){
      LabelText<-"Miles Per Gallon (y-axis) vs. Selected Vehicle Variable (x-axis)"
      PlotFormula<-reactive({paste("mpg ~", input$variable)})
      output$Label<-renderText({LabelText})
      output$EfficiencyGraph<-renderPlot({
      boxplot(as.formula(PlotFormula()),data=FuelEfficiency,outline=input$outliers)})
   })