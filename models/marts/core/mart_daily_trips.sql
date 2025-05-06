Select trip_date,
    trip_year,
    trip_month,
    count(*) as total_trips,
    avg(temperature) as avg_temp
    from {{ref('int_bike_weather')}}
    group by trip_date,
    trip_year,
    trip_month