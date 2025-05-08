WITH all_stations AS (
    SELECT 
        start_station_id AS station_id,
        start_station_name AS station_name,
        start_station_latitude AS latitude,
        start_station_longitude AS longitude
    FROM {{ ref('stg_public_citybikes') }}
    WHERE start_station_id IS NOT NULL

    UNION ALL

    SELECT 
        end_station_id AS station_id,
        end_station_name AS station_name,
        end_station_latitude AS latitude,
        end_station_longitude AS longitude
    FROM {{ ref('stg_public_citybikes') }}
    WHERE end_station_id IS NOT NULL
),

ranked AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY station_id ORDER BY station_name) AS row_num
    FROM all_stations
)

SELECT
    station_id,
    station_name,
    latitude,
    longitude
FROM ranked
WHERE row_num = 1
