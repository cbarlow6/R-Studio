install.packages("shiny") # install the package
library(shiny) # load the package into R

my_ui <- fluidPage(
  radioButtons(inputId = "radio" ,
                 choices = c(10, 20, 35, 50),
                 selected = 20),
  checkboxGroupInput(inputID = "checkbox",
                     label = "My checkbox: ",
                     choices = c("blue", "red", "green")),
  sliderInput(inputId = "slider",
              label = "My slider:",
              min = 0, max = 100, value = 50),
  
  numericInput(inputId = "numeric",
               label = "My numeric input",
               min = 0, max = 100, 
               value = 50)
)
my_server <- function(input, output) {}
shinyApp(ui = my_ui, server = my_server)


my_ui <- fluidPage(
  # Put each argument in a separate line for readability
  selectInput(inputId = "n_breaks",   # Comma between arguments
              label = "Number of bins in histogram (approximate):",
              choices = c(10, 20, 35, 50),
              selected = 20), # Comma between UI elements
  
  plotOutput(outputId = "main_plot")
  
  # Add as many UI elements as you like; just separate each by a comma
) 

my_server <- function(input, output) {} 
shinyApp(ui = my_ui, server = my_server)

server <- function(input, output) {
  output$main_plot <- renderPlot({
    hist(iris$Petal.Length, 
         # input$n_breaks controls this value for breaks
         breaks = as.numeric(input$n_breaks),  
         main="Iris Petal Length" )
  }) 
}

my_ui <- fluidPage(
  sliderInput(inputId = "n_breaks",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  plotOutput("main_plot"), # first output
  verbatimTextOutput("stats") # second output
)

my_server <- function(input, output) {
  output$main_plot <- renderPlot({
    hist(iris$Petal.Length, 
         breaks = as.numeric(input$n_breaks), # depends on the input
         main="Iris Petal Length" )
  })
  output$stats <- renderPrint({
    summary(iris$Petal.Length)  # this part does not depend on the input
  })
}

shinyApp(ui = my_ui, server = my_server)