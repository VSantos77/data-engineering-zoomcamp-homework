with source as (
        select * from {{ source('staging', 'external_fhv_data') }}
  ),
  renamed as (
      select
          cast(PUlocationID as integer) AS pickup_location_id,
          cast(DOlocationID as integer) AS dropoff_location_id,
          cast(dispatching_base_num AS string) AS dispatching_base_num,
          cast(Affiliated_base_number as string) AS affiliated_base_number,
          cast(pickup_datetime as timestamp) AS pickup_datetime,
          cast(dropOff_datetime as timestamp) AS dropOff_datetime,
          cast(SR_Flag as boolean) AS sr_flag
      from source
      where dispatching_base_num IS NOT NULL
  )
  select * from renamed
    