# ExPanDaR https://joachim-gassen.github.io/ExPanDaR/
# https://joachim-gassen.github.io/ExPanDaR/articles/customize_ExPanD.html
# A set of sample modification and data exploration/visualization components 
# A quick exploratory pass on a panel data set
# https://joachim-gassen.github.io/2018/10/using-the-expandar-package-for-panel-data-exploration/
# Each observation (a row) is identified by cross-sectional 
# and time series identifiers and that variables are organized by columns.
install.packages("ExPanDaR")
library(ExPanDaR)
library(tidyverse)
# Upload file (available at https://github.com/2622NSW/ExPanDaR)
df <- read.csv("Dwell18.csv")
# Use the ExPanDaR package with the data.frame df
# This example includes four components of the package:
# A descriptive table (of all variables); a scatter plot; 
# a quantile_trend_graph (distributions of one variable over time); and
# a list of 5 most extreme observations.
ExPanD(df, cs_id = "Referee", ts_id = "BIP_Seconds",
       title = "Referee Performance at the 2018 FIFA World Cup",
       abstract = paste("This display uses data from the 2018 FIFA World Cup web site"),
       components = c(descriptive_table = TRUE, 
                      scatter_plot = TRUE,
                      quantile_trend_graph = TRUE,
                      ext_obs = TRUE))
# Experimenting with dplyr changes
# https://statkclee.github.io/R-ecology-lesson/04-dplyr.html
# https://datacarpentry.org/R-ecology-lesson/03-dplyr.html
# https://www.datanovia.com/en/lessons/rename-data-frame-columns-in-r/
# Change column names in df to create df1
df1 <- df %>%
  rename(
    "Ball in Play (Seconds)" = BIP_Seconds,
    "Game Total (Seconds)" = Game_Time_Seconds,
    "Ball not in Play (Seconds)" = Ball_not_in_Play_Seconds,
    "Dwell (as % of Exact Game Time)" = Dwell_pc,
    "Goals Scored" = Goals_Scored
  )
# View the changes
df1 <- as_tibble(df1)
df1
# Inspect df
str(df1)
# Preview
View(df1)
# Save file to  a data_output directory
write.csv(df1, file = "data_output/df1.csv")
# Available in https://github.com/2622NSW/ExPanDaR