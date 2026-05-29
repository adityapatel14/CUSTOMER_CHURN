use telco_churn;

SELECT count(distinct customerID)
from customer_churn;

SELECT SUM(CASE WHEN Churn = "Yes" then 1 else 0 END)*100/COUNT(*) AS churn_rate
from customer_churn;

SELECT contract,avg(MonthlyCharges) as avg_monthly_charge
from customer_churn
group by contract
order by avg_monthly_charge desc;

SELECT customerID,TotalCharges
from customer_churn
order by TotalCharges desc
limit 5;

SELECT PaymentMethod,count(distinct customerID) as number_of_churners
from customer_churn
WHERE Churn = 'Yes'
Group by PaymentMethod
Order By number_of_churners desc;

SELECT *
From customer_churn;

SELECT InternetService, SUM(CASE WHEN Churn = "Yes" then 1 else 0 end)*100.0/count(*) as churn_Rate
from customer_churn
group by InternetService
order by churn_rate desc;

SELECT *
From customer_churn;

SELECT customerID,TotalCharges
from customer_churn
order by TotalCharges desc
limit 5;