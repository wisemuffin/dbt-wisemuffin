WITH source AS (

    SELECT *
    FROM {{ ref('src_date')}}

)

SELECT *
FROM source