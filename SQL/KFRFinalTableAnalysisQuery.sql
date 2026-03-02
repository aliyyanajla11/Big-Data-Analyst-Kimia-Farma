CREATE OR REPLACE TABLE 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis` AS

WITH base AS (
    SELECT
        t.transaction_id,
        t.date,
        t.branch_id,
        b.branch_name,
        b.kota,
        b.provinsi,
        b.rating AS rating_cabang,
        t.customer_name,
        t.product_id,
        p.product_name,
        t.price AS actual_price,
        t.discount_percentage,
        t.rating AS rating_transaksi,

        CASE
            WHEN t.price <= 50000 THEN 0.10
            WHEN t.price <= 100000 THEN 0.15
            WHEN t.price <= 300000 THEN 0.20
            WHEN t.price <= 500000 THEN 0.25
            ELSE 0.30
        END AS persentase_gross_laba

    FROM 
    `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_transactions` t

    LEFT JOIN 
    `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_products` p
    ON t.product_id = p.product_id

    LEFT JOIN 
    `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_branches` b
    ON t.branch_id = b.branch_id
)

SELECT *,
    (actual_price - (actual_price * discount_percentage)) AS nett_sales,
    (actual_price - (actual_price * discount_percentage)) 
        * persentase_gross_laba AS nett_profit
FROM base;