USE telco_churn;
WITH churn_perc as (
SELECT
	InternetService,
    Churn,
    Count(*) as num_customers,
    SUM(Count(*)) OVER (PARTITION BY InternetService) as Total_users,
    (COUNT(*)/(SUM(Count(*)) OVER (PARTITION BY InternetService)))*100 as churn_perc
FROM Customer_churn
GROUP BY InternetService,Churn
)
SELECT *
FROM churn_perc
WHERE Churn = 'Yes';

SELECT Contract,PaymentMethod,count(*) as customers
FROM Customer_churn
GROUP BY Contract,PaymentMethod
ORDER BY customers desc
LIMIT 5;

SELECT InternetService,OnlineSecurity,StreamingTV
FROM Customer_churn
WHERE InternetService = 'No' AND (OnlineSecurity = 'Yes' OR StreamingTV = 'Yes');
-- i dont think so there will be any values but i did it anyways to find if there is some problem with the data

SELECT tenure,
	CASE
		WHEN tenure <= 12 THEN 'NEW'
        WHEN tenure > 36 THEN 'LOYAL'
        ELSE 'MID'
    END as ternure_group
FROM Customer_churn;


WITH churn_perc as (
SELECT
	InternetService,
    Churn,
    Count(*) as num_customers,
    SUM(Count(*)) OVER (PARTITION BY InternetService) as Total_users,
    (COUNT(*)/(SUM(Count(*)) OVER (PARTITION BY InternetService)))*100.0 as churn_perc
FROM Customer_churn
GROUP BY InternetService,Churn
)
SELECT InternetService,churn_perc
FROM churn_perc
WHERE Churn = 'Yes'
ORDER BY churn_perc DESC;

WITH churnn as (
    SELECT 
    Contract,
    Churn,
    count(*) AS churned_customer
FROM
	Customer_churn
GROUP BY Contract,Churn
),
total_cust as (
	SELECT
    Contract,
    Churn,
    churned_customer,
	SUM(churned_customer) OVER(PARTITION BY Contract Order By Contract) as total_customers
FROM churnn
)
SELECT
	Contract,
	total_customers,
    churned_customer,
    ((churned_customer * 100.0)/total_customers) as churn_rate
FROM total_cust
WHERE Churn = 'Yes'
ORDER BY churn_rate DESC;

SELECT 
	(CASE WHEN tenure <= 12 THEN 'New' WHEN tenure BETWEEN 13 AND 36 THEN 'Mid' ELSE 'Loyal' END) as cust_segment,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate
FROM Customer_churn
GROUP BY cust_segment
ORDER BY churn_rate DESC;

SELECT 
    CASE 
        WHEN MonthlyCharges < 30 THEN 'Low'
        WHEN MonthlyCharges BETWEEN 30 AND 70 THEN 'Medium'
        ELSE 'High'
    END AS charge_bucket,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate

FROM Customer_churn
GROUP BY charge_bucket
ORDER BY churn_rate DESC;

SELECT 
    PaymentMethod,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate
FROM Customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

SELECT 
	TechSupport,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS churn_rate
FROM Customer_churn
GROUP BY TechSupport
ORDER BY churn_rate ;

SELECT
	PaperlessBilling,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS churn_rate
FROM
	customer_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;

SELECT
	Contract,
    PaymentMethod,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) as churn_rate
FROM customer_churn
GROUP BY Contract,PaymentMethod
ORDER BY churn_rate DESC;

WITH churn_calc AS (
    SELECT 
        'OnlineBackup' AS service,
        OnlineBackup AS category,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
            4
        ) AS churn_rate
    FROM customer_churn
    GROUP BY OnlineBackup

    UNION ALL

    SELECT 
        'DeviceProtection' AS service,
        DeviceProtection AS category,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
            4
        ) AS churn_rate
    FROM customer_churn
    GROUP BY DeviceProtection

    UNION ALL

    SELECT 
        'TechSupport' AS service,
        TechSupport AS category,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
            4
        ) AS churn_rate
    FROM customer_churn
    GROUP BY TechSupport
)

SELECT 
    service,
    category,
    total_customers,
    churned_customers,
    churn_rate,
    RANK() OVER (ORDER BY churn_rate DESC) AS churn_rank
FROM churn_calc
ORDER BY churn_rank;

SELECT
	(CASE
    WHEN tenure < 12 THEN '0-1 Year'
    WHEN tenure BETWEEN 12 AND 24 THEN '1-2 Years'
    WHEN tenure BETWEEN 25 AND 48 THEN '2-4 Years'
    WHEN tenure BETWEEN 49 AND 72 THEN '4-6 Years'
    ELSE '6+ Years'
	END) as tenure_gap,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS churn_rate
FROM customer_churn
GROUP BY tenure_gap
ORDER BY churn_rate ;

WITH snr as (
select 
	gender,
	SeniorCitizen,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) AS churn_rate
FROM
	customer_churn
GROUP BY gender,SeniorCitizen
ORDER BY churn_rate desc
)
SELECT gender,SeniorCitizen,churn_rate,RANK()OVER(ORDER BY churn_rate DESC) as churn_rank
FROM snr;

WITH snr as (
select 
	gender,
	SeniorCitizen,
    HasPhoneService,
    InternetService,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) AS churn_rate
FROM
	customer_churn
GROUP BY gender,SeniorCitizen,HasPhoneService,InternetService
ORDER BY churn_rate desc
)
SELECT gender,SeniorCitizen,HasPhoneService,InternetService,churn_rate,RANK()OVER(ORDER BY churn_rate DESC) as churn_rank
FROM snr;

WITH snr as (
select 
	gender,
    HasPhoneService,
    InternetService,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) AS churn_rate,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churn_count,
    count(*) as total_count
FROM
	customer_churn
WHERE SeniorCitizen = 'Yes'
GROUP BY gender,SeniorCitizen,HasPhoneService,InternetService
ORDER BY churn_rate desc
)
SELECT gender,HasPhoneService,InternetService,total_count,churn_count,churn_rate,RANK()OVER(ORDER BY churn_rate DESC) as churn_rank
FROM snr;

WITH total_sc AS (
    SELECT COUNT(*) AS total_senior
    FROM customer_churn
    WHERE SeniorCitizen = 'Yes'
),

seg AS (
    SELECT 
        gender,
        HasPhoneService,
        InternetService,
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
    FROM customer_churn
    WHERE SeniorCitizen = 'Yes'
    GROUP BY gender, HasPhoneService, InternetService
)

SELECT 
    s.gender,
    s.HasPhoneService,
    s.InternetService,
    s.churned * 100.0 / t.total_senior AS churn_pct_of_total_sc
FROM seg s
CROSS JOIN total_sc t
ORDER BY churn_pct_of_total_sc DESC;


SELECT 
	InternetService,
	OnlineSecurity,
    TechSupport,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS churn_rate
FROM customer_churn
WHERE InternetService != 'No'
GROUP BY InternetService,
	OnlineSecurity,
    TechSupport
ORDER BY churn_rate DESC;

WITH total_cust as(
SELECT count(*) as total_customer
FROM customer_churn
WHERE churn = 'Yes'
),
churned_cust as (
SELECT 
	InternetService,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/count(*) as churn_rate
FROM customer_churn
GROUP BY InternetService
)
SELECT c.InternetService,c.churned_customers,c.churn_rate,(c.churned_customers*100.0)/t.total_customer as contribution_to_total_churn
FROM churned_cust c
CROSS JOIN total_cust t
ORDER BY contribution_to_total_churn DESC;