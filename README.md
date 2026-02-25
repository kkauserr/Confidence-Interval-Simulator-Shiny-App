📊 Confidence Interval Simulator – Shiny App

📌 Description

This Shiny application simulates repeated sampling from a normal population and constructs confidence intervals for the population mean.
It visually demonstrates how confidence intervals behave across repeated samples and whether they successfully capture the true population mean.
The app is designed as an educational tool to build intuition around the concept of statistical confidence levels.

🎯 Educational Purpose

The purpose of this application is to help users understand what a confidence level actually means.
For example:
A 95% confidence interval means that if we repeatedly take samples and construct confidence intervals, approximately 95% of those intervals will contain the true population mean.

The visualization clearly distinguishes:

✅ Confidence intervals that contain the true mean
❌ Confidence intervals that do not contain the true mean

This allows users to visually observe the long-run behavior of confidence intervals.

🚀 Features

🎚 Adjustable Sample Size (Slider Input)
🔁 Adjustable Number of Simulations (Slider Input)
📊 Selectable Confidence Level (Radio Buttons – e.g., 90%, 95%, 99%)
▶ Simulation Button to generate repeated samples

📈 Interactive Plot displaying:

All simulated confidence intervals
The true population mean
Visual distinction between intervals that capture the mean and those that do not

🛠 Requirements

This app was developed using R and the Shiny package.
To run this app, install the required packages:

install.packages("shiny")
install.packages("ggplot2") 
install.packages("plotly")   

📂 Project Structure

You may structure the app in one of two ways:

🧠 Statistical Concept Behind the App

The app performs the following steps:

Draws repeated random samples from a normal population.
Computes the sample mean for each sample.
Displays each interval on a plot.
Checks whether the true mean lies within each interval.

Over many simulations, the proportion of intervals capturing the true mean approaches the selected confidence level.

🖥 GUI Components Used

This application includes multiple Shiny widgets:
sliderInput() – Sample size and number of simulations
radioButtons() – Confidence level selection
actionButton() – Run simulation
Interactive plotting output 

This satisfies the requirement of using at least two different types of GUI components.

📈 Example Use Case

Select:
Sample Size: 30
Simulations: 100
Confidence Level: 95%
Click Run Simulation

Observe:

Most intervals contain the true mean
Some intervals miss it (≈5%)
This visually reinforces what “95% confidence” truly represents.

🎓 Ideal For

Introductory Statistics Courses
Probability & Sampling Theory Lessons
Teaching Confidence Intervals
Demonstrating Long-Run Frequency Interpretation

📚 Learning Outcomes

After using this app, students should be able to:
Interpret confidence levels correctly
Understand repeated sampling concepts
Distinguish between population parameters and sample statistics
Explain why some confidence intervals fail to capture the true mean

🔮 Possible Extensions

Add option for unknown σ (use t-distribution)
Allow non-normal population simulation
Add histogram of sample means
Show empirical coverage probability

📦 How to Run

Clone the repository:
git clone <(https://github.com/kkauserr/Confidence-Interval-Simulator-Shiny-App)>
Open in RStudio and run:
shiny::runApp()
