with deal as (
    select *
    from {{ ref('int_deal') }}
)
select
    {{dbt_utils.surrogate_key(['service'])}} as service_sk,
    service

from deal