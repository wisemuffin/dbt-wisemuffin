{{
  config(
    enabled=false
    )
}}
with deal_contact as (
    select *
    from {{ ref('stg_hubspot__deal_contact') }}
)
select 
    {{dbt_utils.surrogate_key(['deal_id'])}} as deal_sk,
    {{dbt_utils.surrogate_key(['contact_id'])}} as contact_sk
from deal_contact