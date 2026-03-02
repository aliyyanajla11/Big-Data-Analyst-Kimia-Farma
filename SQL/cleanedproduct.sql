CREATE OR REPLACE TABLE `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_products` AS
SELECT
    product_id,
    product_name,
    product_category,
    SAFE_CAST(price AS FLOAT64) AS price
FROM `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_product`
WHERE price IS NOT NULL;