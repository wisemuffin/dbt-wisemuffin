with contact as (
    select *
    from {{ ref('int_contact') }}
)
select
    *
from contact