shinyUI(pageWithSidebar(
  headerPanel("Predict The Miles per Gallon of Your Next Car"),
  sidebarPanel(
    numericInput(inputId="wt", label = "Weight (lb/1000):", value=2.0),
    numericInput(inputId="hp", label = "Gross Horsepower:", value = 200),
    radioButtons("am", "Transmission Type:",
                 c("Automatic" = "0",
                   "Manual" = "1")),
    radioButtons("cyl", "Number of Cylinders:",
                 c("4 Cylinders" = "4",
                   "6 Cylinders" = "6",
                   "8 Cylinders" = "8"))
  ),
  mainPanel(
    p('Predicted Miles Per Gallon'),
    textOutput('mpg'),
    imageOutput('plot')
  )
))