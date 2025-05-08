WITH start_stations AS (

    SELECT DISTINCT
        start_station_id AS station_id,
        start_station_name AS station_name,
        start_station_latitude AS latitude,
        start_station_longitude AS longitude
    FROM {{ ref('stg_public_citybikes') }}
    WHERE start_station_id IS NOT NULL

),

end_stations AS (

    SELECT DISTINCT
        end_station_id AS station_id,
        end_station_name AS station_name,
        end_station_latitude AS latitude,
        end_station_longitude AS longitude
    FROM {{ ref('stg_public_citybikes') }}
    WHERE end_station_id IS NOT NULL

),

all_stations AS (

    SELECT * FROM start_stations
    UNION
    SELECT * FROM end_stations

)

SELECT DISTINCT * FROM all_stations
