{{
    config(
        unique_key='deal_id'
    )
}}

with deal as (
    select *
    , 1 as demo_lineage
    from {{ ref('stg_hubspot__deal') }}
)
select
    deal.*
from deal