# Case: Analytics Engineer
We have been hired by a company to set up their modern data stack. In the first phase, they would like to be able to report on their sales operations.
They're selling various products to customers globally. In this repository, you will find data covering information about customers, employees, orders, products and suppliers. Please use this data for the following tasks.

### Tasks

1. The data is available as CSV files in the `data/` directory, or as a SQLite database `data.sqlite` with the data already pre-populated into tables.

   You can choose to directly use the SQLite database, or load the CSV files into a database of your choice, e.g. BigQuery or PostgreSQL. 


2. Using dbt, create a project with the necessary transformations to create the following models:

   1. A transactional fact table for sales, with the grain set at the product level, and the following additional dimensions and metrics:
      1. new or returning customer
      2. number of days between first purchase and last purchase
      
   2. A dimension table for “customers”, with the grain set at the customer_id, and the following additional dimensions and metrics:
      1. number of orders
      2. value of most expensive order
      3. whether it’s one of the top 10 customers (by revenue generated)

   3. A dimension table for monthly cohorts, with the grain set at country leveland the following additional dimensions and metrics:
      1. Number of customers in the monthly cohort (customers are assigned in cohorts based on date of their first purchase)
      2. Cohort's total order value
   * Note: Every cohort should be available, even when the business didn't acquire a new customer that month (for the full timerange of order dates).

3. Push your project to a repository that we can access (ideally a public repo). You can create a new repository or fork from this one, but _do not_ push your code to this repository.

   If you choose to use the SQLite database, you can also include the updated database file with your models in the repository.

4. Send the link to the repository to the person who provided you this case. 

### What we’ll be evaluating your submissions on

1. Your code is accurate, easy to read & interpret and shows a tendency for reusability & maintainability.
2. Your project and code structure follows modelling best practices (we use the [Best Practice Guides from dbt](https://docs.getdbt.com/best-practices)), and considers the business / data at hand.
3. Your code is valid and provides correct results and actionable models for analysts.

### Note
If you have any questions or you get stuck in any of the steps, especially the setup, don't hesitate to reach out to us! You can create an issue here, or alternatively, reach out to us via email (through the person who sent you this case).

We do our best to improve our technical tasks, so please let us know your feedback and what you thought of this task :)

