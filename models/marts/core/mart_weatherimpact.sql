select trip_date,
    trip_year,
    trip_month,
    weather_main,
    weather_description,
    total_trips
    from(

SELECT 
    trip_date,
    trip_year,
    trip_month,
    weather_main,
    weather_description,
    count(*) as total_trips
    FROM {{ ref('int_bike_weather') }}
    group by trip_date,
    trip_year,
    trip_month,
    weather_main,
    weather_description )
    
