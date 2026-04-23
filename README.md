📉 Telco Customer Churn Prediction
A machine learning project that predicts whether a telecom customer will churn, using the IBM Telco Customer Churn dataset. Two classification models were built and evaluated — Logistic Regression and Random Forest — with Logistic Regression achieving the best performance at ~86% accuracy.

📌 Problem Statement
Customer churn is one of the most expensive problems in the telecom industry. Retaining an existing customer costs significantly less than acquiring a new one. This project aims to identify customers likely to churn based on their demographics, account information, and service usage — enabling proactive retention strategies.

📂 Dataset
DetailValueSourceIBM Sample Dataset — Telco Customer ChurnRows7,043 customersColumns22 featuresTarget VariableChurn (Yes / No)
Class Distribution:

Not Churned: 5,174 (73.5%)
Churned: 1,869 (26.5%)

Key Features
FeatureDescriptiontenureNumber of months the customer has stayed (0–72)ContractContract type: Month-to-month, One year, Two yearMonthlyChargesMonthly billing amount ($18.25–$118.75)TotalChargesTotal amount charged to dateInternetServiceDSL, Fiber optic, or No internetPaymentMethodElectronic check, Mailed check, Bank transfer, Credit cardOnlineSecurity, TechSupportValue-added services usageSeniorCitizen, Partner, DependentsDemographic attributes

🔧 Tech Stack

Language: Python
Libraries: pandas, numpy, scikit-learn, matplotlib, seaborn
Models: Logistic Regression, Random Forest Classifier


🔄 Project Workflow
Raw Data → EDA → Feature Engineering → Preprocessing → Model Training → Evaluation → Insights