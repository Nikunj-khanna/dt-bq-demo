WITH trips AS (
    SELECT
        *,
        DATE_TRUNC('HOUR', start_time) AS trip_hour,
        start_time as starttime
    FROM {{ ref('stg_public_citybikes') }}
),

weather_by_hour AS (
    SELECT
        *,
        DATE_TRUNC('HOUR', weather_timestamp) AS weather_hour,weather_timestamp as weathertimestamp
    FROM {{ ref('stg_public_weather') }}
)

SELECT
    t.*,w.weathertimestamp,
    w.temperature,
    w.temp_max,
    w.temp_min,
    w.pressure,
    w.humidity,
    w.weather_main,
    w.weather_description,
    w.weather_icon
FROM trips t
LEFT JOIN weather_by_hour w
    ON t.starttime = w.weathertimestamp
