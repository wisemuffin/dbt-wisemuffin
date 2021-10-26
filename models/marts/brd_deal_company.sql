with deal_company as (
    select *
    from {{ ref('stg_hubspot__deal_company') }}
)
select 
    {{dbt_utils.surrogate_key(['deal_id'])}} as deal_sk,
    {{dbt_utils.surrogate_key(['company_id'])}} as company_sk
from deal_company