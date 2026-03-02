CREATE OR REPLACE TABLE `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_branches` AS
SELECT
    branch_id,
    branch_name,
    kota,
    provinsi,
    branch_category,
    SAFE_CAST(rating AS FLOAT64) AS rating
FROM `rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_kantor_cabang`