
    
    

with all_values as (

    select
        execution_status as value_field,
        count(*) as n_records

    from FINOPS_DEV.dbt_JKU.stg_query_history
    group by execution_status

)

select *
from all_values
where value_field not in (
    'success','fail','incident'
)


