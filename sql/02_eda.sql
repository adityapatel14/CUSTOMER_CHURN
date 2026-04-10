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