{{
  config(
    unique_key='contact_id'
    )
}}
with contact as (
    select *
    from {{ ref('stg_hubspot__contact') }}
)
select
    {{dbt_utils.surrogate_key(['contact_id'])}} as contact_sk,
    *
from contact