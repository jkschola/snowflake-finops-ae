
    
    

select
    daily_warehouse_id as unique_field,
    count(*) as n_records

from FINOPS_DEV.dbt_JKU.fct_daily_warehouse_costs
where daily_warehouse_id is not null
group by daily_warehouse_id
having count(*) > 1


