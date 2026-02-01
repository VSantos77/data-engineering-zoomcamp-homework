# Module 2 Homework

## Quiz Questions

### Question 1

Answer:
> 128.3 MiB

### Question 2

Answer:
> green_tripdata_2020-04.csv

### Question 3

```
SELECT
	COUNT(1)
FROM
	yellow_tripdata
WHERE
	filename ILIKE '%yellow_tripdata_2020%'
```

Answer:
> 24,648,499

### Question 4

```
SELECT
	COUNT(1)
FROM
	green_tripdata
WHERE
	filename ILIKE '%green_tripdata_2020%'
```

Answer:
> 1,734,051

### Question 5

```
SELECT
	COUNT(1)
FROM
	yellow_tripdata
WHERE
	filename = 'yellow_tripdata_2021-03.csv'
```

Answer:
> 1,925,152

### Question 6

Answer:
> Add a `timezone` property set to `America/New_York` in the `Schedule` trigger configuration