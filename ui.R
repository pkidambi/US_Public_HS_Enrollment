library(shiny)
library(xlsx)
library(openintro)
require(markdown)
#setwd("C:\\Users\\CECS-INT\\Desktop\\Coursera\\17.MakingDataProducts\\US_Public_HS_Enrollment\\")

# load and preprocess data 
mydata <- read.xlsx2("data_products.xlsx","Data")
mydata$State <- abbr2state(mydata$State)
states <- sort(unique(as.character(mydata$State)))
regions <- unique(as.character(mydata$Region))
stu_type <- unique(as.character(mydata$Type))


# UI code starts here
shinyUI(pageWithSidebar(
  headerPanel("US Public High School Enrollment"),

  # creat a dropdown of US states  
  sidebarPanel(
    h3('Select State of interest'),
    selectInput('cb1', 'States', states), 
    # create a group radio button of stydent type
    h3('Select Student type'),
   radioButtons('cb2', 'Student Type', stu_type),
   plotOutput("st")
   
  ),
  
  # plot all the output graphs, and create a table with download option in the data tab
  mainPanel(
    tabsetPanel(
      
      # Data by state
      tabPanel(p(icon("clock"), "Enrollment"),
   
               h3('Select Time Frame'),
               sliderInput("si1","Year",min=1996, max = 2027, value = c(2007,2022), sep = ""),
    
  #  plotOutput("enrollment_all"),
    plotOutput("enrollment_9"),
    plotOutput("enrollment_10"),
    plotOutput("enrollment_11"),
    plotOutput("enrollment_12")
      ),
    tabPanel(p(icon("table"), "Data"),
    downloadButton('downloadData', 'Download'),
    dataTableOutput(outputId="sel_mydata")
    ),
  
  tabPanel(p(icon("cog"), "About"),
        
           includeMarkdown("about.md"))
  )
  
  )
))
