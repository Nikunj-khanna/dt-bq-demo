select trip_date,
count(*) as total_trips,
count(distinct user_type) as user_types,
avg(temperature) as avg_temp
from {{ref("int_bike_weather")}}
group by trip_date