select count(*) as num_orders_today
from {{ref('stg_orders')}} 
where date(Order_date)= current_date()
having count(*)>0