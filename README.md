# Overview

This project was created to answer questions related to the repeat purchase rate (RPR) in e-commerce.

## Questions to Answer

1. How many days pass between the first and second order for each customer group by year?
2. What is the repeat purchase rate for each customer group by year?

## Tools Used

- SQL for data extraction and preparation
- Python for data cleaning and sorting
- Power BI for data visualization

# Analysis

![Dashboard](assets/dashboard.gif)

## How many days pass between the first and second order?

Overall, it takes **314 days in median** for customers to make a second purchase.

### 2020
In **2020**, the majority of customers made their second order **between 400 and 1100 days**, with a **median of 765 days**.

The **high-value group** made purchases more evenly over time, with a **median of 671 days**. Other groups typically made their second purchase after around **350 days**, with a **median of 783 days for the medium-value group** and **820 days for the low-value group**.

### 2021
In **2021**, the majority of customers made their second order **before 600 days**, with a **median of 373 days**.

The **high-value group** in most cases made a second purchase **before 400 days**, after which there was a significant drop, with a **median of 261 days**.

The **medium-value group** made purchases relatively evenly **until around 650 days**, after which the number gradually decreased. The **median for this group is 399 days**.

The **low-value group** generally made their second purchase **between 350 and 600 days**, with a **median of 529 days**.

### 2022
In **2022**, the majority of customers made their second purchase **before the 400-day mark**, with a **median of 224 days**, after which there was a significant drop.

For the **high-value group**, there is a gradual decline in purchases **up to around 350 days**, followed by a sharp drop. The **median is 177 days**.

The **medium-value group** shows a gradual decline **up to around 450 days**, followed by a sharp drop, with a **median of 243 days**.

Most of the **low-value group** made their second purchase **between 350 and 500 days**, with a **median of 406 days**.

### Key Insight
The time between the first and second purchase **decreases significantly from 2020 to 2022**, especially for **high-value customers**, suggesting improved customer retention over time.

## What is the repeat purchase rate?

Overall, **18.32% of customers repurchased**, with the majority of repeat purchases occurring within the **6–12 month period**.

### 2020
In **2020**, **5.44%** of customers repurchased. The **high-value group** had the highest rate at **13.46%**, while the **medium-value** and **low-value groups** had **3.76%** and **0.79%**, respectively.

All groups showed peak in repeat purchase rate around the **6–12 month period**, except for the low-value group, where the rate remained relatively consistent across all periods.

### 2021
In **2021**, the repeat purchase rate increased to **19.84%**. The **high-value group** led with **39.02%**, followed by the **medium-value group** at **18.06%**, and the **low-value group** at **4.20%**.

All groups showed that the majority of repeat purchases occurred within the **6–12 month period**.

### 2022
In **2022**, the repeat purchase rate further increased to **21.88%**. The **0–6 month period** showed growth compared to 2021, while the **6–12 month period** was slightly lower.

The **high-value group** reached **42.08%**, the **medium-value group** **20.47%**, and the **low-value group** **4.48%**.

Most repeat purchases **peaked in the 6–12 month period**.

### Key Insight
The repeat purchase rate **grew significantly from 2020 to 2022**, driven primarily by **high-value customers**, while the **6–12 month period** consistently remains the key window for repeat purchases.

# Conclusions and Recommendations

Customer retention improved significantly from 2020 to 2022, both in terms of repeat purchase rate and time to second purchase.

The repeat purchase rate increased from **5.44% in 2020** to **21.88% in 2022**, while the time between the first and second order decreased from a median of **765 days to 224 days**. This indicates that customers are returning both **more frequently and faster** over time.

High-value customers consistently outperform other customer groups, showing the **highest repeat purchase rates** and the **shortest time to second purchase**. By 2022, their repeat rate reached **42.08%**, with a median return time of **177 days**. 

They are also the primary driver of revenue: while representing around **25% of all customers**, they consistently generate **over 60% of total revenue** each year.

Across all years, the **6–12 month period** remains the most critical window for repeat purchases.

At the same time, low-value customers show relatively weak retention, with low repeat rates and longer return times, indicating an opportunity for targeted engagement and conversion strategies.

### Recommendations

- Focus retention efforts on the **first 6–12 months** after the initial purchase  
- Prioritize **high-value customers** as the main driver of revenue  
- Analyze customer behavior before and during the repeat purchase stage  
- Develop strategies to **convert low-value and medium-value customers** into repeat buyers  

