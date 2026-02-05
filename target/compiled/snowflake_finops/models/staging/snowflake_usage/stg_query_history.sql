

with source as (
    /* Extracting raw data from the Snowflake shared database */
    select * from SNOWFLAKE.ACCOUNT_USAGE.query_history
),

renamed as (
    select
        query_id,
        query_text,
        database_name,
        schema_name,
        warehouse_name,
        user_name,
        role_name,
        -- Normalize to lowercase to match the documentation and tests
        lower(execution_status) as execution_status,
        -- Convert milliseconds to seconds for better readability
        (total_elapsed_time / 1000) as execution_time_s,
        (compilation_time / 1000) as compilation_time_s,
        -- Basic credit estimation (using cloud services credits as a proxy)
        round(credits_used_cloud_services, 4) as credits_spent,
        start_time,
        end_time
    from source
    -- Development filter: Limit data to the last 30 days for performance
    where start_time >= dateadd(day, -30, current_timestamp())
)

select * from renamed