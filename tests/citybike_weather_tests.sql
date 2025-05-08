
select 
    count(*) as num_null_trip_durations
from {{ ref('stg_public_citybikes') }}
where trip_duration is null
 union all

select 
    count(*) as num_negative_trip_durations
from {{ ref('stg_public_citybikes') }}
where trip_duration < 0

union all
select 
    count(*) as num_null_or_zero_bike_ids
from {{ ref('stg_public_citybikes') }}
where bike_id is null or bike_id = 0

