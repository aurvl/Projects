# Clear the environment
rm(list = ls())

# Installing and loading required packages ----
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("eurostat")

library(dplyr)
library(ggplot2)
library(eurostat)

# Now, we are going to import GDP and unemployment data from Eurostat
gdp <- get_eurostat(id = "nama_10_gdp")
unemployment <- get_eurostat(id = "tps00203")

# The first step in our analysis involves filtering and selecting the relevant columns for GDP and unemployment data.country_gdp <- subset(gdp, na_item == "B1GQ" & unit == "CLV10_MEUR", select = c(geo, time, values))
country_unemployment <- subset(unemployment, unit == "PC_ACT", select = c("geo", "TIME_PERIOD", "values"))
country_gdp <- subset(gdp, na_item == "B1GQ" & unit == "CLV10_MEUR", select = c("geo", "TIME_PERIOD", "values"))

# We join the GDP and unemployment data by country and time period to create a unified dataset.
okun <- inner_join(country_gdp, country_unemployment, by = c("geo", "TIME_PERIOD"))
okun <- okun %>%
  rename(country_gdp_values = values.x,
         country_unemployment_values = values.y) %>%
  select("geo", "TIME_PERIOD", "country_gdp_values", "country_unemployment_values")

# Structure of the dataframe
glimpse(okun)

# Calculate annual growth rates for GDP and unemployment gaps to examine year-to-year economic trends and apply Okun’s Law, which links changes in unemployment to changes in GDP.
okun_law <- okun %>%  
  group_by(geo) %>%
  arrange(geo, TIME_PERIOD) %>%
  mutate(growth_rate = (country_gdp_values / lag(country_gdp_values) - 1) * 100,
         unemployment_gap = (country_unemployment_values / lag(country_unemployment_values) - 1) * 100) %>%
  ungroup() %>%
  select(-country_gdp_values, -country_unemployment_values)

# Scatter plots showing the relationship between unemployment gap and growth rate
plot <- ggplot(okun_law, aes(x = unemployment_gap, y = growth_rate, color = geo)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Unemployment Gap", y = "Annual Growth Rate") +
  ggtitle("Okun Law - European countries (2012 - 2023)") +
  theme_minimal()
print(plot)

plot <- ggplot(okun_law, aes(x = unemployment_gap, y = growth_rate, color = geo)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Unemployment Gap", y = "Annual Growth Rate") +
  ggtitle("Okun Law - European countries (2012 - 2023)") +
  theme_minimal() +
  facet_wrap(~geo, scales = "free")  # Separate plots for each country
print(plot)

# Linear regression for each country
grouped_by_geo_data <- okun_law %>% group_by(geo)
regression_models <- grouped_by_geo_data %>%
  do(model = lm(growth_rate ~ unemployment_gap, data = .))
model_summaries <- lapply(regression_models$model, summary)

for (i in seq_along(model_summaries)) {
  cat("Linear Regression for country", unique(okun_law$geo)[i], ":\n")
  print(model_summaries[[i]])
  cat("\n")
}

# Global linear regression across all countries
global_lm <- okun_law %>% lm(growth_rate ~ unemployment_gap, data = .)
summary(global_lm)


# the case of Serbia
# Filtering and ploting data for Serbia
okun_rs <- okun_law %>% filter(geo == "RS")
plot_rs <- ggplot(okun_rs, aes(x = unemployment_gap, y = growth_rate)) +
  geom_point(shape = 15, color = "#FC67D4") +
  geom_smooth(method = "lm", se = FALSE, color = "#FC67D4") +
  labs(x = "Unemployment Gap", y = "Annual Growth Rate") +
  ggtitle("Annual Growth and Unemployment Rate for Serbia") +
  theme_minimal()
print(plot_rs)

# GDP evolution for Serbia
gdp_rs <- okun %>% filter(geo == "RS")
gdp_rs_evolution <- ggplot(gdp_rs, aes(x = TIME_PERIOD, y = country_gdp_values)) +
  geom_line(color = "#FC67D4", size = 0.8) +
  labs(x = "Time", y = "Annual GDP") +
  ggtitle("Annual GDP - Serbia (2012 - 2023)") +
  theme_minimal()
print(gdp_rs_evolution)

# Unemployment rate evolution for Serbia
unemployment_rs_evolution <- ggplot(gdp_rs, aes(x = TIME_PERIOD, y = country_unemployment_values)) +
  geom_line(size = 0.8) +
  labs(x = "Time", y = "Unemployment Rate") +
  ggtitle("Unemployment Rate - Serbia (2012 - 2023)") +
  theme_minimal()
print(unemployment_rs_evolution)

# Analysing the serbian labor productivity data
work_productivity = get_eurostat(id = "tec00116")
work_productivity_rs <- work_productivity %>%
  filter(geo == "RS") %>%
  select(-unit, -na_item)

wp_rs_evolution <- ggplot(work_productivity_rs, aes(x = TIME_PERIOD, y = values)) +
  geom_line(color = "#FC67D4", size = 0.8) +
  labs(x = "Time", y = "Annual Labor Productivity") +
  ggtitle("Annual Labor Productivity - Serbia (2012 - 2022)") +
  theme_minimal()
print(wp_rs_evolution)

# Differencies in GDP growth rates of Serbia, France and EU27
gdp_comp <- okun_law %>% filter(geo %in% c("EU27_2020", "FR", "RS"))
gdp_evolution <- ggplot(gdp_comp, aes(x = TIME_PERIOD, y = growth_rate, color = geo)) +
  geom_line(size = 0.8) +
  labs(x = "Time", y = "Annual Growth Rate") +
  ggtitle("Annual Growth Rate in France, EU27 and Serbia (2012 - 2023)") +
  theme_minimal() +
  scale_color_discrete(labels = c("EU27", "France", "Serbia")) 
print(gdp_evolution)

# Linear regression for Serbia
rs_data <- okun_rs %>% select(growth_rate, unemployment_gap)
lm_rs <- lm(growth_rate ~ unemployment_gap, data = rs_data)
summary(lm_rs)
