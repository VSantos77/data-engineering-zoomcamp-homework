################## SETUP ##################

# Create Dataset

CREATE SCHEMA IF NOT EXISTS `vocal-tracer-484119-t7.ny_taxi_data`
OPTIONS(
  location = 'us-central1',
  description = 'NY Taxi Dataset for DE Zoomcamp 2026'
);

# Create External Table

CREATE OR REPLACE EXTERNAL TABLE `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_external`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dezoomcamp_hw3_2026_santiago_villaverde/yellow_tripdata_2024-*.parquet']
);

# Create Materialized Table

CREATE OR REPLACE TABLE `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024` AS (
  SELECT
    *
  FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_external`
);


################## QUESTIONS ##################

# Question 1

SELECT
  COUNT(1)
FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_external`;

-- A: 20,332,093

# Question 2

SELECT
  COUNT(DISTINCT PULocationID)
FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_external`;

-- A: 0B

SELECT
  COUNT(DISTINCT PULocationID)
FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024`;

 -- A: 155.12 MB

 # Question 3
 SELECT
  PULocationID
FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024`;

-- Processes 155.12 MB

 SELECT
  PULocationID,
  DOLocationID
FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024`;

-- Processes 310.24 MB

-- A: BQ uses columnar storage. Reading more columns implies more data being processed.

# Question 4

SELECT
  COUNT(1)
FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024`
WHERE COALESCE(fare_amount,0) = 0;

-- A: 8333

# Question 5

CREATE OR REPLACE TABLE `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_optimized`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_external`;


-- A: Partition by tpep_dropoff_datetime and clustering by VendorID

# Question 6

SELECT
  DISTINCT VendorID
FROM 
  `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024`
WHERE
  tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

-- A: 310.24 MB

-- Using optimized version
SELECT
  DISTINCT VendorID
FROM 
  `vocal-tracer-484119-t7.ny_taxi_data.yellow_taxi_data_h1_2024_optimized`
WHERE
  tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

-- A: 26.84 MB
