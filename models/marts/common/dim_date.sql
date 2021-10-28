WITH dates AS (

  SELECT *
  FROM {{ ref('stg_date') }}

), final AS (

  SELECT
    *
  FROM dates

)
select *
from final
