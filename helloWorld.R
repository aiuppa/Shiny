#okay let's right some throw-away code!!

#install.packages("shiny")
library("shiny")

#shiny apps are contained in single scripts app.R
#(historically these were separated out and new versions still support 
#separation of server and UI)
#calling the app that lives in the directory newdir/ is done by
#runApp("newdir")
runExample("01_hello")

#define UI 
ui <- fluidPage(
  titlePanel("Hello There!"),
  #define input and output for sidebar layout
  sidebarLayout(
    #define panel for inputs on sidebar
    sidebarPanel(
      #create a slider for number of bins, this is input
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50, 
                  value = 30)
    ),
    #panel to display outputs
    mainPanel(
      #create a histogram for output
      plotOutput(outputId = "distPlot")
    )
  )
)

#server setup; this will draw the histogram
server <- function(input, output){
  output$distPlot <- renderPlot({
    #Old Faithful Geyser Data
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    #call to renderPlot is wrapper for indicating histogram is
    #reactive and should re-execute automatically when input$bins changes
    hist(x, breaks = bins, col = "75AADB", border = "white",
         xlab = "Waiting time to next eruption (in minutes)",
         main = "Histogram of Waiting Times")
  })
}