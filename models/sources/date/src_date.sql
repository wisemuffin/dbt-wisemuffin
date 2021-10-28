WITH date_spine AS (

  {{ dbt_utils.date_spine(
      start_date="date_add(current_date,  INTERVAL -10 YEAR)",
      datepart="day",
      end_date="date_add(current_date,  INTERVAL 3 YEAR)"
     )
  }}

), calculated1 as (

    SELECT  
      date_day,
      date_day                                                                                AS date_actual,


      format_datetime('%A',date_day)                                                            AS day_name,

      EXTRACT(month from date_day)                                                            AS month_actual,
      EXTRACT(year from date_day)                                                             AS year_actual,
      EXTRACT(quarter from date_day)                                                            AS quarter_actual,

      EXTRACT(dayofweek from date_day) + 1                                                      AS day_of_week,

      EXTRACT(day from date_day)                                                              AS day_of_month,

      format_datetime('%M',date_day)                                                                   AS month_name,

      -- TRUNC(date_day, 'Month')                                                                AS first_day_of_month,

    FROM date_spine

)
, calculated2 as (

    SELECT  *,
      -- CASE WHEN day_name = 'Sun' THEN date_day
      --   ELSE date_sub(DATE_TRUNC('week', date_day),  INTERVAL 1 DAY) END                             AS first_day_of_week,

      CASE WHEN month_actual < 2
        THEN year_actual
        ELSE (year_actual+1) END                                                              AS fiscal_year,
      CASE WHEN month_actual < 2 THEN '4'
        WHEN month_actual < 5 THEN '1'
        WHEN month_actual < 8 THEN '2'
        WHEN month_actual < 11 THEN '3'
        ELSE '4' END                                                                          AS fiscal_quarter,

      -- LAST_VALUE(date_day) OVER (PARTITION BY year_actual, month_actual ORDER BY date_day)    AS last_day_of_month,

      -- FIRST_VALUE(date_day) OVER (PARTITION BY year_actual ORDER BY date_day)                 AS first_day_of_year,
      -- LAST_VALUE(date_day) OVER (PARTITION BY year_actual ORDER BY date_day)                  AS last_day_of_year,

      -- FIRST_VALUE(date_day) OVER (PARTITION BY year_actual, quarter_actual ORDER BY date_day) AS first_day_of_quarter,
      -- LAST_VALUE(date_day) OVER (PARTITION BY year_actual, quarter_actual ORDER BY date_day)  AS last_day_of_quarter,


      -- LAST_VALUE(date_day) OVER (PARTITION BY first_day_of_week ORDER BY date_day)            AS last_day_of_week,



    FROM calculated1

)
, calculated3 as (

    SELECT  *,


      -- (fiscal_year || '-' || DECODE(fiscal_quarter,
      --   1, 'Q1',
      --   2, 'Q2',
      --   3, 'Q3',
      --   4, 'Q4'))                                                                             AS fiscal_quarter_name,  
      -- ('FY' || SUBSTR(fiscal_quarter_name, 3, 7))                                             AS fiscal_quarter_name_fy,
      -- DENSE_RANK() OVER (ORDER BY fiscal_quarter_name)                                        AS fiscal_quarter_number_absolute,
      -- fiscal_year || '-' || MONTHNAME(date_day)                                               AS fiscal_month_name,
      -- ('FY' || SUBSTR(fiscal_month_name, 3, 8))                                               AS fiscal_month_name_fy,


    FROM calculated2

)
SELECT 
*
FROM calculated3