library("testthat")

source("helpers.R")

x <- list(
  age = 0,
  gender = GENDER_MALE,
  education = EDUCATION_OTHER,
  computer_science = FALSE,
  bargaining_skills = 0,
  industry = INDUSTRY_OTHER,
  location = LOCATION_OTHER,
  company_size = COMPANY_SIZE_OTHER,
  title = TITLE_OTHER,
  principal_level = FALSE,
  upper_management = FALSE,
  work_week = 0,
  meetings = MEETINGS_OTHER,
  basic_eda = BASIC_EDA_OTHER,
  visualizations = VISUALIZATIONS_OTHER,
  data_cleaning = DATA_CLEANING_OTHER,
  machine_learning = MACHINE_LEARNING_OTHER,
  spark = FALSE,
  scala = FALSE,
  hadoop = FALSE,
  hive = FALSE,
  emr = FALSE,
  d3 = FALSE,
  cpp = FALSE,
  visual_basic = FALSE,
  teradata = FALSE,
  cloud_computing = CLOUD_COMPUTING_OTHER
)


context("model1")

test_that("intercept is correct", {
  expect_equal(predict_salary_model1(x), 70577)
})

test_that("base salary for a 48-year-old man is correct", {
  x$age <- 48
  x$gender <- GENDER_MALE
  expect_equal(predict_salary_model1(x), 114587)
})

test_that("salaries at larger companies tend to be higher", {
  base <- predict_salary_model1(x)
  x$company_size <- COMPANY_SIZE_2500
  expect_equal(predict_salary_model1(x), base + 401)
  x$company_size <- COMPANY_SIZE_500
  expect_equal(predict_salary_model1(x), base - 3468)
})


context("model2")

test_that("intercept is correct", {
  expect_equal(predict_salary_model2(x), 14595)
})

test_that("base salary for a 38-year-old man is correct", {
  x$age <- 38
  x$gender <- GENDER_MALE
  x$bargaining_skills <- 3
  x$work_week <- 40
  x$location <- LOCATION_OTHER
  expect_equal(predict_salary_model2(x), 91710)
})

test_that("PhD salary boost is correct", {
  base <- predict_salary_model2(x)
  x$education <- EDUCATION_PHD
  expect_equal(predict_salary_model2(x), base + 13429)
})


context("model3")

test_that("intercept is correct", {
  expect_equal(predict_salary_model3(x), 26393)
})

test_that("Scala and Spark boost is correct", {
  base <- predict_salary_model3(x)
  x$scala <- TRUE
  x$spark <- TRUE
  expect_gt(predict_salary_model3(x) - base, 15000)
})

test_that("D3 coefficient is correct", {
  base <- predict_salary_model3(x)
  x$d3 <- TRUE
  expect_equal(predict_salary_model3(x) - base, 7894)
})


context("model4")

test_that("intercept is correct", {
  expect_equal(predict_salary_model4(x), 30572)
})

test_that("principal level coefficient is correct", {
  base <- predict_salary_model4(x)
  x$principal_level <- TRUE
  expect_equal(predict_salary_model4(x) - base, 31280)
})

test_that("job title coefficients are correct", {
  base <- predict_salary_model4(x)

  x$title <- TITLE_ARCHITECT
  expect_gt(predict_salary_model4(x), base)
  x$title <- TITLE_SCIENTIST
  expect_gt(predict_salary_model4(x), base)
  x$title <- TITLE_ENGINEER
  expect_gt(predict_salary_model4(x), base)

  x$title <- TITLE_DEVELOPER
  expect_lt(predict_salary_model4(x), base)
  x$title <- TITLE_ANALYST
  expect_lt(predict_salary_model4(x), base)

  x$title <- TITLE_OTHER
  expect_equal(predict_salary_model4(x), base)
})
