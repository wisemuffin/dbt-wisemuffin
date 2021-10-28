with ticket as (
    select *
    from {{ ref('int_ticket') }}
)
select *
from ticket