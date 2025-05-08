WITH trips AS (
    SELECT * FROM {{ ref('fact_bike_trips') }}
),

weather AS (
    SELECT * FROM {{ ref('stg_public_weather') }}
)

SELECT 
    t.*,
    w.temperature,
    w.pressure,
    w.weather_main,
    w.weather_description,
    w.weather_id
FROM trips t
LEFT JOIN weather w ON t.trip_date = w.weather_date
