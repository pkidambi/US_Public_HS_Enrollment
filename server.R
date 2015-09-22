options(warn=-1)
#setwd("C:\\Users\\CECS-INT\\Desktop\\Coursera\\17.MakingDataProducts\\US_Public_HS_Enrollment\\")
# load all the library dependencies 
library(xlsx)
library(shiny)
library(ggplot2)
library(maps)
library(openintro)
library(mapdata)

# read and preprocess the data
mydata <- read.xlsx2("data_products.xlsx","Data")
mydata$State <- abbr2state(mydata$State)


# server application starts here
shinyServer(function(input, output) {
  output$cb1 <- renderPrint({input$cb1})

# Filter data based on the State selection in cb1 
  sel_mydata <- reactive(mydata[mydata$State %in% input$cb1 & mydata$Type %in% input$cb2 & mydata$Year %in% c(input$si1[2]:-1:input$si1[1]),]
  
)

  # create a data table of the filtered data based on the end users choices    
 output$sel_mydata <- renderDataTable(mydata[mydata$State %in% input$cb1 & mydata$Type %in% input$cb2 & mydata$Year %in% c(input$si1[2]:-1:input$si1[1]),])


 
# plot enrollment of 9th, 10th, 11th and 12th grades based on state and type of student  
output$enrollment_9 <- renderPlot(
qplot(x=sel_mydata()$Year, y=sel_mydata()$Grade.9, fill = sel_mydata()$Type, geom="bar", stat="identity", data=sel_mydata(), position="dodge", xlab = "YEAR", main = "Grade 9 enrollment",  ylab = "# of students") + geom_text(aes(label=sel_mydata()$Grade.9), vjust=0) + theme(legend.title=element_blank())
 ) 
output$enrollment_10 <- renderPlot(
  qplot(x=sel_mydata()$Year, y=sel_mydata()$Grade.10, fill = sel_mydata()$Type, geom="bar", stat="identity", data=sel_mydata(), position="dodge", xlab = "YEAR", main = "Grade 10 enrollment",  ylab = "# of students")+ geom_text(aes(label=sel_mydata()$Grade.9), vjust=0) + theme(legend.title=element_blank())
) 
output$enrollment_11 <- renderPlot(
  qplot(x=sel_mydata()$Year, y=sel_mydata()$Grade.11, fill = sel_mydata()$Type, geom="bar", stat="identity", data=sel_mydata(), position="dodge", xlab = "YEAR", main="Grade 11 Enrollment",  ylab = "# of students") +geom_text(aes(label=sel_mydata()$Grade.9), vjust=0) + theme(legend.title=element_blank())
) 
output$enrollment_12 <- renderPlot(
  qplot(x=sel_mydata()$Year, y=sel_mydata()$Grade.12, fill = sel_mydata()$Type, geom="bar", stat="identity", data=sel_mydata(), position="dodge", xlab = "YEAR", main = "Grade 12 enrollment",  ylab = "# of students") +geom_text(aes(label=sel_mydata()$Grade.9), vjust=0) + theme(legend.title=element_blank())
) 
 
output$st <- renderPlot({
# highlight the state of interest and label it 
  map("state")
  map("state",region = as.character(input$cb1), add=TRUE, fill = TRUE, col = "darkslategray1")
  map.text("state",region = as.character(input$cb1), add=TRUE, col = "navy", cex = 2)
 # map("state", region = "ohio", add = TRUE, fill = TRUE )
}
  
  )




 
 
})