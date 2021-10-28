with deal as (
    select *
    from {{ ref('dim_deal') }}
)
select
    deal_sk,
    service_sk,
    owner_sk,
    company_sk,
    deal_id,
    amount,
from deal

{% if target.name == 'dev' %}
where created_at >= cast('2021-10-27' as timestamp)
{% endif %}