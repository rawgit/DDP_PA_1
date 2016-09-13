library(shiny)
library(ggplot2)
library(reshape2)
CO2_Per_Capita_WB <- read.csv("CO2_Per_Capita_WB.csv", stringsAsFactors=FALSE)
CO2_PC <- melt(CO2_Per_Capita_WB, id.vars = c("Country.Name"))
names(CO2_PC) <- c("Country", "Year", "CO2_MT")
CO2_PC$Year <- as.numeric(gsub('X','',CO2_PC$Year))
CO2_PC <- CO2_PC[!is.na(CO2_PC$CO2_MT),]
CO2_PC <- CO2_PC[order(CO2_PC$Country,CO2_PC$Year),]

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    g <- ggplot(aes(x=Year, y=CO2_MT, colour=Country), data=CO2_PC[CO2_PC$Country %in% input$country & CO2_PC$Year >= input$year,])
    g <- g + geom_line(size=1) + xlab("Year") + ylab("MT")
    g <- g + ggtitle("CO2 Emissions")
    g
  })
   output$dataTable <- renderDataTable(CO2_PC[CO2_PC$Country %in% input$country & CO2_PC$Year >= input$year,])
})
