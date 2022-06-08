# Case: Analytics Engineer
We have been hired by a company to set up their modern data stack. In the first phase, they would like to be able to report on their sales operations.
They're selling various products to customers globally. In this repository, you will find CSV files covering information about customers, employees, orders, products and suppliers. Please use this data
to prepare the following tasks.

### Tasks

1. Please load the CSV files into a relational database of your choice, e.g, BigQuery, Postgres. You can choose whether to import the data into your database via a data import wizard (e.g. provided as part of the SQL IDE Dbeaver) or by writing a Python script.


2. Using dbt Lab's documented best practices ([here](https://docs.getdbt.com/guides/best-practices) and [here](https://discourse.getdbt.com/t/how-we-structure-our-dbt-projects/355)) and, optionally, also the dbt open source framework, create a project and necessary transformations to create the following models:

   1. A transactional fact table for sales, with the grain set at the product level, with the following additional dimension:
      1. new or returning customer 
      2. number of days between first purchase and last purchase
      
   2. A dimension table for “customers”, with the grain set at the customer_id, which should include the following dimensionalized facts and additional dimensions:
      1. number of orders 
      2. total orders value 
      3. date of first order
      4. value of most expensive order 
      5. whether it’s one of the top 10 customers (by revenue generated)
      
   3. A dimension table for “employee_region”, which should include the following dimensionalized facts and additional dimensions:
      1. total orders sold
      2. total revenue
      3. top performing territory (by revenue generated)

   4. A dimension table for monthly cohorts with grain set at country level and with the following additional facts:
      1. Number of customers in the monthly cohort (customers are assigned in cohorts based on date of their first purchase)
      2. Cohort's total order value

3. Archive the results of your work and send it to the person who provided you the case via email. 
   NOTE: The archive file should contain either full dbt project or SQL queries organised in folders.

### What we’ll be evaluating your submissions on

1. Your code is accurate, easy to read & interpret and shows tendency for reusability & maintainability
2. Your project and code structure follows modelling best practices and considers the business / data at hand
3. Your code is valid and provides correct results and actionable models for analysts

