WITH date_table AS (

    SELECT
        date_day
    FROM
        TABLE(GENERATOR(ROWCOUNT => 365 * 5)) 
    QUALIFY
        date_day := DATEADD(DAY, ROW_NUMBER() OVER () - 1, '2016-01-01')  -- Adjust start date as needed

),

final AS (

    SELECT
        date_day AS date,
        EXTRACT(YEAR FROM date_day) AS year,
        EXTRACT(MONTH FROM date_day) AS month,
        EXTRACT(DAY FROM date_day) AS day,
        EXTRACT(DAYOFWEEK FROM date_day) AS day_of_week,
        CASE WHEN EXTRACT(DAYOFWEEK FROM date_day) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend,
        TO_CHAR(date_day, 'Month') AS month_name,
        TO_CHAR(date_day, 'Day') AS day_name,
        CASE 
            WHEN EXTRACT(MONTH FROM date_day) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH FROM date_day) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH FROM date_day) BETWEEN 9 AND 11 THEN 'Fall'
            ELSE 'Winter'
        END AS season
    FROM date_spine

)

SELECT * FROM final
