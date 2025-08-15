### Cleaning the data
## Create Staging Table
CREATE TABLE data_staging 
LIKE data_raw;

INSERT data_staging
SELECT *
FROM data_raw;

## Remove Duplicates
	## Checking for duplicates with CTE Function

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY area_codes_2020,areas) as row_num
FROM data_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
## No Duplicates are present

## Remove unwanted columns
	## We will start with creating a second staging table

CREATE TABLE `data_staging2` (
  `_record_number` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `prefectures_2000` varchar(16) DEFAULT NULL,
  `area_codes_2000` int DEFAULT NULL,
  `areas_in_2000` decimal(6,1) DEFAULT NULL,
  `prefectures_2020` varchar(16) DEFAULT NULL,
  `area_codes_2020` int DEFAULT NULL,
  `areas` varchar(57) DEFAULT NULL,
  `population_total` int DEFAULT NULL,
  `population_male` int DEFAULT NULL,
  `population_female` int DEFAULT NULL,
  `population_in_2015` int DEFAULT NULL,
  `population_change` int DEFAULT NULL,
  `population_change_percentage` decimal(8,2) DEFAULT NULL,
  `sex_ratio` decimal(6,2) DEFAULT NULL,
  `area_km2` decimal(9,2) DEFAULT NULL,
  `population_density` decimal(7,1) DEFAULT NULL,
  `num_of_households` int DEFAULT NULL,
  `num_of_private_households` int DEFAULT NULL,
  `num_of_institutional_households` varchar(6) DEFAULT NULL,
  `num_of_households_2015` int DEFAULT NULL,
  `num_of_households_change` int DEFAULT NULL,
  `num_of_households_change_percent` decimal(8,2) DEFAULT NULL,
  `household_members` int DEFAULT NULL,
  `household_members_private` int DEFAULT NULL,
  `household_members_institutional` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`_record_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4087 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table imported using\nCSV Lint plug-in: v0.4.6.8\nFile: census_data_raw_fixed.csv\nDate: 29-Jul-2025 21:32';

INSERT INTO data_staging2
SELECT *
FROM data_staging;

## Removing unwanted columns
ALTER TABLE data_staging2
DROP COLUMN id,
DROP COLUMN prefectures_2000,
DROP COLUMN areas_in_2000;

SELECT *
FROM data_staging2;

