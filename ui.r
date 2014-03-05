library(shiny)

#===========================================#
shinyUI(pageWithSidebar(
  headerPanel("CSV Viewer"),
  sidebarPanel(
    fileInput('file1', 'Choose CSV File',
              accept=c('array','integer','numeric','text/csv','.txt'))
)
,
  mainPanel(
    plotOutput('contents')

  )
))
