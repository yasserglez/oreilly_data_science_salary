library("shiny")

shinyUI(fluidPage(
    titlePanel("O'Reilly ‘2015 Data Science Salary Survey’ Predictors"),
    fluidRow(
        column(4,
            h3("About You"),
            numericInput("age", h4("Age"), 18, min = 1, max = 130),
            selectInput("gender", h4("Gender"), c("Male", "Female")),
            selectInput("education", h4("Education"), c("PhD", "Master's but not PhD", "Other")),
            checkboxInput("computer_science", "Academic specialty in computer science"),
            selectInput("bargaining_skills", h4("Bargaining Skills"),
                        c("1 (Poor)", "2", "3", "4", "5 (Excellent)"),
                        selected = 3),

            h3("About the Company"),
            selectInput("industry", h4("Industry"),
                        c("Software (incl. security, cloud services)",
                          "Retail / E-Commerce", "Education", "Other")),
            selectInput("location", h4("Location"),
                        c("California", "Northeast US", "Southern US", "Canada", "Latin America",
                          "Europe (except UK/Ireland)", "UK/Ireland", "Asia", "Other")),
            selectInput("company_size", h4("Size"), c("<500", "2,500+", "Other"))
        ),
        column(4,
            h3("About the Position"),
            selectInput("title", h4("Title"),
                        c("Architect", "Scientist", "Engineer", "Developer", "Analyst", "Other")),
            checkboxInput("principal_level", "‘Principal’ level position"),
            checkboxInput("upper_management", "Upper management (director, VP, CxO)"),
            numericInput("work_week", h4("Working Time (hours / week)"), 40, min = 1, max = 24 * 7),
            h4("Responsibilities"),
            selectInput("meetings", h5("Meetings"), c("1–3 hours / day", "4+ hours / day", "Other")),
            selectInput("basic_eda", h5("Basic Exploratory Data Analysis"),
                        c("1–4 hours / week", "4+ hours / day", "Other")),
            selectInput("data_cleaning", h5("Data Cleaning"), c("1–4 hours / week", "Other")),
            h4("Technologies"),
            fluidRow(
                column(3,
                    checkboxInput("spark", "Spark"),
                    checkboxInput("scala", "Scala"),
                    checkboxInput("hadoop", "Hadoop")
                ),
                column(3,
                    checkboxInput("hive", "Hive"),
                    checkboxInput("emr", tags$abbr("EMR", title = "Amazon Elastic MapReduce")),
                    checkboxInput("d3", "D3")
                ),
                column(4,
                    checkboxInput("cpp", "C++"),
                    checkboxInput("visual_basic", "Visual Basic"),
                    checkboxInput("teradata", "Teradata")
                )
            ),
            selectInput("cloud_computing", h5("Cloud Computing"),
                        c("Most or all cloud computing", "Not using cloud computing", "Other"))
        )
    )
))
