SELECT *
FROM Customer_churn
WHERE totalcharges IS NULL;

SELECT 
CASE 
  WHEN SeniorCitizen = 1 THEN 'Yes'
  ELSE 'No'
END AS SeniorCitizen_cleaned
FROM telco;

ALTER TABLE Customer_churn
MODIFY COLUMN TotalCharges FLOAT;

SELECT MultipleLines, COUNT(*) as customers
FROM Customer_churn
GROUP BY MultipleLines;

SELECT TotalCharges
FROM Customer_churn
WHERE TotalCharges = '' OR TotalCharges IS NULL;

SELECT TotalCharges
FROM Customer_churn
WHERE (TotalCharges = '' OR TotalCharges IS NULL)
	AND
    tenure > 0;
    
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

WITH rankk_num as (
SELECT
	customerID,ROW_NUMBER() OVER(PARTITION BY customerID ORDER BY customerID) rank_num
FROM Customer_churn
)
SELECT *
FROM rankk_num
WHERE rank_num > 1;

SELECT
	InternetService,
    Churn,
    Count(*) as num_customers,
    SUM(Count(*)) OVER (PARTITION BY InternetService) as Total_users
FROM Customer_churn
GROUP BY InternetService,Churn;

