with deal as (
    select *
    from {{ ref('int_deal') }}
)
select
    {{dbt_utils.surrogate_key(['owner_id'])}} as owner_sk,
    owner_id
from deal