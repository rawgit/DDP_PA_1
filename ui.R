shinyUI(fluidPage(
    titlePanel("World Per Capita CO2 Emissions (MT)"),
  sidebarLayout(
    sidebarPanel(
      sliderInput('year', 'Year from',value = 1990, min = 1990, max = 2015),
      checkboxGroupInput("country",
                         label = h3("Countries"),
                         choices = list("Australia" = "Australia",
                                        "Canada" = "Canada",
                                        "China" = "China",
                                        "European Union" = "European Union",
                                        "Japan" = "Japan",
                                        "Russian Federation" = "Russian Federation",
                                        "United Kingdom" = "United Kingdom",
                                        "United States of America" = "United States")
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Overview", p("This little Shiny app plots and tables per capita CO2 emissions of major industrialized economies."),
                          p("The data used is obtained from World Bank http://data.worldbank.org/indicator/EN.ATM.CO2E.PC"),
                          p("Select the year range and countries on left and click the Plot or Table tab above.")),
        tabPanel("Plot", plotOutput("plot")),
        tabPanel("Table", dataTableOutput("dataTable"))
      )
    )
  )
))
