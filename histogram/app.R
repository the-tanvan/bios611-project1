#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Data Preparation

listings = read.csv("derived_data/listings.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Asheville Airbnbs"),

    # Sidebar with a slider input for number of bins 
    selectInput(inputId="channel1",label="Choose Channel",choices = c("Houses"="Houses",
                                                                       "Townhomes"="Townhomes"),
                selected = "BC6",multiple = F),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        
        #Filter data
        analysis = listings %>% filter(property_type=input$channel1)
        
        p = ggplot(analysis,aes(x=price)) + 
            geom_histogram(bins=40,fill="#FF585D") + 
            labs(x="",y="Count",title="Histogram of Price for Airbnb Listings") +
            theme(
                axis.line=element_line(color="black",size=.3),
                panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(),
                panel.background = element_rect(fill = "transparent",colour = NA),
                plot.background = element_rect(fill = "transparent",colour = NA),
                plot.title = element_text(hjust=0.5)
            )
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

