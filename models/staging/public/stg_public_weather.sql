with source as (

    select * from {{ source('public', 'WEATHER') }}

),

renamed as (

  SELECT
    timestamp AS weather_timestamp,
    temperature,
    temp_max,
    temp_min,
    pressure,
    humidity,
    cloud_coverage,
    weather_id,
    weather_main,
    weather_description,
    weather_icon,
    wind_speed,
    wind_direction
    from source

)

select * from renamed