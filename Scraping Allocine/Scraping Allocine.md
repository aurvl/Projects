# 🎥 AlloCiné TV Series Scraping Project

## Description
Ever wondered how you can extract and analyze TV series data straight from the web? This project is all about scraping TV series data from AlloCiné, organizing it into a structured format, and conducting cool analyses! We scraped data like the series title, period, duration, genre, ratings, and more to create a comprehensive dataset. 📊

And that's not all! After building the dataset, we took it to the next level by importing it into SQL and running some awesome queries to find insights like the top-rated series and the ones with the most critiques. 🌟

## Goals
- 🚀 Scrape TV series data from AlloCiné HTML pages and store it in a clean DataFrame.
- 🧹 Clean and process the data to make it ready for analysis.
- 🧐 Analyze the data to uncover key insights such as:
  - The series with the best **press rating** 🎖️
  - The series with the highest **audience rating** 🎬
  - The series with the **most critics** 🗣️
- 💾 Store the data in a SQL database and run insightful queries.

## Dataset
The dataset consists of 57 TV series scraped from [AlloCiné](https://www.allocine.fr/). The information includes:
- **Title** 🎞️
- **Status** (e.g., ongoing or canceled) 🚥
- **Period** (e.g., 2010 - 2015) 🗓️
- **Duration** of episodes ⏳
- **Genre** 🎭
- **Director** 🎬
- **Main Cast** 🎥
- **Nationality** 🌍
- **Channel** 📺
- **Press and Audience Ratings** 🌟
- **Number of Seasons & Episodes** 📅
- **Description** 📜

## SQL Queries and Insights
Once the data was imported into SQL ([series.sql](https://github.com/aurvl/Projects/blob/main/Scraping%20Allocine/series.sql)), I ran queries to discover:
- 📈 **The series with the highest press rating**.
- ⭐ **The most loved by the audience** based on public ratings.
- 📝 **The series with the most critiques** from the press.
- etc...
  
The power of SQL helped me dive deeper into the data and unlock these fascinating insights!💡 (for an example please refer to [analysis.Rmd](https://github.com/aurvl/Projects/blob/main/Scraping%20Allocine/analysis/analysis.Rmd) or [download the analysis](https://github.com/aurvl/Projects/blob/main/Scraping%20Allocine/analysis/analysis.html)).

## Tools
- **Python** 🐍 for web scraping and data manipulation.
  - `pandas` for handling DataFrames and data processing.
  - `re` (regular expressions) for extracting patterns from the HTML.
  - `html` unescaping to clean the scraped text.
- **SQL** 🛠️ for advanced queries on the dataset.
- **VS Code** for development 💻.

<br>

<br>

*Enjailles-toi !* 🎉
