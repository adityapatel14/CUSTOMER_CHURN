# Telco Customer Churn — Business Recommendations

> Based on analysis of 7,032 customer records | IBM Telco Churn Dataset  
> Overall churn rate: 26.58% | Churned customers: 1,869

---

## Recommendation 1 — Run a contract upgrade campaign for month-to-month customers

**Data behind it:** Month-to-month customers churn at 42.71% vs 2.85% for two-year contracts — a 15x difference.

**What to do:**
- Offer month-to-month customers a discounted rate or a one-time incentive (e.g., one free month, waived setup fee) to switch to a 1-year or 2-year plan.
- Target this campaign specifically at month-to-month customers who are in their first 12 months — they're the highest-risk overlap.
- Frame it as a "loyalty lock-in" benefit, not a restriction.

**Expected impact:** Even moving 20% of month-to-month customers to annual contracts could significantly reduce churn in the largest customer segment (3,875 customers).

---

## Recommendation 2 — Build a 90-day onboarding retention program

**Data behind it:** 53.33% churn rate in the first 6 months. Churn falls to 9.51% by year 4+. Customers who survive year 1 almost always stay.

**What to do:**
- Assign a proactive touchpoint sequence for all new customers: welcome call at day 3, check-in at day 30, satisfaction survey at day 60, upgrade offer at day 90.
- Identify customers showing early warning signs (no add-ons, electronic check, month-to-month) and prioritize outreach for them.
- Make onboarding feel personal — not automated. First impressions drive long-term commitment.

**Expected impact:** Reducing the 0–6 month churn rate by even 10 percentage points (53% → 43%) would retain ~147 additional customers per cohort.

---

## Recommendation 3 — Investigate and fix the fiber optic value gap

**Data behind it:** Fiber optic customers churn at 41.89% — more than double DSL (19%). These are also the highest-paying customers ($74 avg monthly charges for churned).

**What to do:**
- Survey recent fiber optic churners to understand why they left — is it speed reliability, pricing, or competition?
- Introduce a fiber loyalty bundle: pair fiber with Online Security + Tech Support at a marginal price increase. This addresses both the value gap and the add-on effect.
- Consider a "Fiber Satisfaction Guarantee" — a service credit if speeds fall below a threshold. This reduces perceived risk for high-paying customers.

**Expected impact:** Fiber optic is the largest internet segment (3,096 customers). Bringing its churn rate down to DSL levels (~19%) would be the single biggest churn reduction opportunity in the dataset.

---

## Recommendation 4 — Incentivize auto-pay adoption

**Data behind it:** Electronic check users churn at 45.29% vs 15–17% for bank transfer and credit card auto-pay users.

**What to do:**
- Offer a small monthly bill discount (e.g., $2–$5 off) for customers who switch to automatic payment.
- At signup, default new customers to auto-pay with an opt-out rather than opt-in — this nudges behavior without forcing it.
- Send targeted emails to all electronic check users highlighting the discount benefit.

**Expected impact:** 2,365 customers are on electronic check. Converting even 30% to auto-pay, and assuming their churn rate drops closer to 16–17%, prevents a meaningful number of churns per year.

---

## Recommendation 5 — Bundle add-on services into onboarding packages

**Data behind it:** Customers without Online Security churn at 41.78%; those with it churn at 14.64%. Same pattern holds for Tech Support, Online Backup, and Device Protection.

**What to do:**
- Include Online Security and Tech Support in a "Starter Bundle" for all new internet customers — even at a 3-month free trial. Once customers use a service, switching cost increases.
- For existing customers with no add-ons, run a targeted upsell campaign with a free 30-day trial of Online Security. Adoption converts to retention.
- Train customer service reps to proactively recommend add-ons during billing calls, especially for fiber optic customers.

**Expected impact:** Add-ons are the most cost-effective retention lever — they cost little to provision and reduce churn by ~27 percentage points per customer.

---

## Recommendation 6 — Create a senior citizen support program

**Data behind it:** Senior citizens churn at 41.68% vs 23.65% for non-seniors — an 18-point gap across 1,142 customers.

**What to do:**
- Offer a dedicated senior support line with longer call handling times and simplified billing explanations.
- Create a "Senior Plan" with simplified pricing, no unexpected charges, and a named account manager for escalations.
- Proactively call senior customers at their 6-month and 12-month mark to check satisfaction — don't wait for them to complain.

**Expected impact:** Senior citizens represent 16.2% of the base and churn at nearly twice the overall rate. Dedicated support is low-cost and high-impact for this segment.

---

## Recommendation 7 — Re-engage paperless billing customers with personalized communication

**Data behind it:** Paperless billing users churn at 33.59% vs 16.38% for paper billing users — these are digitally active customers who are also actively comparison shopping.

**What to do:**
- Use email and app notifications (since they're already digital) to proactively communicate value: usage summaries, savings vs competitors, loyalty milestones.
- Send personalized retention offers before renewal periods — these customers respond to data and deals, not generic mailers.
- Highlight loyalty rewards or points for long-term customers to create stickiness beyond the service itself.

**Expected impact:** 4,168 customers are on paperless billing. Reducing their churn rate by 5–8 percentage points through targeted digital engagement is achievable with minimal cost.

---

## Priority Matrix — Where to act first

| Recommendation | Customer Segment Size | Churn Rate | Ease of Implementation | Priority |
|---|---|---|---|---|
| 90-day onboarding program | 1,470 (0–6m) | 53.33% | Medium | 🔴 High |
| Contract upgrade campaign | 3,875 (M2M) | 42.71% | Easy | 🔴 High |
| Auto-pay incentive | 2,365 (e-check) | 45.29% | Easy | 🔴 High |
| Add-on bundle at onboarding | All new internet users | 39–42% | Medium | 🔴 High |
| Fiber optic value fix | 3,096 (fiber) | 41.89% | Hard | 🟡 Medium |
| Senior support program | 1,142 (seniors) | 41.68% | Medium | 🟡 Medium |
| Paperless billing re-engagement | 4,168 (paperless) | 33.59% | Easy | 🟡 Medium |

---

*Recommendations are derived entirely from the patterns observed in the IBM Telco Customer Churn dataset. All churn rates are computed post data cleaning (7,032 records).*
