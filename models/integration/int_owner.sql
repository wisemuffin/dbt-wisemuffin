{{
    config(
        unique_key='owner_id'
    )
}}
with owner as (
    select *
    from {{ ref('stg_hubspot__owner') }}
)
select 
    {{dbt_utils.surrogate_key(['owner_id'])}} as owner_sk,
    *
from owner