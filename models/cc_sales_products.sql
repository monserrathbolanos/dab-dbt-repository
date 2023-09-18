{{
  config(
    materialized='table'
  )
}}

SELECT
  ### Key ###  
  product_id
  ###########
  ,SUM(qty) AS qty_91
  ,ROUND(SUM(qty)/91,2) AS avg_daily_qty_91
FROM `dbt_dev_user1.stg_cc_sales` 
WHERE 
	date_date >= DATE_SUB('2021-10-01',INTERVAL 91 DAY)
GROUP BY product_id