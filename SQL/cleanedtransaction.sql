CREATE OR REPLACE TABLE `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_transactions` AS
SELECT
    transaction_id,
    DATE(date) AS date,
    branch_id,
    customer_name,
    product_id,
    SAFE_CAST(price AS FLOAT64) AS price,
    SAFE_CAST(discount_percentage AS FLOAT64) AS discount_percentage,
    SAFE_CAST(rating AS FLOAT64) AS rating
FROM `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_final_transaction`
WHERE price IS NOT NULL
  AND discount_percentage IS NOT NULL;