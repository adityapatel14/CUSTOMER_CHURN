SELECT PhoneService,MultipleLines,count(*)
FROM Customer_churn
WHERE PhoneService = "No"
GROUP BY PhoneService,MultipleLines;

SELECT Contract,COUNT(*) as Num_contracts
FROM Customer_churn
GROUP BY Contract;

SELECT PaymentMethod,COUNT(*) as Num_pay_methods
FROM Customer_churn
GROUP BY PaymentMethod;

SELECT 
	MonthlyCharges
FROM
	Customer_churn
WHERE MonthlyCharges = 0 or MonthlyCharges IS NULL;

SELECT 
	customerID,
	MonthlyCharges,
	tenure,
	TotalCharges,
	(MonthlyCharges * tenure) AS expected_total,
	ABS((MonthlyCharges * tenure) - TotalCharges) AS difference
FROM Customer_churn
ORDER BY difference DESC;

USE telco_churn;
SELECT count(*)
from customer_churn
WHERE customerID is NULL or customerID = "";

SELECT
	COUNT(*) as total_customers,
    SUM(CASE WHEN Churn = "Yes" then 1 else 0 end) as churned_customers,
    SUM(CASE WHEN Churn = "Yes" then 1 else 0 end)*100.0/count(*) as churn_rate
from customer_churn;

select count(*) as count
from customer_churn
where TotalCharges = "0";

SELECT AVG(MonthlyCharges) as AVG_monthly_charges
FROM customer_churn
WHERE Churn = "Yes";

SELECT AVG(MonthlyCharges) as AVG_monthly_charges
FROM customer_churn
WHERE Churn = "No";

SELECT SUM(CASE WHEN Churn = "Yes" and Contract = "Month-to-month" then 1 else 0 end)*100.0/count(*) as churn_rate_month2month_overall,SUM(CASE WHEN Churn = "Yes" and Contract = "Month-to-month" then 1 else 0 end) as count_month2month,SUM(CASE WHEN Churn = "Yes" then 1 else 0 end) as count_total_churned
FROM customer_churn;

SELECT SUM(CASE WHEN Churn = "Yes" and Contract = "Month-to-month" then 1 else 0 end)*100.0/count(*) as churn_rate_month2month_overall
FROM customer_churn;

SELECT SUM(CASE WHEN Churn = "Yes" THEN 1 ELSE 0 END),count(*),SUM(CASE WHEN Churn = "Yes" THEN 1 ELSE 0 END)*100.0/count(*) as cust_churn_early
FROM customer_churn
WHERE Tenure <= 6;

SELECT 
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
WHERE InternetService != 'No'
GROUP BY OnlineSecurity;

SELECT 
    'Online Security' AS add_on_service,
    ROUND(AVG(CASE WHEN Churn = "Yes" AND OnlineSecurity = 'No' AND InternetService != 'No' THEN 1 ELSE 0 END) * 100, 2) AS no_addon_churn_rate,
    ROUND(AVG(CASE WHEN Churn = "Yes" AND OnlineSecurity = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS with_addon_churn_rate
FROM customer_churn;

SELECT 
	Contract,
	SUM(CASE WHEN Churn = "Yes" then 1 else 0 end)*100.0/count(*) as churn_Rate,
    count(*)
FROM customer_churn
GROUP BY Contract;

SELECT
	count(*),
	SUM(CASE WHEN Churn = "Yes" and Contract = "Month-to-month" then 1 else 0 end) as churn_count,
	SUM(CASE WHEN Churn = "Yes" and Contract = "Month-to-month" then 1 else 0 end)*100.0/count(*) as churn_rate
from customer_churn
WHERE Churn = "Yes";

USE product_analytics_db;
SELECT sum(amount)
from merged_saas
where payment_status = "success"