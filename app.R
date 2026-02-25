library(shiny)
library(ggplot2)
library(plotly)
ui <- fluidPage(
  titlePanel("Confidence Interval Coverage Simulator"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Sample Size:",
                  min = 5,
                  max = 200,
                  value = 30,
                  step = 5),
      sliderInput("sims",
                  "Number of Samples:",
                  min = 10,
                  max = 200,
                  value = 50,
                  step = 10),
      radioButtons("conf_level",
                   "Confidence Level:",
                   choices = c("90%" = 0.90,
                               "95%" = 0.95,
                               "99%" = 0.99),
                   selected = 0.95),
      
      actionButton("run", "Run Simulation")
    ),
    mainPanel(
      h3("This simulation shows how often confidence intervals capture the true mean (0)."),
      h4(textOutput("coverage_text")),
      plotlyOutput("ci_plot")
    )
  )
)
server <- function(input, output) {
  true_mean <- 0
  simulation <- eventReactive(input$run, {
    results <- data.frame(
      lower = numeric(input$sims),
      upper = numeric(input$sims),
      mean = numeric(input$sims),
      contains = logical(input$sims)
    )
    for (i in 1:input$sims) {
      sample_data <- rnorm(input$n, mean = true_mean, sd = 1)
      sample_mean <- mean(sample_data)
      sample_sd <- sd(sample_data)
      
      conf_level <- as.numeric(input$conf_level)
      error_margin <- qt(1 - (1 - conf_level)/2, df = input$n - 1) *
        sample_sd / sqrt(input$n)
      
      lower <- sample_mean - error_margin
      upper <- sample_mean + error_margin
      
      results$lower[i] <- lower
      results$upper[i] <- upper
      results$mean[i] <- sample_mean
      results$contains[i] <- (lower <= true_mean & upper >= true_mean)
    }
    results
  })
  output$coverage_text <- renderText({
    df <- simulation()
    coverage <- mean(df$contains) * 100
    
    paste("Coverage Rate:", round(coverage, 1), "%")
  })
  output$ci_plot <- renderPlotly({
    
    df <- simulation()
    
    df$id <- 1:nrow(df)
    
    p <- ggplot(df, aes(y = id)) +
      geom_segment(aes(x = lower, xend = upper, 
                       yend = id,
                       color = contains)) +
      geom_vline(xintercept = 0, linetype = "dashed") +
      scale_color_manual(values = c("TRUE" = "steelblue",
                                    "FALSE" = "red")) +
      labs(x = "Confidence Interval",
           y = "Sample Number",
           color = "Contains True Mean") +
      theme_minimal()
  
    ggplotly(p)
  })
}
shinyApp(ui = ui, server = server)