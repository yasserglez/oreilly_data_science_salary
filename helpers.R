GENDER_FEMALE <- "Female"
GENDER_MALE   <- "Male"

EDUCATION_PHD     <- "PhD"
EDUCATION_MASTERS <- "Master's but not PhD"
EDUCATION_OTHER   <- "Other"

INDUSTRY_SOFTWARE  <- "Software (incl. security, cloud services)"
INDUSTRY_ECOMMERCE <- "Retail / E-Commerce"
INDUSTRY_EDUCATION <- "Education"
INDUSTRY_OTHER     <- "Other"

LOCATION_CALIFORNIA    <- "California"
LOCATION_NORTHEAST_US  <- "Northeast US"
LOCATION_SOUTHERN_US   <- "Southern US"
LOCATION_CANADA        <- "Canada"
LOCATION_LATIN_AMERICA <- "Latin America"
LOCATION_EUROPE        <- "Europe (except UK/Ireland)"
LOCATION_UK_IRELAND    <- "UK/Ireland"
LOCATION_ASIA          <- "Asia"
LOCATION_OTHER         <- "Other"

COMPANY_SIZE_500   <- "<500"
COMPANY_SIZE_2500  <- "2,500+"
COMPANY_SIZE_OTHER <- "Other"

TITLE_ARCHITECT <- "Architect"
TITLE_SCIENTIST <- "Scientist"
TITLE_ENGINEER  <- "Engineer"
TITLE_DEVELOPER <- "Developer"
TITLE_ANALYST   <- "Analyst"
TITLE_OTHER     <- "Other"

MEETINGS_1_TO_3 <- "1–3 hours / day"
MEETINGS_4_PLUS <- "4+ hours / day"
MEETINGS_OTHER  <- "Other"

BASIC_EDA_1_TO_4 <- "1–4 hours / week"
BASIC_EDA_4_PLUS <- "4+ hours / day"
BASIC_EDA_OTHER  <- "Other"

VISUALIZATIONS_1_TO_3 <- "1–3 hours / day"
VISUALIZATIONS_4_PLUS <- "4+ hours / day"
VISUALIZATIONS_OTHER  <- "Other"

DATA_CLEANING_1_TO_4 <- "1–4 hours / week"
DATA_CLEANING_OTHER  <- "Other"

MACHINE_LEARNING_1_TO_3 <- "1–3 hours / week"
MACHINE_LEARNING_OTHER  <- "Other"

CLOUD_COMPUTING_MOST  <- "Most or all cloud computing"
CLOUD_COMPUTING_NONE  <- "Not using cloud computing"
CLOUD_COMPUTING_OTHER <- "Other"


# A basic, parsimonious linear model (page 6)
predict_salary_model1 <- function(x) {
    70577 # intercept
  + 1467  * max(x$age - 18, 0)
  - 8026  * (x$gender == GENDER_FEMALE)
  + 6536  * (x$industry == INDUSTRY_SOFTWARE)
  - 15196 * (x$industry == INDUSTRY_EDUCATION)
  - 3468  * (x$company_size == COMPANY_SIZE_500)
  + 401   * (x$company_size == COMPANY_SIZE_2500)
  + 32003 * x$upper_management
  + 7427  * (x$education == EDUCATION_PHD)
  + 15608 * (x$location == LOCATION_CALIFORNIA)
  + 12089 * (x$location == LOCATION_NORTHEAST_US)
  - 924   * (x$location == LOCATION_CANADA)
  - 20989 * (x$location == LOCATION_LATIN_AMERICA)
  - 23292 * (x$location == LOCATION_EUROPE)
  - 25517 * (x$location == LOCATION_ASIA)
}

# A revised model, including tasks (page 16)
predict_salary_model2 <- function(x) {
    14595 # intercept
  + 1449  * max(x$age - 18, 0)
  + 7205  * x$bargaining_skills
  + 663   * x$work_week
  - 4207  * (x$gender == GENDER_FEMALE)
  + 6593  * (x$industry == INDUSTRY_SOFTWARE)
  - 7696  * (x$industry == INDUSTRY_EDUCATION)
  + 1787  * (x$company_size == COMPANY_SIZE_2500)
  + 13429 * (x$education == EDUCATION_PHD)
  + 3496  * (x$education == EDUCATION_MASTERS)
  + 2991  * x$computer_science
  + 17264 * (x$location == LOCATION_CALIFORNIA)
  + 9511  * (x$location == LOCATION_NORTHEAST_US)
  + 1752  * (x$location == LOCATION_SOUTHERN_US)
  - 1623  * (x$location == LOCATION_CANADA)
  - 3073  * (x$location == LOCATION_UK_IRELAND)
  - 20139 * (x$location == LOCATION_EUROPE)
  - 24026 * (x$location == LOCATION_LATIN_AMERICA)
  - 27823 * (x$location == LOCATION_ASIA)
  + 9416  * (x$meetings == MEETINGS_1_TO_3)
  + 11282 * (x$meetings == MEETINGS_4_PLUS)
  + 4652  * (x$basic_eda == BASIC_EDA_1_TO_4)
  - 6609  * (x$basic_eda == BASIC_EDA_4_PLUS)
  - 1273  * (x$visualizations == VISUALIZATIONS_1_TO_3)
  - 2241  * (x$visualizations == VISUALIZATIONS_4_PLUS)
  + 130   * (x$data_cleaning == DATA_CLEANING_1_TO_4)
  + 1733  * (x$machine_learning == MACHINE_LEARNING_1_TO_3)
}

# Tools and salary: a more complete model (page 30)
predict_salary_model3 <- function(x) {
    26393 # intercept
  + 1505  * max(x$age - 18, 0)
  + 6106  * x$bargaining_skills
  + 420   * x$work_week
  - 2785  * (x$gender == GENDER_FEMALE)
  + 3012  * (x$industry == INDUSTRY_SOFTWARE)
  - 6412  * (x$industry == INDUSTRY_EDUCATION)
  + 1412  * (x$company_size == COMPANY_SIZE_2500)
  + 9274  * (x$education == EDUCATION_PHD)
  + 919   * (x$education == EDUCATION_MASTERS)
  + 101   * x$computer_science
  + 14667 * (x$location == LOCATION_CALIFORNIA)
  + 10693 * (x$location == LOCATION_NORTHEAST_US)
  + 231   * (x$location == LOCATION_SOUTHERN_US)
  - 451   * (x$location == LOCATION_CANADA)
  - 1486  * (x$location == LOCATION_UK_IRELAND)
  - 17084 * (x$location == LOCATION_EUROPE)
  - 21077 * (x$location == LOCATION_LATIN_AMERICA)
  - 26146 * (x$location == LOCATION_ASIA)
  + 8489  * (x$meetings == MEETINGS_1_TO_3)
  + 9461  * (x$meetings == MEETINGS_4_PLUS)
  + 3007  * (x$basic_eda == BASIC_EDA_1_TO_4)
  - 3249  * (x$basic_eda == BASIC_EDA_4_PLUS)
  + 1342  * (x$cloud_computing == CLOUD_COMPUTING_MOST)
  - 3977  * (x$cloud_computing == CLOUD_COMPUTING_NONE)
  + 11731 * x$spark
  + 7894  * x$d3
  + 6086  * x$emr
  + 3929  * x$scala
  + 3213  * x$cpp
  + 1435  * x$hadoop
  - 3243  * x$visual_basic
}

# Final model (page 35)
predict_salary_model4 <- function(x) {
    30572 # intercept
  + 1395  * max(x$age - 18, 0)
  + 5911  * x$bargaining_skills
  + 382   * x$work_week
  - 2007  * (x$gender == GENDER_FEMALE)
  + 1759  * (x$industry == INDUSTRY_SOFTWARE)
  - 891   * (x$industry == INDUSTRY_ECOMMERCE)
  - 6336  * (x$industry == INDUSTRY_EDUCATION)
  + 718   * (x$company_size == COMPANY_SIZE_2500)
  - 448   * (x$company_size == COMPANY_SIZE_500)
  + 8606  * (x$education == EDUCATION_PHD)
  + 851   * (x$education == EDUCATION_MASTERS)
  + 13200 * (x$location == LOCATION_CALIFORNIA)
  + 10097 * (x$location == LOCATION_NORTHEAST_US)
  - 3695  * (x$location == LOCATION_UK_IRELAND)
  - 18353 * (x$location == LOCATION_EUROPE)
  - 23140 * (x$location == LOCATION_LATIN_AMERICA)
  - 30139 * (x$location == LOCATION_ASIA)
  + 7819  * (x$meetings == MEETINGS_1_TO_3)
  + 9036  * (x$meetings == MEETINGS_4_PLUS)
  + 2679  * (x$basic_eda == BASIC_EDA_1_TO_4)
  - 4615  * (x$basic_eda == BASIC_EDA_4_PLUS)
  + 352   * (x$data_cleaning == DATA_CLEANING_1_TO_4)
  + 2287  * (x$cloud_computing == CLOUD_COMPUTING_MOST)
  - 2710  * (x$cloud_computing == CLOUD_COMPUTING_NONE)
  + 9747  * x$spark
  + 6758  * x$d3
  + 4878  * x$emr
  + 3371  * x$Scala
  + 2309  * x$cpp
  + 1173  * x$teradata
  + 625   * x$hive
  - 1931  * x$visual_basic
  + 31280 * x$principal_level
  + 15642 * (x$title == TITLE_ARCHITECT)
  + 3340  * (x$title == TITLE_SCIENTIST)
  + 2819  * (x$title == TITLE_ENGINEER)
  - 3272  * (x$title == TITLE_DEVELOPER)
  - 4566  * (x$title == TITLE_ANALYST)
}
