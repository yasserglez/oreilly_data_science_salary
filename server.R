library("shiny")

source("helpers.R")


shinyServer(function(input, output) {
  x <- reactive({
    list(
      age = input$age,
      gender = input$gender,
      education = input$education,
      computer_science = input$computer_science,
      bargaining_skills = as.numeric(substr(input$bargaining_skills, 1, 1)),
      industry = input$industry,
      location = input$location,
      company_size = input$company_size,
      title = input$title,
      principal_level = input$principal_level,
      upper_management = input$upper_management,
      work_week = input$work_week,
      meetings = input$meetings,
      basic_eda = input$basic_eda,
      visualizations = input$visualizations,
      data_cleaning = input$data_cleaning,
      machine_learning = input$machine_learning,
      spark = input$spark,
      scala = input$scala,
      hadoop = input$hadoop,
      hive = input$hive,
      emr = input$emr,
      d3 = input$d3,
      cpp = input$cpp,
      visual_basic = input$visual_basic,
      teradata = input$teradata,
      cloud_computing = input$cloud_computing)
  })

  output$salary_model1 <- renderText(format_salary(predict_salary_model1(x())))
  output$salary_model2 <- renderText(format_salary(predict_salary_model2(x())))
  output$salary_model3 <- renderText(format_salary(predict_salary_model3(x())))
  output$salary_model4 <- renderText(format_salary(predict_salary_model4(x())))
})
