with source as (

    select * from {{ source('public', 'CITIBIKE_TRIPS') }}

),

renamed as (

   SELECT
    tripduration AS trip_duration,
    date_trunc('hour', starttime) as trip_hour,
    date(starttime) as trip_date,
    year(start_time) as trip_year,
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
    Dummy AS placeholder,  
    usertype AS user_type,
    CASE 
        WHEN birth_year IS NULL OR TRIM(birth_year) = '' THEN NULL
        WHEN TRY_CAST(birth_year AS INT) IS NOT NULL THEN CAST(birth_year AS INT)
        ELSE NULL
    END AS birth_year,   
    gender,
    from source

)

select * from renamed