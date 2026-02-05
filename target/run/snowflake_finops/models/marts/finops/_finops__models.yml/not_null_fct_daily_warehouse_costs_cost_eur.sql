
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cost_eur
from FINOPS_DEV.dbt_JKU.fct_daily_warehouse_costs
where cost_eur is null



  
  
      
    ) dbt_internal_test