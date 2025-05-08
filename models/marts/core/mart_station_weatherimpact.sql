WITH base AS (

    SELECT
        trip_date,
        start_station_id,
        end_station_id,
        user_type,
        temperature,
        weather_main,
        weather_description,
        trip_duration
    FROM {{ ref('int_bike_weather') }}

),

start_station_summary AS (

    SELECT
        trip_date,
        start_station_id AS station_id,
        user_type,
        AVG(temperature - 273.15) AS avg_temp,
        COUNT(*) AS trips_started,
        AVG(trip_duration) AS avg_duration_start,
        weather_main,
        weather_description
    FROM base
    WHERE start_station_id IS NOT NULL
    GROUP BY trip_date, start_station_id, user_type, weather_main, weather_description

),

end_station_summary AS (

    SELECT
        trip_date,
        end_station_id AS station_id,
        user_type,
        COUNT(*) AS trips_ended,
        AVG(trip_duration) AS avg_duration_end
    FROM base
    WHERE end_station_id IS NOT NULL
    GROUP BY trip_date, end_station_id, user_type

),

combined AS (

    SELECT 
        ss.trip_date,
        ss.station_id,
        s.station_name,
        s.latitude,
        s.longitude,
        ss.user_type,
        ss.avg_temp,
        ss.weather_main,
        ss.weather_description,
        ss.trips_started,
        ss.avg_duration_start,
        es.trips_ended,
        es.avg_duration_end
    FROM start_station_summary ss
    LEFT JOIN end_station_summary es
        ON ss.trip_date = es.trip_date
        AND ss.station_id = es.station_id
        AND ss.user_type = es.user_type
    LEFT JOIN {{ ref('dim_station') }} s
        ON ss.station_id = s.station_id

)

SELECT * FROM combined
