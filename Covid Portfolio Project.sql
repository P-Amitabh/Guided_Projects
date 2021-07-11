-- SQL Project 1


-- We've run some general queries to understand the world covid data better.


-- Looking at total cases vs total deaths
-- This shows how likely you are to die if you get Covid-19 in India

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS 'Death %'
FROM covid_deaths
WHERE location LIKE '%India%'
ORDER BY location;

-- Looking at total cases vs total populations
-- This shows the percentage of the population that contracted Covid-19

SELECT location, date, total_cases, population, (total_cases/population)*100 AS 'Population %'
FROM covid_deaths
WHERE location LIKE '%India%'
ORDER BY location;

-- Top 20 Countries with highest infection rate compared to population

SELECT location, population, MAX(total_cases) as HighInfectionCount, MAX((total_cases/population))*100 AS InfectedPopulationPct
FROM covid_deaths
GROUP BY location,population
ORDER BY InfectedPopulationPct DESC
LIMIT 20;

-- Showing countries with the highest death count

SELECT location, MAX(CAST(total_deaths AS UNSIGNED int)) AS TotalDeathCount
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount desc;

-- Taking a look by continent

SELECT continent, MAX(CAST(total_deaths AS UNSIGNED int)) AS TotalDeathCount
FROM covid_deaths
GROUP BY continent
ORDER BY TotalDeathCount desc;

-- New cases per day

SELECT date, SUM(new_cases)
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY SUM(new_cases);


-- END --













