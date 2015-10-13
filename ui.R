library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Proportion of variance accounted for"),
  
  # Sidebar with a slider input for the number of means
  sidebarLayout(
    sidebarPanel(
      sliderInput("decimal",
                    "Correlation Coefficient:",
                  min = -1,
                  max = 1,
                  value = .2,
                  step = .05)
   
    ),
    
 

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
   )
 ))
