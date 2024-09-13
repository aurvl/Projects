# Clearing environment
rm(list = ls())

# Importation de la base de donnée
install.packages("dplyr")
install.packages("ggplot2")
install.packages("eurostat")

library(dplyr)
library(ggplot2)
library(eurostat)


gdp = get_eurostat(id = "nama_10_gdp")
unemployement = get_eurostat(id = "tps00203")

country_gdp <- subset(gdp, na_item == "B1GQ" & unit == "CLV10_MEUR", select = c(geo, time, values))
country_unemployment <- subset(unemployement, unit == "PC_ACT", select = c("geo", "TIME_PERIOD", "values"))
country_gdp <- subset(gdp, na_item == "B1GQ" & unit == "CLV10_MEUR", select = c("geo", "TIME_PERIOD", "values"))

okun <- inner_join(country_gdp, country_unemployment, by = c("geo", "TIME_PERIOD"))
okun <- okun %>%
  rename(country_gdp_values = values.x,
         country_unemployment_values = values.y) %>%
  select("geo", "TIME_PERIOD", "country_gdp_values", "country_unemployment_values")

# Description du dataframe
str(okun)

#Nuage de points
okun_law <- okun %>%
  group_by(geo) %>%
  arrange(geo, TIME_PERIOD) %>%
  mutate(growth_rate = (country_gdp_values / lag(country_gdp_values) - 1) * 100, unemply_gap = (country_unemployment_values / lag(country_unemployment_values) - 1) * 100) %>%
  ungroup()
okun_law <- okun_law %>%
  select(-country_gdp_values, -country_unemployment_values)


plot <- ggplot(okun_law, aes(x = unemply_gap, y = growth_rate, color = geo)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "unemplOyment rate evolution", y = "annual growth rate") +
  ggtitle("ANNUAL GROWTH AND UNEMPLOYMENT RATE EVOLUTION") +
  theme_minimal()
print(plot)

plot <- ggplot(okun_law, aes(x = unemply_gap, y = growth_rate, color = geo)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "unemplOyment rate evolution", y = "annual growth rate") +
  ggtitle("ANNUAL GROWTH AND UNEMPLOYMENT RATE EVOLUTION") +
  theme_minimal() +
  facet_wrap(~geo, scales = "free")  # Création des graphiques séparés pour chaque "geo"
print(plot)

# Régression
grouped_by_geo_data <- okun_law %>% group_by(geo)
regression_models <- grouped_by_geo_data %>%
  do(model = lm(growth_rate ~ unemply_gap, data = .))
model_summaries <- lapply(regression_models$model, summary)

# Afficher le résumé des modèles (par pays)
for (i in seq_along(model_summaries)) {
  cat("Régression linéaire pour le groupe", unique(okun_law$geo)[i], ":\n")
  print(model_summaries[[i]])
  cat("\n")}

global_lm <- okun_law %>% lm(growth_rate ~ unemply_gap, data = .)
summary(global_lm)

# Les cas qui respectent pas (Serbie)

okun_rs <- okun_law %>% filter(geo == "RS") # Nuage de points
plot_rs <- ggplot(okun_rs, aes(x = unemply_gap, y = growth_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "unemployment rate evolution", y = "annual growth rate") +
  ggtitle("ANNUAL GROWTH AND UNEMPLOYMENT RATE EVOLUTION for SERBIA") +
  theme_minimal()
print(plot_rs)

gdp_rs <- okun %>% filter(geo == "RS")
gdp_rs_evolution <- ggplot(gdp_rs, aes(x = time, y = country_gdp_values)) +
  geom_line() +
  labs(x = "time", y = "annual growth rate") +
  ggtitle("SERBIA ANNUAL GDP") +
  theme_minimal()
print(gdp_rs_evolution)

unemply_rs_evolution <- ggplot(gdp_rs, aes(x = time, y = country_unemployment_values)) +
  geom_line() +
  labs(x = "time", y = "unemployment rate") +
  ggtitle("SERBIA unemployment evolution") +
  theme_minimal()
print(unemply_rs_evolution)


# productivité du travail
work_productivity = get_eurostat(id = "tec00116")
work_productivity_rs <- work_productivity %>%
  filter(geo == "RS") %>%
  select(-unit, -na_item)

wp_rs_evolution <- ggplot(work_productivity_rs, aes(x = TIME_PERIOD, y = values)) +
  geom_line() +
  labs(x = "time", y = "annual work productivity") +
  ggtitle("SERBIA ANNUAL WP") +
  theme_minimal()
print(wp_rs_evolution)

# comparaison des gdp
gdp_comp <- okun_law %>% filter(geo %in% c("RS", "FR", "EU27_2020"))
gdp_evolution <- ggplot(gdp_comp, aes(x = time, y = growth_rate, color = geo)) +
  geom_line() +
  labs(x = "time", y = "annual growth rate") +
  ggtitle("ANNUAL GROWTH RATE in France, EU27 and Serbia") +
  theme_minimal()
print(gdp_evolution)


rs_data <- okun_rs %>% select(growth_rate, unemply_gap) # Régression
lm_rs <- lm(growth_rate ~ unemply_gap, data = rs_data)
summary(lm_rs)