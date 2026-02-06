# Module 3 Homework

1. Set up project folder and python venv using uv
2. Run `load_data_to_gcs.py` to load data to GCS
3. Run SQL contained in M3_homework.sql.

## Answers

### Question 1

Answer:
> 20,332,093

### Question 2

Answer:
> 0 MB for the External Table and 155.12 MB for the Materialized Table

### Question 3

Answer:
> BigQuery is a columnar database, and it only scans the specific columns requested in the query. Querying two columns (PULocationID, DOLocationID) requires reading more data than querying one column (PULocationID), leading to a higher estimated number of bytes processed.

### Question 4

Answer:
> 8333

### Question 5

Answer:
> Partition by tpep_dropoff_datetime and Cluster on VendorID

### Question 6

Answer:
> 310.24 MB for non-partitioned table and 26.84 MB for the partitioned table

### Question 7

Answer:
> It's stored in the GCP Bucket

### Question 8

Answer:
> False, it depends on the size of your table. Additionally, partitioning might be more recommended if you plan on filtering on the target column more.

### Question 9

Answer:
> Bytes scanned is 0B. The reason behind this is that the metadata for the table already has the row count, so no bytes need to be processed.