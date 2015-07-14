library(shiny)
require(rCharts)
require(ggplot2)

shinyServer(
  function(input, output) {
    final_fit = lm(formula = mpg ~ factor(am) + wt + factor(cyl) + hp, data = mtcars)
    dat = fortify(lm(formula = mpg ~ factor(am) + wt + factor(cyl) + hp, data = mtcars))
    names(dat) = gsub('\\.', '', names(dat))
    
    p1 = rPlot(resid ~ fitted, data=dat, type="point")
    
    make_frame= reactive({
      data.frame(am = input$am, 
                          wt = input$wt,
                          cyl = input$cyl,
                          hp = input$hp)
      })
    
    output$mpg = renderText({
        test_set = make_frame()
        mpg = predict(final_fit, test_set)  
        mpg
      })
    output$plot = renderPlot(plot(final_fit))
  }
)
