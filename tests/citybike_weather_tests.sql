select 
    count(*) as num_null_trip_durations
from {{ ref('stg_public_citybikes') }}
where trip_duration is null
having count(*) > 0;


select 
    count(*) as num_negative_trip_durations
from {{ ref('stg_public_citybikes') }}
where trip_duration < 0
having count(*) > 0;


select 
    count(*) as num_null_or_zero_bike_ids
from {{ ref('stg_public_citybikes') }}
where bike_id is null or bike_id = 0
having count(*) > 0;