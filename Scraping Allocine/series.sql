-- SQL QUERIES ON ALLOCINE TV SERIES DATA
-- This SQL code is designed to explore and analyze the AlloCiné TV series data by first creating a database and table structure, importing the dataset, and then running a variety of queries. These queries help answer important questions, such as the number of series in each category, top-rated series, and relationships between variables like duration and audience ratings.
-- The insights can be further used for statistical or machine learning analysis after exporting relevant data from the database (e.g. 'analysis.Rmd').

-- 1. Creating a Database and Table
-- Create the database and switch to it
CREATE DATABASE SeriesDB;
USE SeriesDB;

-- Create the series table with appropriate columns
CREATE TABLE series (
	id INT AUTO_INCREMENT PRIMARY KEY,                -- Unique ID for each series
	title VARCHAR(255) NOT NULL,                      -- Series title
	status VARCHAR(50) DEFAULT NULL,                  -- Status of the series (e.g., Ongoing, Canceled)
	period VARCHAR(50) DEFAULT NULL,                  -- Time period the series aired (e.g., 2010 - 2014)
	duration INT DEFAULT NULL,                        -- Duration of each episode in minutes
	genre VARCHAR(100) DEFAULT NULL,                  -- Genre of the series (e.g., Drama, Comedy)
	director VARCHAR(255) DEFAULT NULL,               -- Director of the series
	main_character VARCHAR(255) DEFAULT NULL,         -- Main character in the series
	nationality VARCHAR(100) DEFAULT NULL,            -- Nationality of the series
	channel VARCHAR(100) DEFAULT NULL,                -- Original TV channel for the series
	press_rating DECIMAL(2, 1) DEFAULT NULL,          -- Average press rating for the series
	press_critics INT DEFAULT NULL,                   -- Number of press reviews
	audience_rating DECIMAL(2, 1) DEFAULT NULL,       -- Average audience rating for the series
	seasons_nb INT DEFAULT NULL,                      -- Number of seasons
	episodes_nb INT DEFAULT NULL,                     -- Number of episodes
	description TEXT DEFAULT NULL                     -- Description of the series
);

-- 2. Importing Data into the Table
-- Importing the film_data.csv into this table
/**
1 - Right-click on the table in the navigator 'SCHEMAS'
2 - Click on 'Table Data Import Wizard'
3 - Browse or paste the path to the .csv file
4 - Ensure the columns match the structure of the table
**/
SELECT * FROM series;

-- 3. Exploratory Analysis

# a) Counting the Number of Series
-- Count the number of distinct series titles
SELECT COUNT(DISTINCT title) AS 'Number of Series'
FROM series;

# b) Group Series by Status, Genre, Nationality, and Channel
-- Group series by status
SELECT COALESCE(status, 'NULL') AS Status, COUNT(*) AS 'Number of Series'
FROM series
GROUP BY COALESCE(status, 'NULL')
ORDER BY `Number of Series` DESC;

-- Group series by genre
SELECT genre, COUNT(*) AS 'Number of Series'
FROM series
GROUP BY genre
ORDER BY `Number of Series` DESC;

-- Group series by nationality (country)
SELECT nationality AS Country, COUNT(*) AS 'Number of Series'
FROM series
GROUP BY nationality
ORDER BY `Number of Series` DESC;

-- Group series by original TV channel
SELECT channel AS 'TV Channel', COUNT(*) AS 'Number of Series'
FROM series
GROUP BY channel
ORDER BY `Number of Series` DESC;

# c) Calculate Averages
-- Calculate averages for duration, ratings, seasons, and episodes
SELECT	AVG(duration) AS 'Average Duration (in min)',
		AVG(press_rating) AS 'Average Press Rating',
		AVG(press_critics) AS 'Average Number of Critics',
		AVG(audience_rating) AS 'Average Audience Rating',
        AVG(seasons_nb) AS 'Average Number of Seasons',
		AVG(episodes_nb) AS 'Average Number of Episodes'
FROM series;

-- 4. Top Rated Series by Press and Audience
-- Top 10 series with the highest press rating
SELECT title, press_rating, press_critics
FROM series
ORDER BY press_rating DESC
LIMIT 10;

-- Top 5 series loved by the audience based on audience rating
SELECT title, audience_rating
FROM series
ORDER BY audience_rating DESC
LIMIT 5;

-- Top 5 countries based on average audience rating
SELECT nationality AS Country, AVG(audience_rating) AS 'Average Audience Rating'
FROM series
GROUP BY nationality
ORDER BY `Average Audience Rating` DESC
LIMIT 5;

-- Most criticized genre by the press
SELECT genre AS Genre, AVG(press_critics) AS 'Average Number of Critics'
FROM series
GROUP BY genre
ORDER BY `Average Number of Critics` DESC;
