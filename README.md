# case-analytics-engineer

Context
We've been hired by an E-Commerce company to set up their modern data stack. In the first phase, they would like to be able to report on their sales. Data from their eCommerce platform has been loaded to Google BigQuery. Using the open source dbt framework, and following their documented best practices, create a project and necessary models to transform the data into the following star schema:
 
A transactional fact table for “sales”, with the grain set at the order item level, with the following additional dimension:
·          
NEW or REPEAT purchase (based on the customer_unique_id)
days between the purchase date and the delivered to customer date
A dimension table for “customers”, with the grain set at the customer_unique_id, which should include the following dimensionalized facts and additional dimensions:
·          
number of orders
total orders value
date of first order
date of most recent order
value of most expensive order
A dimension table for “products”, which should include the following dimensionalized facts and additional dimensions:
·          
total units sold
total revenue
whether it’s one of the top 10 products (by total units sold)
product volume in cubic centimeters
An incremental periodic snapshot fact table for “daily_products_sold” with the number of products sold, with the grain set per day, per product. There should be a row for each product/day even if there are no sales on that day.
 
Technical Details & Requirements
The dbt project should be built using dbt 1.0 or later.
The raw data is located inside the raw dataset
The output of your dbt project will be in a dataset named dbt_sandbox2
Share a zip file of the project as a deliverable
