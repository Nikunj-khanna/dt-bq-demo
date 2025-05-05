select t.*,
        w.temperature,
        w.pressure,
        w.weather_main,
        w.weather_description,
        w.weather_id
FROM {{ ref('stg_public_citybikes') }} t
LEFT JOIN {{ ref('stg_public_weather') }} w
    ON t.trip_date = w.weather_date
