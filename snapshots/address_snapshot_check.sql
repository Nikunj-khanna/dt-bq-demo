{%snapshot address_snapshot_check %}
{{
    config (
         target_schema='snapshot',
         strategy='check',
         unique_key='customer_id',
         check_cols=['address'],


    )


}}

select * from raw.Customer
{%endsnapshot%}