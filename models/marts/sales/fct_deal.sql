with deal as (
    select *
    from {{ ref('dim_deal') }}
)
select
    deal_sk,
    service_sk,
    owner_sk,
    company_sk,
    deal_id
    amount,
from deal