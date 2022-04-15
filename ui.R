shinyUI(
    
    dashboardPage(title = "Film Dashboard", skin = "red",
        dashboardHeader(title = "Movies Revenue"),
        dashboardSidebar(
            sidebarMenu(
                menuItem(text = "Overview", icon = icon("not-equal"), tabName = "page1"),
                menuItem(text = "Growth Graphic", icon = icon("chart-line"), tabName = "page2"),
                menuItem(text = "Data", icon = icon("table"), tabName = "page3")
            )
        ),
        dashboardBody(
            tabItems(
                # Plot 1
                tabItem(tabName = "page1",
                        fluidPage(
                            fluidRow(p(h3(strong("What parameters you can see in this plot:")))),
                            fluidRow(
                                valueBoxOutput("movietitle"),
                                valueBoxOutput("revenue"),
                                valueBoxOutput("imdbrating")
                            ),
                            fluidRow(
                                box(width = 8, title = "Top 10 Film's Achievement", background = "red",
                        selectInput(inputId = "year1",
                                    label = "Select Year",
                                    choices = film$year,
                                    selected = "2018"),
                        plotlyOutput("plotversus")),
                                box(width = 4, title = "Caption", status = "danger",
                        p("Based on the data we have, we can summarise that even the highest grossing movie isn't always the best rated movie.
                          So what is the key?
                          Marketing has always been the best key of a selling product. But what technique shall we use?")),
                        )
                        )),
                tabItem(tabName = "page2",
                        fluidPage(
                            fluidRow(   
                                valueBoxOutput("topmovie"),
                                valueBoxOutput("toprevenue"),
                                valueBoxOutput("topyear"),
                                box(width = 8, Title = "Growth Graphics", status = "danger",
                                    sliderInput("slideryear", label = "Select Year Range",
                                                min = min(film$year),
                                                max = max(film$year),
                                                value = 2018),
                                    plotlyOutput("growth")),
                            fluidRow(
                                box(width = 4, Title = "Caption", status = "danger",
                                    p("This is a line chart where you can see how the best grossing movie achieved based on their revenue"))),
                            
                            )
                        )),
                tabItem(tabName = "page3",
                        fluidPage(
                            fluidRow(
                                dataTableOutput("dataframe"),
                                tabPanel("hyperlink",
                                         tags$li(tags$a(href="https://www.kaggle.com/bidyutchanda/top-10-highest-grossing-films-19752018",
                                                        paste("Data Source : Kaggle"),
                                                        title="1. EAE (Acute)")))
                            )
                        ))
            )
        )
    )
)
