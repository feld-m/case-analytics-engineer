# Case: Analytics Engineer
We have been hired by a company to set up their modern data stack. In the first phase, they would like to be able to report on their sales operations.
They're selling various products to customers globally. In this repository, you will find CSV files covering information about customers, employees, orders, products and suppliers. Please use this data
to prepare the following tasks.

### Tasks

1. Please load the CSV files into a relational database of your choice, e.g, BigQuery, Postgres. You can choose whether to import the data into your database via a data import wizard (e.g. provided as part of the SQL IDE DBeaver) or by writing a Python script. If setting up a database takes too long, you can also choose to use dbt [Seeds](https://docs.getdbt.com/docs/build/seeds) to load the CSV files into the database.


2. Using dbt, create a project with the necessary transformations to create the following models:

   1. A transactional fact table for sales, with the grain set at the product level, with the following additional dimension:
      1. new or returning customer 
      2. number of days between first purchase and last purchase
      
   2. A dimension table for “customers”, with the grain set at the customer_id, which should include the following dimensionalized facts and additional dimensions:
      1. number of orders
      2. value of most expensive order 
      3. whether it’s one of the top 10 customers (by revenue generated)

   3. A dimension table for monthly cohorts with grain set at country level and with the following additional facts.
      1. Number of customers in the monthly cohort (customers are assigned in cohorts based on date of their first purchase)
      2. Cohort's total order value
   * Note: Every cohort should be available, even when the business didn't acquire a new customer that month (for the full timerange of order dates).

3. Push your project to a publicly accessible repository. You can create a new repository or fork from this one, but _do not_ push your code to this repository.

4. Send the link to the repository person who provided you the case via email. 

### What we’ll be evaluating your submissions on

1. Your code is accurate, easy to read & interpret and shows a tendency for reusability & maintainability.
2. Your project and code structure follows modelling best practices (we use the [Best Practice Guides from dbt](https://docs.getdbt.com/best-practices)) and considers the business / data at hand.
3. Your code is valid and provides correct results and actionable models for analysts.

