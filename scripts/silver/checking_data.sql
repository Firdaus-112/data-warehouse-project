/*
======================================================================
Author : Firdaus
Date   : 2026-04-22
Script : checking_data.sql

Objective: This script store common query to checking data quality 

=======================================================================
*/
SELECT cst_id,COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id 
HAVING COUNT(*)>1 OR cst_id IS NULL;

--Duplicate value
SELECT * FROM
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM bronze.crm_cust_info)t
WHERE flag_last = 1 

--check unwanted space
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

--data standardization and consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info
