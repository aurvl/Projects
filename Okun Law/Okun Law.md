# Analysis of Economic Indicators: Okun's Law 📉

#### Structure of the Famd directory
```
Okun Law/
  - Okun Law.md : Documentation on the project
  - okun_law.R : R script where analysis, visualisations and modelisations are realised.
  - Report.pdf : A PDF document that outlines all the steps and results of the project.
```

## Description
This project focuses on analyzing economic indicators, specifically GDP and unemployment rates, using data from Eurostat. The primary goal is to understand the relationships between GDP growth and unemployment rates through the lens of Okun's Law. Okun's Law provides a framework for exploring how changes in unemployment rates relate to changes in GDP, allowing us to assess economic performance and trends over time.

## Goals
- **Analyze Economic Trends**: Examine year-to-year trends in GDP and unemployment rates to understand their economic implications.
- **Apply Okun’s Law**: Use Okun's Law to investigate the relationship between unemployment rate changes and GDP growth.
- **Visualize Data**: Create visualizations to interpret the economic data and the results of the analysis.
- **Identify Anomalies**: Highlight specific cases, such as Serbia, where the relationship described by Okun's Law may not hold.

## Dataset
The analysis uses Eurostat data, including:
- **GDP Data**: Gross Domestic Product (GDP) in constant prices.
- **Unemployment Data**: Unemployment rates as a percentage of the active population.
- **Work Productivity Data**: Annual work productivity metrics.

## Tools
The analysis was performed using R with the following packages:
- **dplyr**: For data manipulation and cleaning.
- **ggplot2**: For data visualization.
- **eurostat**: For accessing Eurostat data.

## Key Functions Used
- `get_eurostat()`: Fetches data from Eurostat.
- `inner_join()`: Merges GDP and unemployment datasets.
- `mutate()`: Calculates annual growth rates and unemployment gaps.
- `ggplot()`: Creates various visualizations to display the results.
- `lm()`: Performs linear regression analysis.

For further details, please refer to the R script and the .md file provided in this repository (okun_law.R & OkunLawEU.md).
