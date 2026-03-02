CREATE OR REPLACE TABLE `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_inventory` AS
SELECT
    inventory_id,
    branch_id,
    product_id,
    product_name,
    SAFE_CAST(opname_stock AS INT64) AS opname_stock
FROM `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_inventory`
WHERE opname_stock IS NOT NULL;