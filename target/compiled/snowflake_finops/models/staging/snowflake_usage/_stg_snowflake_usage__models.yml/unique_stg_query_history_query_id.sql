
    
    

select
    query_id as unique_field,
    count(*) as n_records

from FINOPS_DEV.dbt_JKU.stg_query_history
where query_id is not null
group by query_id
having count(*) > 1


