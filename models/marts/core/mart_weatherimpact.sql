SELECT 
    trip_date,trip_year,
    weather_main,
    weather_description,
    AVG(temperature) AS avg_temp,
    AVG(total_trips) AS avg_trips
FROM (
    SELECT 
        trip_date,trip_year,
        weather_main,
        weather_description,
        temperature,
        COUNT(*) AS total_trips
    FROM {{ ref('int_bike_weather') }}
    GROUP BY trip_date, weather_main, weather_description, temperature,trip_year
)
GROUP BY trip_date, weather_main, weather_description,trip_year
