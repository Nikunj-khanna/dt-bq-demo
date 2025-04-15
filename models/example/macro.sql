select
O.Order_ID,
C.customer_id,
C.customer_name,
P.Product_ID,
P.Product_Name,
O.Quantity,
{{get_date_parts('Order_date')}} as date_extract
from raw.Order O
join
{{ref ("stg_customers")}} c on c.customer_id=o.customer_id
join
raw.Product p on p.Product_ID=o.Product_ID
