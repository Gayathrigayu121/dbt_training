select  
--FROM RAW_ORDERS
 O.ORDER_ID
 ,O.ORDER_DATE
 ,O.SHIP_DATE
 ,O.SHIP_MODE
 ,O.ORDER_SELLING_PRICE
 ,O.ORDER_COST_PRICE
 --FROM RAW_CUSTOMER
 ,C.CUSTOMERID
 ,C.CUSTOMERNAME
 ,C.SEGMENT
 ,C.COUNTRY
 --FROM RAW_PRODUCT
 ,P.PRODUCTID
 ,P.CATEGORY
 ,P.PRODUCTNAME
 ,P.SUBCATEGORY
 ,(O.ORDER_SELLING_PRICE - O.ORDER_COST_PRICE) AS ORDER_PROFIT
 from
 {{ ref('RAW_ORDERS') }} AS O
 LEFT JOIN {{ ref('RAW_CUSTOMER') }} AS C
 ON 
    C.CUSTOMERID=O.CUSTOMER_ID
LEFT JOIN
{{ ref('RAW_PRODUCT') }} AS P
ON
   P.PRODUCTID=O.PRODUCT_ID