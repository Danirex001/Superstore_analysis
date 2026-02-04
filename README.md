# Superstore Performance Analysis
This project analyzes superstores sales data to uncover trends in revenue,profit,discounts and customer buying patterns using SQL,Python and Tableau.

![notebook scripts for analysis](analysis/eda.ipynb)
![Machine learning code](analysis/ml.py)
![Cleaned data](data/Cleaned/processed_superstore.csv)
![dependencies](requirements.txt)

## **Table of contents**
-[Overview](#overview)
-[Dashboard Preview](#dashboard-preview)
-[Problem objectives](#problem-objectives)
-[Dataset](#dataset)
-[Tools & Technologies](#tools--technologies)
-[Methodology](#methology)
-[key findings](#key-findings)
-[Recommendation](#recommendations)
-[Contributions](#contributions)
-[License](#license)

## Dashboard Preview
![Dashboard Screenshot](outputs/Superstore.png)

## Problem objectives 
This project seeks to understand the discount campaign objectives and actually find out if discounts are increasing market share/ profits or are just cutting our profits and it seeks to find out how can we reduce the number of days of delivery time based on our shipmode.

## Dataset 
- Source : Kaggle Superstore sales data
- Rows : 9994
- Key columns :
    Category, 
    Sub-Category,
    Product Name, 
    Revenue, 
    Quantity, 
    Discount, 
    Profit, & 18 others

## Tools & Technologies
    Python(pandas,numpy)
    SQL (PostgreSQL)
    Tableau
    Git & Github

## Methology 
1. Data cleaning and preprocessing in Python 
2. Handling missing values and inconsistent format 
3. Feature engineering
4. Data modelling 
5. Machine learnig analysis 
6. Aggregations and customer analysis

## key Findings 
A superstore from the period of 2014-01-03 - 2017-12-30 had 5009 unique transactions among 793 customers.
PROFITABILITY:
The store has witnessed a steady increase in profit over the four years period.The average profit is 71599.25.The highest percentage jump was from 2015 to 2016 when the store profit moved to over 32%. 
After further scrutiny i found out the top_5 volume of transactions customer are not in the overall top 5

1. Our discount objectives didn't increase our profits infact it gave us about a 12% loss from non-discounted sales.
The discounted sales gave us more customers, about 8% more customers than discounted sales.
The discounted sales also gave an opportunity to sell a variety of more products than noon_discounted.
Our discount campaign in terms of market share was pretty sucessful in the central areas but was unsuccessful in the south.

2. How can we reduce our delivery time based on our shipmode:
Based on the amount paid by customers in each mode same day had the highest unit price and standard class with the lowest unit_price . i wouldn't recomend increase in prices.Ship Mode process significantly high quantity of goods so to make the shipping easier and faster.

## Recommendations:
1. I recommend restragizing the discount method for customers in the south for better result and continue the discount strategy. The west is where our premium customers are so we need to sell more premium product to that region to account for the loss we will incur from the discount strategy.

 2. I recommend bulk shipping for standard class to reduce shpping days mean from 5 to 4 and i will keep others shipping mode date difference the same because of the higher prices we charge for the other shipping mode correspondsw with the date we deliver.

## Contributions 
Contributions are welcome.Please open an issue or submit a pull request for improvements or suggestions.

## License 
This project is licensed under the MIT License.