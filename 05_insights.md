# Telco Customer Churn — Key Insights

> Dataset: 7,032 records (after removing 11 records with tenure = 0 and blank TotalCharges) | IBM Telco Churn Dataset

---

## Summary Statistics

| Metric | Value |
|---|---|
| Total customers (cleaned) | 7,032 |
| Churned customers | 1,869 |
| Overall churn rate | **26.58%** |
| Avg monthly charges — churned | $74.44 |
| Avg monthly charges — retained | $61.31 |
| Avg tenure — churned | 17.98 months |
| Avg tenure — retained | 37.65 months |

Churned customers pay **21% more per month** but stay for less than **half the duration** of retained customers — a strong signal of unmet value expectations.

---

## Insight 1 — Contract type is the strongest churn predictor

| Contract Type | Churn Rate | Customer Count |
|---|---|---|
| Month-to-month | **42.71%** | 3,875 |
| One year | 11.28% | 1,472 |
| Two year | 2.85% | 1,685 |

Month-to-month customers churn at **15x the rate** of two-year contract customers. Customers without long-term commitment have the lowest switching cost and are the most vulnerable segment.

**Key finding:** Of the 1,869 total churned customers, **1,655 (88.55%) were on month-to-month contracts.** This means fixing month-to-month retention is not just one lever — it is effectively the entire churn problem.

---

## Insight 2 — The first 6 months are the most critical window

| Tenure Bucket | Churn Rate | Customer Count |
|---|---|---|
| 0–6 months | **53.33%** | 1,470 |
| 7–12 months | 35.89% | 705 |
| 13–24 months | 28.71% | 1,024 |
| 25–48 months | 20.39% | 1,594 |
| 49–72 months | 9.51% | 2,239 |

More than half of customers in the first 6 months churn. Churn drops sharply after year 1 and becomes minimal beyond 4 years. Early-stage experience is the single biggest determinant of long-term retention.

---

## Insight 3 — Premium (Fiber optic) customers churn at more than double the DSL rate

| Internet Service | Churn Rate | Customer Count |
|---|---|---|
| Fiber optic | **41.89%** | 3,096 |
| DSL | 19.00% | 2,416 |
| No internet | 7.43% | 1,520 |

Fiber optic is the premium product yet has the highest churn. These customers also pay the most on average, suggesting a perceived value gap — the price does not match the experience delivered.

---

## Insight 4 — Higher monthly charges correlate with higher churn

| Monthly Charge Bracket | Churn Rate | Customer Count |
|---|---|---|
| Under $30 | 9.84% | 1,647 |
| $30–$50 | 30.80% | 646 |
| $50–$70 | 20.81% | 1,158 |
| $70–$90 | **37.84%** | 1,842 |
| $90+ | 32.78% | 1,739 |

Churn peaks in the $70–$90 bracket. Customers paying the most are not the most satisfied — value perception drops as price increases without a corresponding improvement in experience.

---

## Insight 5 — Electronic check users churn at nearly 3x the rate of auto-pay users

| Payment Method | Churn Rate | Customer Count |
|---|---|---|
| Electronic check | **45.29%** | 2,365 |
| Mailed check | 19.20% | 1,604 |
| Bank transfer (auto) | 16.73% | 1,542 |
| Credit card (auto) | 15.25% | 1,521 |

Customers on automatic payment methods churn at roughly 1/3 the rate of electronic check users. Auto-pay reduces friction to stay and increases friction to leave — it is a passive retention mechanism.

---

## Insight 6 — Add-on services act as retention anchors

| Add-on Service | No Add-on Churn Rate | With Add-on Churn Rate |
|---|---|---|
| Online Security | 41.78% | **14.64%** |
| Tech Support | 41.65% | **15.20%** |
| Online Backup | 39.94% | **21.57%** |
| Device Protection | 39.14% | **22.54%** |

Each add-on service roughly halves the churn rate. Customers with more services embedded in their account have higher switching costs and deeper engagement with the product.

---

## Insight 7 — Senior citizens churn at nearly double the rate of non-seniors

| Segment | Churn Rate | Customer Count |
|---|---|---|
| Senior citizens | **41.68%** | 1,142 |
| Non-seniors | 23.65% | 5,890 |

Senior citizens represent 16.2% of the customer base but churn significantly more. This group may find self-service channels harder to navigate, be more price-sensitive, or receive less proactive support.

---

## Insight 8 — Solo customers (no partner, no dependents) churn more

| Segment | Churn Rate | Customer Count |
|---|---|---|
| No partner | 32.98% | 3,639 |
| Has partner | 19.72% | 3,393 |
| No dependents | 31.28% | 4,933 |
| Has dependents | 15.53% | 2,099 |

Customers with a partner or dependents churn at roughly half the rate of solo customers. Household-level ties increase perceived value of service continuity and raise the friction of switching providers.

---

## Insight 9 — Paperless billing users churn at twice the rate

| Billing Type | Churn Rate | Customer Count |
|---|---|---|
| Paperless billing | **33.59%** | 4,168 |
| Paper billing | 16.38% | 2,864 |

Paperless billing users are likely a more digitally active, comparison-shopping segment with lower inertia when switching and higher exposure to competitor offers online.

---

## Churn Contribution — Where the churn actually comes from

| Segment | Churned Customers | % of Total Churn |
|---|---|---|
| Month-to-month contract | 1,655 | **88.55%** |
| One year + Two year contracts | 214 | 11.45% |
| **Total churned** | **1,869** | **100%** |

**88.55% of all churn is concentrated in a single contract segment.** Month-to-month retention is not just one priority among many — it is effectively the entire churn problem.

---

## Top Risk Segments — Ranked

| Risk Factor | Churn Rate |
|---|---|
| 0–6 months tenure | 53.33% |
| Electronic check payment | 45.29% |
| Month-to-month contract | 42.71% |
| Senior citizen | 41.68% |
| No Online Security (internet users) | 41.78% |
| No Tech Support (internet users) | 41.65% |
| Fiber optic service | 41.89% |
| Monthly charges $70–$90 | 37.84% |

---

*Data cleaning note: 11 records with tenure = 0 and blank TotalCharges were removed prior to analysis. These represent 0.15% of the original dataset and have negligible impact on all figures.*
