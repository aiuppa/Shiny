#introduction to shiny dashboard

#install.packages("shinydashboard")
library("shinydashboard")
library("shiny")

#UI
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input, output){}

shinyApp(ui, server)