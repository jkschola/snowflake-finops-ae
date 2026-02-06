
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select daily_warehouse_id
from FINOPS_DEV.dbt_JKU.fct_daily_warehouse_costs
where daily_warehouse_id is null



  
  
      
    ) dbt_internal_test