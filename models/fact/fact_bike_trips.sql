SELECT
    trip_duration,
    trip_hour,
    trip_date,
    trip_year,
    trip_month,
    start_time,
    stop_time,
    start_station_id,
    end_station_id,
    bike_id,
    user_type,
    birth_year,
    gender
FROM {{ ref('stg_public_citybikes') }}
