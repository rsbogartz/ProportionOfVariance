library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
   
   	zx <- rnorm(75)
   	
    zy <- input$decimal*zx + (1 - abs(input$decimal))*rnorm(75)
    
 plot(zx, zy, xlim=c(-4, 4), ylim = c(-4, 4), main = "Variance of zy = variance of predicteds + variance of residuals" )
 
 reg <- lm(zy ~ zx)
  abline(reg)
 
 points(zx, predict(reg), col = "red", pch = 19)
 
 text(0, -3.5, paste("var(pred)/(var(pred)+var(residuals)) = prop. var acctd for = ", as.character(round(cor(zx,zy)^2,3)))    )      
 
 text(-2, -3, paste( "var(predicted) = ",   
 as.character( round(var(predict(reg)) ,3)
 ) )  )   
 
 text(2, -3, paste( "var(residuals) = ",   
 as.character( round(var(residuals(reg)) ,3)
 ) )  ) 
 
 text(0, -4, paste( "var(y) = var(pred) + var(residuals) = ",   
 as.character( round(var(zy) ,3)
 ) )  )   
 

 
 })
  
})

