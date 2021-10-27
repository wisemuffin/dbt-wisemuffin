with company as (
    select *
    from {{ ref('int_company') }}
)
select
    *
from company