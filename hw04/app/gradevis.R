#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



# required packages
library(shiny)
library(ggvis)
library(dplyr)
library(stringr)

source("../code/functions.R")

new_dat <- read.csv("../data/cleandata/cleanscores.csv")


#for the first tab
grade_dat <- data.frame(table(new_dat$Grade))
names(grade_dat)[names(grade_dat) == "Var1"] <- "Grade"

gradeorder <- c('A+','A','A-','B+','B','B-','C+','C','C-','D','F')
prop <-  round(grade_dat$Freq/334,digits = 2)
grade_dat$Prop <-  prop

grade_dat <- grade_dat %>% mutate(Grade = factor(Grade, levels = gradeorder)) %>% arrange(Grade)


#for the second tab
drop_Grade <- c("X","Grade")
second_dat <- new_dat %>% select(-one_of(drop_Grade))

second_categorical <- names(second_dat)

#for the third tab
third_categorical <- names(second_dat)
selectline <- c("none","lm","loess")



# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Conditional Panels"),
  
  # Sidebar with different widgets depending on the selected tab
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected==1",
                       h3("Grades Distribution"),
                       tableOutput("table")),
      conditionalPanel(condition = "input.tabselected==2",
                       selectInput("var2", "X-axis variable", second_categorical),
                       sliderInput("width", "bin width", min =1,max = 10,value = 1)
      ),
      conditionalPanel(condition = "input.tabselected==3",
                       h3("Panel of 2nd tab"),
                       selectInput("var3", "X-axis variable", third_categorical, selected = "Test1"),
                       selectInput("var4", "Y-axis variable", third_categorical, selected = "Overall"),
                       sliderInput("opacity", "Opacity",
                                   min = 0, max = 1, value = 0.5),
                       radioButtons("line","Show line", selectline)
      )
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Barchart", value = 1, 
                           ggvisOutput("barchart")),
                  tabPanel("Histogram", value = 2, 
                           ggvisOutput("histogram"),
                           h5("Summary Statistics"),
                           verbatimTextOutput("summary")),
                  tabPanel("Scatterplot", value = 3, 
                           ggvisOutput("scatterplot"),
                           h5("Correlation"),
                           verbatimTextOutput("corr")),
                  id = "tabselected")
    )
  )
)


# Define server logic
server <- function(input, output) {
  
  # Barchart (for 1st tab)
  vis_barchart <- reactive({
    # Normally we could do something like ggvis(x = ~mpg),
    # but since the inputs are strings, we need to do a little more work.
    grade_dat %>% 
      ggvis(~grade_dat$Grade, ~grade_dat$Freq , fill := "blue")  %>%
      layer_bars(stroke := 'white', width = input$width,
                 fillOpacity := 1, fillOpacity.hover := 1) %>%
      add_axis("x", title = "Grade") %>% 
      add_axis("y", title = "frequency") %>% 
      scale_ordinal('x', domain = c("A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "F"))
  })
  
  vis_barchart %>% bind_shiny("barchart")
  
  output$table <- renderTable({
    head(grade_dat, n = nrow(grade_dat))},
    align = "c")
  
  
  # Histogram (for 2nd tab)
  vis_histogram <- reactive({
    # Normally we could do something like ggvis(x = ~mpg),
    # but since the inputs are strings, we need to do a little more work.
    var2 <- prop("x", as.symbol(input$var2))
    
     new_dat %>% 
      ggvis(x = var2, fill := "grey") %>% 
      layer_histograms(stroke := 'white',
                       width = input$width)
  })
  
  vis_histogram %>% bind_shiny("histogram")
  
  output$summary <- renderPrint({
    column_data <- second_dat[[input$var2]]
    column_summary_stats <- summary_stats(column_data)
    print_stats(column_summary_stats)
  })
  
  #scatterplot for tab3
  vis_scatter <- reactive({
    # Normally we could do something like ggvis(x = ~mpg),
    # but since the inputs are strings, we need to do a little more work.
    var3 <- prop("x", as.symbol(input$var3))
    var4 <- prop("y", as.symbol(input$var4))
    if(!(input$line == 'none')){
      second_dat %>% 
        ggvis(x = var3, y = var4) %>% 
        layer_points(fill:= "black", fillOpacity := input$opacity) %>%
        layer_model_predictions(model=input$line)
    }else{
    second_dat %>% 
      ggvis(x = var3, y = var4) %>%
      layer_points(fill:= "black", fillOpacity := input$opacity)
    }
  })
  
  vis_scatter %>% bind_shiny("scatterplot")
  
  output$corr <- renderPrint({
    cor(second_dat[[input$var3]], second_dat[[input$var4]])
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


