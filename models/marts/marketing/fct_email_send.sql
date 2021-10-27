with email_sends as (

    select *
    from {{ ref('hubspot__email_sends') }}

), email_metrics as (

    select 
        {{dbt_utils.surrogate_key(['email_campaign_id'])}} as email_campaign_sk,
        {{dbt_utils.surrogate_key(['contact_id'])}} as contact_sk,
        {% for metric in var('email_metrics') %}
        sum(email_sends.{{ metric }}) as total_{{ metric }},
        count(distinct case when email_sends.{{ metric }} > 0 then email_send_id end) as total_unique_{{ metric }}
        {% if not loop.last %},{% endif %}
        {% endfor %}
    from email_sends
    group by 1,2

)
select *
from email_metrics