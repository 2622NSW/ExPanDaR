library(ExPanDaR)
library(tidyverse)
# Upload file for a data frame (available at https://github.com/2622NSW/ExPanDaR)
df <- read.csv("Dwell18.csv")
# The data are cros-sectional and so can add artificial time dimension (Joachim)
df$ts_id <- 1
# Use the ExPanDaR package with the data frame df
# This example includes three components of the package:
# A descriptive table (of all variables); a scatter plot; 
# and a list of 5 most extreme observations.
ExPanD(df, cs_id = "Referee", ts_id = "BIP_Seconds",
       ExPanD(df, cs_id = "Referee", ts_id = "ts_id",
              title = "Referee Performance at the 2018 FIFA World Cup",
              abstract = paste("This display uses data from the 2018 FIFA World Cup web site"),
              components = c(descriptive_table = TRUE, 
                             scatter_plot = TRUE,
                             ext_obs = TRUE))
# Define a data frame to describe variables      
       df_def <- tibble(
         var_name = names(df),
         var_def = c("Game ID",
                     "Name of Referee",
                     "Country of Referee",
                     "Confederation of Referee",
                     "Match",
                     "Ball in Play (Seconds)",
                     "Game Total (Seconds)",
                     "Ball not in Play (Seconds)",
                     "Dwell (as % of Exact Game Time)",
                     "Temperature at Match",
                     "Humidity at Match",
                     "Fouls at Match",
                     "Goals Scored",
                     "Pseudo time series ID"),
         type = c("cs_id", rep("factor", 3), "cs_id", rep("numeric", 8), "ts_id")
       )
       
       ExPanD(df, df_def = df_def,
              title = "Referee Performance at the 2018 FIFA World Cup",
              abstract = paste("This display uses data from the 2018 FIFA World Cup web site"),
              components = c(descriptive_table = TRUE, 
                             scatter_plot = TRUE,
                             ext_obs = TRUE))
# Set config for scatterplot
       clist <- list(
         scatter_x = "Fouls", 
         scatter_y = "Dwell_pc", 
         scatter_size = "Game_Time_Seconds", 
         scatter_color = "Referee"
       )
       ExPanD(df, df_def = df_def, config_list = clist,
              title = "Referee Performance at the 2018 FIFA World Cup",
              abstract = paste("This display uses data from the 2018 FIFA World Cup web site"),
              components = c(descriptive_table = TRUE, 
                             scatter_plot = TRUE,
                             ext_obs = TRUE))