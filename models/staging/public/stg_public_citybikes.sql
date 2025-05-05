with source as (

    select * from {{ source('public', 'CITIBIKE_TRIPS') }}

),

renamed as (

   SELECT
    tripduration AS trip_duration,
    starttime AS start_time,
    stoptime AS stop_time,
    start_station_id,
    start_station_name,
    start_station_latitude,
    start_station_longitude,
    end_station_id,
    end_station_name,
    end_station_latitude,
    end_station_longitude,
    bikeid AS bike_id,
    Dummy AS dummy,  -- Optional: rename if "Dummy" is a placeholder
    usertype AS user_type,
    birth_year,       -- Optional: CAST(birth_year AS INT) if needed
    gender,
    from source

)

select * from renamed