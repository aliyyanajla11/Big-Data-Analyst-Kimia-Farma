# Yearly Sales Comparison ------------------------------------------------------------
SELECT 
    EXTRACT(YEAR FROM date) AS year,
    ROUND(SUM(nett_sales), 2) AS nett_sales           
FROM 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis`
GROUP BY year
ORDER BY year;

#Sales by Branch Category--------------------------------------------------------------
SELECT 
    b.branch_category,
    SUM(a.nett_sales) AS total_sales
FROM 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis` a
JOIN 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.cleaned_branches` b
ON a.branch_id = b.branch_id
GROUP BY b.branch_category
ORDER BY total_sales DESC;

#Top 10 Total Transaction by Province---------------------------------------------------
SELECT 
    provinsi,
    COUNT(transaction_id) AS total_transaction
FROM 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis`
GROUP BY provinsi
ORDER BY total_transaction DESC
LIMIT 10;

#Top 10 Total Sales by Province --------------------------------------------------------
SELECT 
    provinsi,
    SUM(nett_sales) AS total_sales
FROM 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis`
GROUP BY provinsi
ORDER BY total_sales DESC
LIMIT 10;

#Top 5: High Branch Rating, Low Transaction Rating -------------------------------------
SELECT
    kota,
    branch_name AS branch,
    ROUND(AVG(rating_cabang), 2) AS branch_rating,
    ROUND(AVG(rating_transaksi), 2) AS transaction_rating
FROM 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis`
GROUP BY kota, branch_name
HAVING AVG(rating_cabang) >= 4.5 
   AND AVG(rating_transaksi) <= 4.0
ORDER BY branch_rating DESC
LIMIT 5;

#Profit by Province -----------------------------------------------------------------------
SELECT 
    provinsi,
    SUM(nett_profit) AS total_profit
FROM 
`rakaminkimiafarmaanalytics.KimiaFarmaRakaminDataAnalytics.kf_table_analysis`
GROUP BY provinsi
ORDER BY total_profit DESC;
