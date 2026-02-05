
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select query_id
from FINOPS_DEV.dbt_JKU.stg_query_history
where query_id is null



  
  
      
    ) dbt_internal_test