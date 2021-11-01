{{
    config(
        unique_key='deal_id'
    )
}}

with deal as (
    select *
    , 1 as demo_lineage
    , 2 as demo_line2
    from {{ ref('stg_hubspot__deal') }}
)
select
    deal.*
from deal