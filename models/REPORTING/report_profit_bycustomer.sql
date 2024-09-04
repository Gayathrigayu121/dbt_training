select 
    CUSTOMERID
    ,SEGMENT
    ,COUNTRY
    ,SUM(ORDER_PROFIT) as PROFIT
from
{{ ref('stg_orders') }}
group BY
     CUSTOMERID
    ,SEGMENT
    ,COUNTRY