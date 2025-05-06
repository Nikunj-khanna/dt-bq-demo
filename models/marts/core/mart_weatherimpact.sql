SELECT 
    trip_date,
    trip_year,
    trip_month,
    weather_main,
    weather_description,
    temperature
    FROM {{ ref('int_bike_weather') }}
