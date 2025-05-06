SELECT 
    trip_date,trip_year,trip_month,
    weather_main,
    weather_description,
    AVG(total_trips) AS avg_trips
FROM (
    SELECT 
        trip_date,trip_year,trip_month,
        weather_main,
        weather_description,
        COUNT(*) AS total_trips
    FROM {{ ref('int_bike_weather') }}
    GROUP BY trip_date, weather_main, weather_description,trip_year,trip_month
)
GROUP BY trip_date, weather_main, weather_description,trip_year,trip_month
