## Exploratory Data Analysis

## Looking into per prefecture
SELECT prefectures_2020 as prefecture,
sum(population_total) as pop_total, 
sum(population_in_2015) as pop_in_2015,
sum(population_change) as pop_change, 
sum(population_change)/sum(population_in_2015) as pop_change_proportion,
sum(area_km2) as area_km2,
sum(population_total)/sum(area_km2) as pop_density_perkm2,
sum(num_of_households) as num_of_households,
sum(num_of_households_2015) as num_of_households_2015,
sum(num_of_households_change) as num_of_households_change,
sum(num_of_households_change)/sum(num_of_households_2015) as households_change_proportion
FROM data_staging2
GROUP BY prefectures_2020
ORDER BY pop_density_perkm2 DESC;

SELECT prefectures_2020 as prefecture,
sum(population_total) as pop_total, 
sum(population_in_2015) as pop_in_2015,
sum(population_change) as pop_change, 
sum(population_change)/sum(population_in_2015) as pop_change_proportion,
sum(area_km2) as area_km2,
sum(population_total)/sum(area_km2) as pop_density_perkm2
FROM data_staging2
GROUP BY prefectures_2020
ORDER BY pop_density_perkm2 ASC
LIMIT 10;

## Looking at Data for all of Japan
SELECT population_total, population_male, population_female, population_change_percentage, num_of_households, num_of_households_change_percent
FROM data_staging2
WHERE area_codes_2000 = 0;