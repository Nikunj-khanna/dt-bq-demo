
    select customer_id,
    concat(first_name,' ',last_name) as customer_name,
    email as email_Address,
    address as billing_address
    from raw.Customer
