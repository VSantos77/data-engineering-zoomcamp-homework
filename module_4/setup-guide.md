# Setup Guide

## Cloud (using BigQuery)

1. Run load data step (ensure SA exists and keys is in project/utils/keys folder)

```
uv run python -m utils.scripts.load_data_to_gcs
```

2. Set up dbt - bigquery connection

- Add dbt-bigquery connector to dependencies

```
# If already installed google-cloud-storage, we need to specify to use a lower version
uv add "dbt-bigquery>=1.8.0" "google-cloud-storage<3.0.0"
```

- Adjust profiles.yml to use bigquery profile
- Adjust dbt_project.yml to use defined bigquery profile
- Run `dbt debug`. If all checks passed, setup is OK.

## Local using DuckDB

1. Create venv
2. Add duckdb

Test version with (duckdb is a library and not a standalone executable)

```
uv run python -c "import duckdb; print(duckdb.__version__)"
```

3. Install dbt's duckdb connector

```
uv add dbt-duckdb
```

4. Create dbt project

```
uv run dbt init de_zoomcamp_module_4_homework
```

Choose connector if there are multiple (duckdb)

5. Update the profiles.yml to adjust project settings

This is usually created in 'C://Users/[user_name]/.dbt/'

6. Copy `ingest.py` from the Git Repo into the dbt project and run it

- This will download data to ./data
- Add files to .gitignore
- Create a duck db database, create a prod schema and create raw tables for green and yellow taxidata

7. Test if things worked correctly by going into duckdb ui

- Need to have duckdb CLI installed. Run `choco install duckdb` in Powershell (need chocolatey or any other package admin)
- Run `duckdb -ui`. A new browser tab will open.
- Add a new database, pointing to the .db file in the project folder
- Open a new notebook and run a `SELECT COUNT(*)` on any of the tables.