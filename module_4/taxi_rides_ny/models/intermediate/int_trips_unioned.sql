-- Creating a union of green and yellow taxi trips, since we want to have a fct trips model.
-- Convention: list all CTEs before using.
with green_data as (
    select *, 
        'Green' as service_type 
    from {{ ref('stg_green_tripdata') }}
), 

yellow_data as (
    select *, 
        'Yellow' as service_type,
        -- There's a mismatch in the number of cols between green and yellow:
        1 AS trip_type,  -- Yellow taxis are always street-hail, so we can set this to 1
        0 AS ehail_fee  -- Yellow taxis don't have an ehail fee.
    from {{ ref('stg_yellow_tripdata') }}
), 

trips_unioned as (
    select * from green_data
    union all
    select * from yellow_data
)

select * from trips_unioned