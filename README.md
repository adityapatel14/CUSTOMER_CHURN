# 📉 Telco Customer Churn Prediction

A machine learning project that predicts whether a telecom customer will churn, using the IBM Telco Customer Churn dataset. Two classification models were built and evaluated — Logistic Regression and Random Forest — with Logistic Regression achieving the best performance at ~86% accuracy.

---

## 📌 Problem Statement

Customer churn is one of the most expensive problems in the telecom industry. Retaining an existing customer costs significantly less than acquiring a new one. This project aims to identify customers likely to churn based on their demographics, account information, and service usage — enabling proactive retention strategies.

---

## 📂 Dataset

| Detail | Value |
|---|---|
| Source | IBM Sample Dataset — Telco Customer Churn |
| Rows | 7,043 customers |
| Columns | 22 features |
| Target Variable | `Churn` (Yes / No) |

**Class Distribution:**
- Not Churned: 5,174 (73.5%)
- Churned: 1,869 (26.5%)

### Key Features

| Feature | Description |
|---|---|
| `tenure` | Number of months the customer has stayed (0–72) |
| `Contract` | Contract type: Month-to-month, One year, Two year |
| `MonthlyCharges` | Monthly billing amount ($18.25–$118.75) |
| `TotalCharges` | Total amount charged to date |
| `InternetService` | DSL, Fiber optic, or No internet |
| `PaymentMethod` | Electronic check, Mailed check, Bank transfer, Credit card |
| `OnlineSecurity`, `TechSupport` | Value-added services usage |
| `SeniorCitizen`, `Partner`, `Dependents` | Demographic attributes |

---

## 🔧 Tech Stack

- **Language:** Python
- **Libraries:** `pandas`, `numpy`, `scikit-learn`, `matplotlib`, `seaborn`
- **Models:** Logistic Regression, Random Forest Classifier

---

## 🔄 Project Workflow

```
Raw Data → EDA → Feature Engineering → Preprocessing → Model Training → Evaluation → Insights
```

### 1. Exploratory Data Analysis (EDA)
- Analyzed churn rate across contract types, payment methods, and internet service tiers
- Identified that month-to-month contract holders had the highest churn rate
- Visualized feature distributions and correlation with the target variable
- Checked class imbalance (~26.5% churn rate)

### 2. Data Preprocessing
- Handled missing/blank values in `TotalCharges`
- Encoded categorical variables using Label Encoding / One-Hot Encoding
- Scaled numerical features (`tenure`, `MonthlyCharges`, `TotalCharges`) using StandardScaler
- Split data into 80% train / 20% test

### 3. Model Building

**Logistic Regression**
- Baseline classification model
- Well-suited for binary classification with interpretable coefficients
- Applied regularization to handle multicollinearity

**Random Forest Classifier**
- Ensemble model using multiple decision trees
- Feature importance analysis to identify top churn drivers
- Tuned `n_estimators` and `max_depth`

---

## 📊 Model Performance

| Model | Accuracy | Notes |
|---|---|---|
| **Logistic Regression** | **~86%** | ✅ Best performer |
| Random Forest | Lower | Prone to slight overfitting on this dataset |

> Logistic Regression outperformed Random Forest, likely due to the linear separability of churn patterns and the relatively small feature space after encoding.

---

## 💡 Key Findings

- Customers on **month-to-month contracts** are significantly more likely to churn
- **Fiber optic internet users** showed higher churn compared to DSL users — possibly due to pricing
- Customers with **no online security or tech support** had elevated churn rates
- **Short-tenure customers** (< 12 months) were at the highest risk of churning
- **Electronic check** users churned more than those using automatic payment methods

---

## 📁 Repository Structure

```
customer_churn/
│
├── 01_data/                          # Raw and processed dataset(s)
│   └── Telco_Customer_Churn.csv
│
├── 02_sql/                           # SQL queries used for EDA and analysis
│
├── 03_python/                        # ML model scripts and notebooks
│   └── churn_model.ipynb / .py       # Logistic Regression & Random Forest
│
├── 04_insights.md                    # Key analytical findings and observations
├── 05_business_recommendations.md    # Actionable recommendations based on analysis
└── README.md
```

---

## 🚀 How to Run

```bash
# Clone the repository
git clone https://github.com/adityapatel14/CUSTOMER_CHURN.git
cd customer_churn

# Install dependencies
pip install pandas numpy scikit-learn matplotlib seaborn

# Run the ML model notebook
jupyter notebook 03_python/churn_model.ipynb
```

---

## 🔮 Future Improvements

- Address class imbalance using SMOTE or class weighting
- Experiment with XGBoost or LightGBM for improved accuracy
- Add a ROC-AUC and F1-score based evaluation (better suited for imbalanced classification)
- Build a Streamlit app for interactive churn prediction
- Perform hyperparameter tuning with GridSearchCV

---

## 👤 Author

**Aditya**  
Aspiring Data Analyst | Python • SQL • ML  
[LinkedIn](https://www.linkedin.com/in/aditya-kaushik-patel/) • [GitHub](https://github.com/adityapatel14)
