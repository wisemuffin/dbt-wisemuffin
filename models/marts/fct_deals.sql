with deals as (
    select *
    from {{ ref('int_deal') }}
)
select
    {{ dbt_utils.star(from=ref('int_deal'), except=["service", "owner_id"]) }},
    {{dbt_utils.surrogate_key(['deal_id'])}} as deal_sk,
    {{dbt_utils.surrogate_key(['service'])}} as service_sk,
    {{dbt_utils.surrogate_key(['owner_id'])}} as owner_sk
from deals