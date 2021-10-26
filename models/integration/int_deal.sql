{{
    config(
        unique_key='deal_id'
    )
}}

with deal as (
    select *
    from {{ ref('stg_hubspot__deal') }}
)
select
    deal.*
from deal