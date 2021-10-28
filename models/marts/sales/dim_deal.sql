with deal as (
    select *
    from {{ ref('int_deal') }}
)
, deal_company as (
    select *
    from {{ ref('stg_hubspot__deal_company') }}
)
, joined as (
    select
        {{dbt_utils.surrogate_key(['deal.deal_id'])}} as deal_sk,
        {{dbt_utils.surrogate_key(['service'])}} as service_sk,
        {{dbt_utils.surrogate_key(['owner_id'])}} as owner_sk,
        {{dbt_utils.surrogate_key(['company_id'])}} as company_sk,
        deal.* except (service, owner_id)
    from deal
    left join deal_company on deal.deal_id = deal_company.deal_id
)
select *
from joined