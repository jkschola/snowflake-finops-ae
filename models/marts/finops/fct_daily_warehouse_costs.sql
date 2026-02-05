{{ config(materialized='table') }}

with daily_metrics as (
    /* 1. Aggregate staging data to a daily grain per warehouse */
    select
        date_trunc('day', start_time) as cost_date,
        warehouse_name,
        sum(credits_spent) as total_credits_spent
    from {{ ref('stg_query_history') }}
    group by 1, 2
),

final as (
    /* 2. Apply business logic and currency conversion */
    select
        -- Generate a unique ID for this grain (Date + Warehouse)
        md5(cast(concat(coalesce(cast(cost_date as string), ''), '-', coalesce(cast(warehouse_name as string), '')) as string)) as daily_warehouse_id,
        cost_date,
        warehouse_name,
        total_credits_spent,
        -- Assumption: $3.00 per credit (Snowflake Standard pricing)
        -- Calling our Jinja macro for the EUR conversion
        {{ convert_usd_to_eur('total_credits_spent * 3.00') }} as cost_eur
    from daily_metrics
)

select * from final