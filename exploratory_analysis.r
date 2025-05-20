library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggrepel)
library(readr)
library(dplyr)
library(tidyr)
library(here)
library(skimr)
library(janitor)
library(corrplot)
library(ggcorrplot)
library(cluster)
library(factoextra)

df_daily_activity <- read_csv("/cloud/project/raw_data_bellabeat/dailyActivity_merged.csv")
df_daily_calories <- read_csv("/cloud/project/raw_data_bellabeat/dailyCalories_merged.csv")
df_daily_intensities <- read_csv("/cloud/project/raw_data_bellabeat/dailyIntensities_merged.csv")
df_daily_steps <- read_csv("/cloud/project/raw_data_bellabeat/dailySteps_merged.csv")
df_daily_sleep <- read_csv("/cloud/project/raw_data_bellabeat/sleepDay_merged.csv")
df_hourly_calories <- read_csv("/cloud/project/raw_data_bellabeat/hourlyCalories_merged.csv")


# Calculate the percentage of duplicated and missing values
dp_hourly_calories <- sum(duplicated(df_hourly_calories)) * 100 / nrow(df_hourly_calories)
na_hourly_calories <- sum(is.na(df_hourly_calories)) * 100 / nrow(df_hourly_calories)

dp_hourly_calories
na_hourly_calories

str(df_hourly_calories)

# Separa em coluna de data (apenas a data) e coluna de hora (apenas a hora 0-23)
df_hourly_calories$activity_datetime <- as.POSIXct(
  df_hourly_calories$ActivityHour,
  format = "%m/%d/%Y %I:%M:%S %p"
)

# Usa lubridate::hour() para obter a hora de 0 a 23
df_hourly_calories$hour <- hour(df_hourly_calories$activity_datetime)


df_hourly_calories <- df_hourly_calories %>%
  arrange(desc(hour))
head(df_hourly_calories,100)





