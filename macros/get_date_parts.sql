{% macro get_date_parts(date_column)%}

(select struct (
    {{date_column}} as original_date,
    extract (year from {{date_column}} ) as year,
    extract (month from {{date_column}} ) as month,
    extract (day from {{date_column}} ) as day,
    extract (DAYOFWEEK from {{date_column}} ) as DAYOFWEEK,
    extract (DAYOFYEAR from {{date_column}} ) as DAYOFYEAR,
    extract (WEEK from {{date_column}} ) as WEEK,
    extract (QUARTER from {{date_column}} ) as QUARTER) AS EXTRACT_DATE

)
{%endmacro%}