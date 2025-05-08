select trip_date,
    trip_year,
    trip_month,
    weather_main,
    weather_description,
    total_trips,
    avg_temp,user_type,
    avg_trip_duration
    from(

SELECT distinct
    trip_date,
    trip_year,
    trip_month,
    weather_main,
    LOWER(weather_description) as weather_description,
    AVG(temperature - 273.15) as avg_temp,user_type,
    avg(trip_duration) as avg_trip_duration,
    count(*) as total_trips
    FROM {{ ref('int_bike_weather') }}
    group by trip_date,
    trip_year,
    trip_month,
    weather_main,user_type,
    weather_description )
    
