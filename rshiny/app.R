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

# Process Command Line Arguments

args <- commandArgs(trailingOnly = TRUE);
port <- as.numeric(args[1])

# Data Preparation

listings = read.csv("/home/rstudio/derived_data/listings.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Asheville Airbnbs"),

    # Sidebar with a slider input for number of bins 
    selectInput(inputId="channel1",label="Choose Property Type",choices = c("All"="All",
                                                                      "Apartments"="Apartments",
                                                                      "Barns"="Barns",
                                                                      "Bed and breakfasts"="Bed and breakfasts",
                                                                      "Boutique hotels"="Boutique hotels",
                                                                      "Bungalows"="Bungalows",
                                                                      "Buses"="Buses",
                                                                      "Cabins"="Cabins",
                                                                      "Camper/RVs"="Camper/RVs",
                                                                      "Campsites"="Campsites",
                                                                      "Chalets"="Chalets",
                                                                      "Condominiums"="Condominiums",
                                                                      "Cottages"="Cottages",
                                                                      "Farm stays"="Farm stays",
                                                                      "Guest suites"="Guest Suites",
                                                                      "Guesthouses"="Guesthouses",
                                                                      "Hostels"="Hostels",
                                                                      "Houses"="Houses",
                                                                      "Lofts"="Lofts",
                                                                      "Others"="Others",
                                                                      "Tents"="Tents",
                                                                      "Tiny houses"="Tiny houses",
                                                                      "Townhouses"="Townhouses",
                                                                      "Treehouses"="Treehouses",
                                                                      "Yurts"="Yurts"),
                selected = "All",multiple = F),

        # Show a plot of the generated distribution
        mainPanel(
           h2("Summary of Price"),
           verbatimTextOutput("sum"),
           plotOutput("distPlot")
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$sum <- renderPrint({
        
        if(input$channel1=="All"){
            summary(listings$total_price)  
        }else{
            if(input$channel1=="Buses"){
                property="Bus"
            }else{
                property=substr(input$channel1, 1, nchar(input$channel1)-1)
            }
            analysis=listings %>% filter(property_type==property)
            summary(analysis$total_price)
        }
    })

    output$distPlot <- renderPlot({
        
        if(input$channel1=="All"){
            p = ggplot(listings,aes(x=total_price)) + 
                labs(x="Price",y="Count",title="Histogram of Price for Airbnb Listings") +
                geom_histogram(bins=30,fill="#FF585D")
        }else{
            if(input$channel1=="Buses"){
                property="Bus"
            }else{
                property=substr(input$channel1, 1, nchar(input$channel1)-1)
            }
            mytitle = paste("Histogram of Price for Airbnb Listings for",input$channel1,sep=" ")
            analysis = listings %>% filter(property_type==property)
            p = ggplot(analysis,aes(x=total_price)) + 
                labs(x="Price",y="Count",title=mytitle) +
                geom_histogram(bins=15,fill="#FF585D")
        }
        
        p = p + theme(
            axis.line=element_line(color="black",size=.3),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            panel.background = element_rect(fill = "transparent",colour = NA),
            plot.background = element_rect(fill = "transparent",colour = NA),
            plot.title = element_text(hjust=0.5)
        )
        
        p
    })
}

# Run the application 
shinyApp(ui = ui, server = server, options=list(port=port, host="0.0.0.0"))

