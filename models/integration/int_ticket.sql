with ticket as (
    select *
    from {{ ref('stg_hubspot__ticket') }}
)
, ticket_company as (
    select *
    from {{ ref('stg_hubspot__ticket_company') }}
)
, ticket_deal as (
    select *
    from {{ ref('stg_hubspot__ticket_deal') }}
)
, joined as (
    select ticket.*,
        ticket_company.company_id,
        ticket_deal.deal_id
    from ticket
    left join ticket_company on ticket.ticket_id = ticket_company.ticket_id
    left join ticket_deal on ticket.ticket_id = ticket_deal.ticket_id
)
select *
from ticket