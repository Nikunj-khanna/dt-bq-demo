with source as (

    select * from {{ source('sourcepublic', 'WEATHER') }}

),

renamed as (

SELECT
    timestamp AS weather_timestamp,
    temperature AS temperature,
    temp_max AS temperature_max,
    temp_min AS temperature_min,
    pressure AS pressure,
    humidity AS humidity,
    cloud_coverage AS cloud_coverage,
    weather_id AS weather_id,
    weather_main AS weather_main,
    weather_description AS weather_description,
    weather_icon AS weather_icon,
    wind_speed AS wind_speed,
    wind_direction AS wind_direction    from source

)

select * from renamed