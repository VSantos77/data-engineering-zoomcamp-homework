with trips_unioned as (
    {{ dbt_utils.union_relations(
        relations = [ref('stg_green_tripdata'), ref('stg_yellow_tripdata')],
        source_column_name = None
    ) }}
)

select * from trips_unioned