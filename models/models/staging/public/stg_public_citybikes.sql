with source as (

    select * from {{ source('sourcepublic', 'CITIBIKE_TRIPS') }}

),

renamed as (



SELECT
    tripduration AS trip_duration,
    starttime AS start_time,
    stoptime AS stop_time,
    start_station_id AS start_station_id,
    start_station_name AS start_station_name,
    start_station_latitude AS start_station_latitude,
    start_station_longitude AS start_station_longitude,
    end_station_id AS end_station_id,
    end_station_name AS end_station_name,
    end_station_latitude AS end_station_latitude,
    end_station_longitude AS end_station_longitude,
    bikeid AS bike_id,
    Dummy AS dummy,  -- Consider renaming if 'Dummy' is a placeholder
    usertype AS user_type,
    birth_year AS birth_year,  -- Consider casting to INT if it's numeric
    gender AS gender

    from source

)

select * from renamed