library("shiny")

source("helpers.R")


about_you <- div(
  h3("About You"),
  numericInput("age", h4("Age"), 18, min = 1, max = 130),
  selectInput("gender", h4("Gender"),
              c(GENDER_MALE, GENDER_FEMALE)),
  selectInput("education", h4("Education"),
              c(EDUCATION_PHD, EDUCATION_MASTERS, EDUCATION_OTHER)),
  checkboxInput("computer_science", "Academic specialty in computer science"),
  selectInput("bargaining_skills", h4("Bargaining Skills"),
              c("1 (Poor)", "2", "3", "4", "5 (Excellent)"),
              selected = 3)
)


about_company <- div(
  h3("About the Company"),
  selectInput("industry", h4("Industry"),
              c(INDUSTRY_SOFTWARE, INDUSTRY_ECOMMERCE,
                INDUSTRY_EDUCATION, INDUSTRY_OTHER)),
  selectInput("location", h4("Location"),
              c(LOCATION_CALIFORNIA, LOCATION_NORTHEAST_US,
                LOCATION_SOUTHERN_US, LOCATION_CANADA,
                LOCATION_LATIN_AMERICA, LOCATION_EUROPE,
                LOCATION_UK_IRELAND, LOCATION_ASIA, LOCATION_OTHER)),
  selectInput("company_size", h4("Size"),
              c(COMPANY_SIZE_500, COMPANY_SIZE_2500, COMPANY_SIZE_OTHER))
)


about_position <- div(
  h3("About the Position"),
  fluidRow(
    column(6,
      selectInput("title", h4("Title"),
                  c(TITLE_ARCHITECT, TITLE_SCIENTIST, TITLE_ENGINEER,
                    TITLE_DEVELOPER, TITLE_ANALYST, TITLE_OTHER)),
      checkboxInput("principal_level", "‘Principal’ level position"),
      checkboxInput("upper_management", "Upper management (director, VP, CxO)"),
      numericInput("work_week", h4("Working Time (hours / week)"), 40,
                   min = 1, max = 24 * 7),
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
                  c(CLOUD_COMPUTING_MOST, CLOUD_COMPUTING_NONE, CLOUD_COMPUTING_OTHER))
    ),
    column(6,
       h4("Responsibilities"),
       selectInput("meetings", h5("Meetings"),
                   c(MEETINGS_1_TO_3, MEETINGS_4_PLUS, MEETINGS_OTHER)),
       selectInput("basic_eda", h5("Basic Exploratory Data Analysis"),
                   c(BASIC_EDA_1_TO_4, BASIC_EDA_4_PLUS, BASIC_EDA_OTHER)),
       selectInput("visualizations", h5("Creating Visualizations"),
                   c(VISUALIZATIONS_1_TO_3, VISUALIZATIONS_4_PLUS, VISUALIZATIONS_OTHER)),
       selectInput("data_cleaning", h5("Data Cleaning"),
                   c(DATA_CLEANING_1_TO_4, DATA_CLEANING_OTHER)),
       selectInput("machine_learning", h5("Machine Learning, Statistics"),
                   c(MACHINE_LEARNING_1_TO_3, MACHINE_LEARNING_OTHER))
    )
  )
)


report_ref <- function(page) {
  HTML(sprintf("For more information see page %d of ", page),
       '<a target="_blank" href="http://www.oreilly.com/data/free/2015-data-science-salary-survey.csp">the survey report</a>.')
}

report_link = ""

salary <- div(
  h3("Salary"),
  fluidRow(
    column(11,
      tabsetPanel(
        tabPanel("Model #1", div(style = "padding: 1em;",
          p("A basic, parsimonious linear model.", report_ref(6)),
          span("Predicted salary:", strong(textOutput("salary_model1", inline = TRUE)))
        )),
        tabPanel("Model #2", div(style = "padding: 1em;",
           p("A revised model, including tasks.", report_ref(13)),
           span("Predicted salary:", strong(textOutput("salary_model2", inline = TRUE)))
        )),
        tabPanel("Model #3", div(style = "padding: 1em;",
          p("A more complete model, including tools.", report_ref(30)),
          span("Predicted salary:", strong(textOutput("salary_model3", inline = TRUE)))
        )),
        tabPanel("Model #4", div(style = "padding: 1em;",
          p("Final model.", report_ref(35)),
          span("Predicted salary:", strong(textOutput("salary_model4", inline = TRUE)))
        ))
      )
    )
  )
)


shinyUI(fluidPage(
  fluidRow(
    column(10, offset = 1, titlePanel("O'Reilly ‘2015 Data Science Salary Survey’ models")),
    column(3, offset = 1, about_you, about_company),
    column(7, about_position, salary),
    column(10, offset = 1, HTML(
      'Source code available at <a target="_blank" href="https://github.com/yasserglez/oreilly_data_science_salary">https://github.com/yasserglez/oreilly_data_science_salary</a>.')
    )
  )
))
