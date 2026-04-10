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