{{
  config(
    unique_key='company_id'
    )
}}
with company as (
    select *
    from {{ ref('stg_hubspot__company') }}
)
select
    {{dbt_utils.surrogate_key(['company_id'])}} as company_sk,
    *
from company