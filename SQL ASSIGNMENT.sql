   
1. Create a table called employees with the following structure
 emp_id (integer, should not be NULL and should be a primary key)
 emp_name (text, should not be NULL)
 age (integer, should have a check constraint to ensure the age is at least 18)
 email (text, should be unique for each employee)
 salary (decimal, with a default value of 30,000).
 Write the SQL query to create the above table with all constraints.

CREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email TEXT UNIQUE NOT NULL,
    salary DECIMAL DEFAULT 30000
);


 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints


NOT NULL: Ensures that the column cannot have NULL values.
PRIMARY KEY: Uniquely identifies each record in the table. The emp_id column is the primary key, so it cannot have NULL values and must be unique.
CHECK (age >= 18): Ensures that the age is at least 18.
UNIQUE: Ensures that all values in the email column are unique across all rows.
DEFAULT: Provides a default value for the salary column when no value is specified during insertion (in this case, 30,000).
**Purpose of Constraints and How They Help Maintain Data Integrity
Constraints are rules that enforce data integrity by limiting the types of data that can be inserted, updated, or deleted in a database. They help ensure that the data remains accurate, consistent, and reliable.

Types of Constraints:
PRIMARY KEY: Ensures each row in a table is uniquely identified. A primary key column cannot have NULL values.
FOREIGN KEY: Ensures referential integrity by making sure that a value in one table matches a value in another table (often used for relationships between tables).
NOT NULL: Ensures that a column cannot contain NULL values.
UNIQUE: Ensures all values in a column are distinct.
CHECK: Ensures that values in a column meet a specific condition (e.g., age ≥ 18).
DEFAULT: Specifies a default value for a column when no value is provided.
How Constraints Help with Data Integrity:

Prevents invalid or inconsistent data from being entered.
Enforces business rules and ensures accuracy (e.g., age should be 18 or older).
Ensures relationships between tables are consistent (e.g., foreign keys).
Helps maintain uniformity in the data (e.g., unique emails, non-null values).


 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer
 

 Purpose of the NOT NULL Constraint and Primary Key Behavior
Why Apply the NOT NULL Constraint: The NOT NULL constraint is used when a column must always have a value. It prevents NULL values, which represent missing or unknown data, from being inserted into the column. This is important for columns that are critical to the table's function or for ensuring data consistency. For example, an employee's name or ID should not be NULL, as that would be incomplete data.

Can a Primary Key Contain NULL Values?: No, a primary key cannot contain NULL values. The primary key uniquely identifies each row in a table, and NULL values would violate this requirement. A NULL value does not provide a specific identifier, making it impossible to guarantee uniqueness. As a result, a primary key column must have a value in every row and must be unique across all rows.


 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an 
example for both adding and removing a constraint.

Adding a Constraint: To add a constraint, you use the ALTER TABLE command. For example, to add a CHECK constraint to ensure that the salary is greater than 0, you can use the following SQL:
ALTER TABLE employees
ADD CONSTRAINT check_salary CHECK (salary > 0);
Removing a Constraint: To remove a constraint, you also use the ALTER TABLE command. You need to know the name of the constraint (in this case, check_salary) to drop it. For example:

ALTER TABLE employees
DROP CONSTRAINT check_salary;
Steps for Adding or Removing Constraints:

Use ALTER TABLE to modify the existing table structure.
For adding a constraint, specify the type of constraint (CHECK, UNIQUE, etc.).
For removing a constraint, use DROP CONSTRAINT followed by the constraint name.


5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. 
Provide an example of an error message that might occur when violating a constraint.

When an operation (insert, update, or delete) violates a constraint, the database will reject the operation and generate an error message. This is done to ensure data integrity is maintained.

Consequences:

Insertion: If a new row violates a constraint (e.g., inserting a NULL value into a NOT NULL column), the insert will fail.
Update: If an update violates a constraint (e.g., updating a value to a non-unique value in a UNIQUE column), the update will fail.
Deletion: Deleting data may be prevented if it violates referential integrity (e.g., deleting a row that is referenced by a foreign key in another table).
Example of an Error Message:

Violation of NOT NULL Constraint:

INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (1, NULL, 25, 'john.doe@example.com', 35000);
Error: ERROR: null value in column "emp_name" violates not-null constraint

Violation of UNIQUE Constraint:
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (2, 'Jane Doe', 30, 'john.doe@example.com', 35000);
Error: ERROR: duplicate key value violates unique constraint "employees_email_key"

Violation of CHECK Constraint:

INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (3, 'Bob Smith', 17, 'bob.smith@example.com', 30000);
Error: ERROR: check constraint "employees_age_check" is violated by $1


 6. You created a products table without constraints as follows:
 CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(50),
 price DECIMAL(10, 2));  
 Now, you realise that
 The product_id should be a primary key
 The price should have a default value of 50.00
 
 
To modify the products table to meet the new requirements, you can use the following SQL statements. These will add the necessary primary key constraint for the product_id column and set a default value for the price column.

Step 1: Add Primary Key to product_id
Since product_id should be the primary key, you will need to add the primary key constraint.

Step 2: Set Default Value for price
You can alter the price column to set a default value of 50.0.

Here are the SQL commands to modify the table:
-- Step 1: Add the PRIMARY KEY constraint to product_id
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- Step 2: Set a default value of 50.0 for the price column
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.0;
Explanation:
Step 1: The ALTER TABLE statement is used to add a primary key constraint to the product_id column. The PRIMARY KEY constraint ensures that the product_id values are unique and not null.

Step 2: The ALTER TABLE statement is used again to modify the price column and set its default value to 50.0. This ensures that if no value is specified for price during an insert, 50.0 will be used as the default.

Result:
After executing these commands, the products table will have the following characteristics:

The product_id column will be the primary key.
The price column will default to 50.0 if no value is provided during insertions.
If you already have data in the table, this change won't affect existing records, but any new record inserted without a specified price will use 50.0 as the default value.





SQL Commands

1. Primary Keys and Foreign Keys in Maven Movies DB

Primary Keys (PK): These uniquely identify each record in a table.
Customer Table: customer_id
Film Table: film_id
Actor Table: actor_id
Rental Table: rental_id
Payment Table: payment_id
Inventory Table: inventory_id
Foreign Keys (FK): These link one table to another, ensuring referential integrity.
Rental Table: customer_id (FK to Customer), inventory_id (FK to Inventory), staff_id (FK to Staff)
Payment Table: customer_id (FK to Customer), staff_id (FK to Staff), rental_id (FK to Rental)
Film Actor Table: actor_id (FK to Actor), film_id (FK to Film)
Inventory Table: film_id (FK to Film), store_id (FK to Store)
Difference between PK and FK:
Primary Key uniquely identifies each record within its own table.
Foreign Key establishes a relationship between tables, ensuring data integrity.

2. List All Details of Actors

SELECT * FROM actor;

3. List All Customer Information from DB

SELECT * FROM customer;

4. List Different Countries

SELECT DISTINCT country FROM address;

5. Display All Active Customers

SELECT * FROM customer WHERE active = 1;

6. List of All Rental IDs for Customer with ID 1

SELECT rental_id FROM rental WHERE customer_id = 1;

7. Display All Films Whose Rental Duration is Greater Than 5

SELECT * FROM film WHERE rental_duration > 5;

8. List the Total Number of Films Whose Replacement Cost is Greater than $15 and Less than $20

SELECT COUNT(*) FROM film WHERE replacement_cost BETWEEN 15 AND 20;

9. Display the Count of Unique First Names of Actors

SELECT COUNT(DISTINCT first_name) FROM actor;

10. Display the First 10 Records from the Customer Table

SELECT * FROM customer LIMIT 10;

11. Display the First 3 Records from the Customer Table Whose First Name Starts with ‘B’
SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;

12. Display the Names of the First 5 Movies Which are Rated as ‘G’

SELECT title FROM film WHERE rating = 'G' LIMIT 5;

13. Find All Customers Whose First Name Starts with "A"

SELECT * FROM customer WHERE first_name LIKE 'A%';

14. Find All Customers Whose First Name Ends with "A"

SELECT * FROM customer WHERE first_name LIKE '%A';

15. Display the List of First 4 Cities Which Start and End with ‘A’

SELECT city FROM city WHERE city LIKE 'A%' AND city LIKE '%A' LIMIT 4;

16. Find All Customers Whose First Name Have "NI" in Any Position

SELECT * FROM customer WHERE first_name LIKE '%NI%';

17. Find All Customers Whose First Name Have "R" in the Second Position

SELECT * FROM customer WHERE first_name LIKE '_R%';
18. Find All Customers Whose First Name Starts with "A" and Are at Least 5 Characters in Length

SELECT * FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

19. Find All Customers Whose First Name Starts with "A" and Ends with "O"

SELECT * FROM customer WHERE first_name LIKE 'A%' AND first_name LIKE '%O';

20. Get the Films with PG and PG-13 Rating Using IN Operator

SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

21. Get the Films with Length Between 50 to 100 Using BETWEEN Operator

SELECT * FROM film WHERE length BETWEEN 50 AND 100;

22. Get the Top 50 Actors Using LIMIT Operator

SELECT * FROM actor LIMIT 50;

23. Get the Distinct Film IDs from Inventory Table

SELECT DISTINCT film_id FROM inventory;

Basic Aggregate Functions

Question 1: Retrieve the Total Number of Rentals Made in the Sakila Database

SELECT COUNT(*) FROM rental;

Question 2: Find the Average Rental Duration (in Days) of Movies Rented

SELECT AVG(rental_duration) FROM film;

String Functions

Question 3: Display the First Name and Last Name of Customers in Uppercase

SELECT UPPER(first_name), UPPER(last_name) FROM customer;

Question 4: Extract the Month from the Rental Date and Display It Alongside the Rental ID

SELECT rental_id, MONTH(rental_date) FROM rental;

GROUP BY Functions

Question 5: Retrieve the Count of Rentals for Each Customer

SELECT customer_id, COUNT(*) FROM rental GROUP BY customer_id;

Question 6: Find the Total Revenue Generated by Each Store

SELECT store_id, SUM(amount) FROM payment GROUP BY store_id;

Question 7: Determine the Total Number of Rentals for Each Category of Movies

SELECT category_id, COUNT(*) 
FROM film_category 
JOIN rental ON rental.inventory_id = film_category.film_id 
GROUP BY category_id;

Question 8: Find the Average Rental Rate of Movies in Each Language

SELECT language_id, AVG(rental_rate) 
FROM film 
JOIN language ON film.language_id = language.language_id 
GROUP BY language_id;

Joins
Question 9: Display the Title of the Movie, Customer’s First Name, and Last Name Who Rented It

SELECT f.title, c.first_name, c.last_name 
FROM film f 
JOIN inventory i ON f.film_id = i.film_id 
JOIN rental r ON i.inventory_id = r.inventory_id 
JOIN customer c ON r.customer_id = c.customer_id;

Question 10: Retrieve the Names of All Actors Who Have Appeared in the Film "Gone with the Wind"

SELECT a.first_name, a.last_name 
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id 
JOIN film f ON fa.film_id = f.film_id 
WHERE f.title = 'Gone with the Wind';

Question 11: Retrieve the Customer Names Along with the Total Amount They've Spent on Rentals
SELECT c.first_name, c.last_name, SUM(p.amount) 
FROM customer c 
JOIN payment p ON c.customer_id = p.customer_id 
GROUP BY c.customer_id;

Question 12: List the Titles of Movies Rented by Each Customer in a Particular City (e.g., 'London')

SELECT c.first_name, c.last_name, f.title 
FROM customer c 
JOIN address a ON c.address_id = a.address_id 
JOIN city ci ON a.city_id = ci.city_id 
JOIN rental r ON c.customer_id = r.customer_id 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
WHERE ci.city = 'London';

Advanced Joins and GROUP BY

Question 13: Display the Top 5 Rented Movies Along with the Number of Times They’ve Been Rented

SELECT f.title, COUNT(r.rental_id) AS rental_count 
FROM film f 
JOIN inventory i ON f.film_id = i.film_id 
JOIN rental r ON i.inventory_id = r.inventory_id 
GROUP BY f.film_id 
ORDER BY rental_count DESC 
LIMIT 5;

Question 14: Determine the Customers Who Have Rented Movies from Both Stores (Store ID 1 and Store ID 2)

SELECT customer_id 
FROM rental 
WHERE store_id = 1 
GROUP BY customer_id 
HAVING customer_id IN (
    SELECT customer_id 
    FROM rental 
    WHERE store_id = 2
);

Windows Function:
 

 1. Rank the customers based on the total amount they've spent on rentals

SELECT 
    customer_id,
    SUM(payment.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(payment.amount) DESC) AS rank
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_id;

2. Calculate the cumulative revenue generated by each film over time.

SELECT 
    film.film_id,
    film.title,
    SUM(payment.amount) AS total_revenue,
    SUM(payment.amount) OVER (PARTITION BY film.film_id ORDER BY rental.rental_date) AS cumulative_revenue
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.film_id, rental.rental_date;

3. Determine the average rental duration for each film, considering films with similar lengths.

SELECT 
    film.title,
    film.length,
    AVG(rental_duration) OVER (PARTITION BY film.length) AS avg_rental_duration
FROM film;

4.Identify the top 3 films in each category based on their rental counts.

SELECT 
    film_category.category_id,
    film.title,
    COUNT(rental.rental_id) AS rental_count,
    RANK() OVER (PARTITION BY film_category.category_id ORDER BY COUNT(rental.rental_id) DESC) AS rank
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN rental ON film.film_id = rental.film_id
GROUP BY film_category.category_id, film.title;

5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH customer_rentals AS (
    SELECT customer_id, COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY customer_id
)
SELECT 
    customer_id,
    total_rentals,
    total_rentals - AVG(total_rentals) OVER () AS rental_difference
FROM customer_rentals;

6. Find the monthly revenue trend for the entire rental store over time.

SELECT 
    EXTRACT(MONTH FROM payment.payment_date) AS month,
    EXTRACT(YEAR FROM payment.payment_date) AS year,
    SUM(payment.amount) AS monthly_revenue
FROM payment
GROUP BY EXTRACT(MONTH FROM payment.payment_date), EXTRACT(YEAR FROM payment.payment_date)
ORDER BY year, month;

7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

WITH total_spent AS (
    SELECT 
        customer_id, 
        SUM(payment.amount) AS total_spent
    FROM payment
    GROUP BY customer_id
)
SELECT 
    customer_id, 
    total_spent
FROM total_spent
WHERE total_spent >= PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY total_spent) OVER ();

8. Calculate the running total of rentals per category, ordered by rental count.

SELECT 
    film_category.category_id,
    COUNT(rental.rental_id) AS rental_count,
    SUM(COUNT(rental.rental_id)) OVER (PARTITION BY film_category.category_id ORDER BY COUNT(rental.rental_id)) AS running_total
FROM film_category
JOIN film ON film_category.film_id = film.film_id
JOIN rental ON film.film_id = rental.film_id
GROUP BY film_category.category_id;

9. Find the films that have been rented less than the average rental count for their respective categories.

WITH rental_counts AS (
    SELECT 
        film_category.category_id,
        film.film_id,
        COUNT(rental.rental_id) AS rental_count
    FROM film_category
    JOIN film ON film_category.film_id = film.film_id
    JOIN rental ON film.film_id = rental.film_id
    GROUP BY film_category.category_id, film.film_id
)
SELECT 
    rental_counts.film_id,
    rental_counts.rental_count
FROM rental_counts
JOIN (
    SELECT category_id, AVG(rental_count) AS avg_rental_count
    FROM rental_counts
    GROUP BY category_id
) AS category_avg ON rental_counts.category_id = category_avg.category_id
WHERE rental_counts.rental_count < category_avg.avg_rental_count;

10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT 
    EXTRACT(MONTH FROM payment.payment_date) AS month,
    EXTRACT(YEAR FROM payment.payment_date) AS year,
    SUM(payment.amount) AS monthly_revenue
FROM payment
GROUP BY EXTRACT(MONTH FROM payment.payment_date), EXTRACT(YEAR FROM payment.payment_date)
ORDER BY monthly_revenue DESC
LIMIT 5;



Normalization & CTE:


1. First Normal Form (1NF)
a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
In First Normal Form (1NF), the table must meet these criteria:

All columns must contain atomic values (i.e., no repeating groups or arrays).
Each row must be uniquely identifiable.
A common violation of 1NF might occur in a table like customer if a column contains multiple values for a single customer, such as a list of rented movies stored in a single column.

Example of 1NF Violation: Imagine a customer table where a customer can have multiple rental IDs in one field, such as:

CTE Queries


2. Second Normal Form (2NF):
a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
If it violates 2NF, explain the steps to normalize it.

Second Normal Form (2NF)
a. Choosing a table in Sakila and determining if it's in 2NF:
A common table in the Sakila database that we can use for this explanation is the "actor" table. Let’s assume the structure of the actor table looks something like this:

actor_id	first_name	last_name	film_id	title
1	John	Doe	101	Matrix
2	Jane	Smith	102	Inception
1	John	Doe	102	Inception
To determine if this table is in 2NF, follow these steps:

Step 1: Check if the table is in 1NF.

1NF (First Normal Form) requires that each column contains atomic values (no repeating groups or arrays). In this case, the table is already in 1NF, as there are no repeating groups or multi-valued columns.
Step 2: Check if the table is in 2NF.

2NF (Second Normal Form) requires that:
The table is in 1NF.
Every non-prime attribute (a column not part of the primary key) is fully functionally dependent on the entire primary key (i.e., there are no partial dependencies).
For this table:

The primary key could be a composite key of (actor_id, film_id) because an actor can act in multiple films.
Non-prime attributes are first_name, last_name, and title.
Now, let's check for partial dependencies:

The first_name and last_name are dependent only on actor_id (not on the entire primary key of (actor_id, film_id)).
The title is dependent only on film_id.
Since these non-prime attributes are not dependent on the entire primary key, the table violates 2NF due to partial dependency.

Steps to normalize the table to 2NF:
Remove partial dependencies:
Create separate tables for actors and films.
The actors table should store actor details (actor_id, first_name, last_name).
The films table should store film details (film_id, title).
Create a third table (a many-to-many relationship table) to link actors and films, which will store actor_id and film_id.
After normalization:

actors table:

actor_id	first_name	last_name
1	John	Doe
2	Jane	Smith
films table:

film_id	title
101	Matrix
102	Inception
actor_films table (junction table):

actor_id	film_id
1	101
1	102
2	102
This ensures that the table is now in 2NF.



3. Third Normal Form (3NF)
a. Identifying a table in Sakila that violates 3NF:
Let’s look at the "staff" table in the Sakila database. This table might have the following structure:

staff_id	first_name	last_name	email	store_id	store_address
1	John	Doe	john.doe@mail.com	1	1234 Elm St, NY
2	Jane	Smith	jane.smith@mail.com	2	5678 Oak St, NY
Step 1: Check for transitive dependencies.

Transitive dependency occurs when a non-prime attribute depends on another non-prime attribute through a third attribute. In this case:
store_address depends on store_id (not directly on staff_id).
email depends directly on staff_id, and store_id is associated with the staff, but store_address is not directly related to the staff.
This creates a transitive dependency where:

store_address is indirectly dependent on staff_id through store_id.
Steps to normalize to 3NF:
Remove the transitive dependency:
Create a new table for stores, which will contain store_id and store_address.
In the staff table, store only the store_id (instead of store_address).
After normalization:

staff table:

staff_id	first_name	last_name	email	store_id
1	John	Doe	john.doe@mail.com	1
2	Jane	Smith	jane.smith@mail.com	2
stores table:

store_id	store_address
1	1234 Elm St, NY
2	5678 Oak St, NY
Now, the staff table is in 3NF because there are no transitive dependencies.

4. Normalization Process
a. Normalizing a specific table from unnormalized form up to at least 2NF (using the "employees" table):
Let's assume you start with an unnormalized version of the employees table like this:

emp_id	emp_name	emp_address	emp_phone	manager_name	manager_phone
1	John	123 Main St	555-1234	Susan	555-5678
2	Jane	456 Oak St	555-2345	Susan	555-5678
3	Bob	789 Pine St	555-3456	Charlie	555-6789
This table is not in 1NF because:

Multiple pieces of information about the manager (manager_name, manager_phone) are stored in the same table.
Step 1: Convert to 1NF.

Split repeating groups into atomic values. You can start by creating a new table for managers (storing manager details).
Normalized to 1NF:

emp_id	emp_name	emp_address	emp_phone	manager_id
1	John	123 Main St	555-1234	1
2	Jane	456 Oak St	555-2345	1
3	Bob	789 Pine St	555-3456	2
And the managers table:

manager_id	manager_name	manager_phone
1	Susan	555-5678
2	Charlie	555-6789
Step 2: Convert to 2NF.

Check for partial dependencies. The non-prime attributes manager_name and manager_phone depend on manager_id, not on emp_id. Since the table is already in 1NF, this is not a violation of 2NF.
This table is now in 2NF because all non-prime attributes depend on the entire primary key (emp_id, manager_id).

These are the basic steps for analyzing and normalizing a table to 2NF and 3NF using examples from the Sakila database. The process generally involves identifying keys, functional dependencies, and removing redundancies by decomposing the tables into smaller, more efficient structures.


3. Third Normal Form (3NF):
a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
present and outline the steps to normalize the table to 3NF

Let’s look at the "staff" table in the Sakila database. This table might have the following structure:

staff_id	first_name	last_name	email	store_id	store_address
1	John	Doe	john.doe@mail.com	1	1234 Elm St, NY
2	Jane	Smith	jane.smith@mail.com	2	5678 Oak St, NY
Step 1: Check for transitive dependencies.

Transitive dependency occurs when a non-prime attribute depends on another non-prime attribute through a third attribute. In this case:
store_address depends on store_id (not directly on staff_id).
email depends directly on staff_id, and store_id is associated with the staff, but store_address is not directly related to the staff.
This creates a transitive dependency where:

store_address is indirectly dependent on staff_id through store_id.
Steps to normalize to 3NF:
Remove the transitive dependency:
Create a new table for stores, which will contain store_id and store_address.
In the staff table, store only the store_id (instead of store_address).
After normalization:

staff table:

staff_id	first_name	last_name	email	store_id
1	John	Doe	john.doe@mail.com	1
2	Jane	Smith	jane.smith@mail.com	2
stores table:

store_id	store_address
1	1234 Elm St, NY
2	5678 Oak St, NY
Now, the staff table is in 3NF because there are no transitive dependencies.

 4. Normalization Process:
a. Take a specific table in Sakila and guide through the process of normalizing it from the initial  
unnormalized form up to at least 2NF

Let's assume you start with an unnormalized version of the employees table like this:

emp_id	emp_name	emp_address	emp_phone	manager_name	manager_phone
1	John	123 Main St	555-1234	Susan	555-5678
2	Jane	456 Oak St	555-2345	Susan	555-5678
3	Bob	789 Pine St	555-3456	Charlie	555-6789
This table is not in 1NF because:

Multiple pieces of information about the manager (manager_name, manager_phone) are stored in the same table.
Step 1: Convert to 1NF.

Split repeating groups into atomic values. You can start by creating a new table for managers (storing manager details).
Normalized to 1NF:

emp_id	emp_name	emp_address	emp_phone	manager_id
1	John	123 Main St	555-1234	1
2	Jane	456 Oak St	555-2345	1
3	Bob	789 Pine St	555-3456	2
And the managers table:

manager_id	manager_name	manager_phone
1	Susan	555-5678
2	Charlie	555-6789
Step 2: Convert to 2NF.

Check for partial dependencies. The non-prime attributes manager_name and manager_phone depend on manager_id, not on emp_id. Since the table is already in 1NF, this is not a violation of 2NF.
This table is now in 2NF because all non-prime attributes depend on the entire primary key (emp_id, manager_id).

These are the basic steps for analyzing and normalizing a table to 2NF and 3NF using examples from the Sakila database. The process generally involves identifying keys, functional dependencies, and removing redundancies by decomposing the tables into smaller, more efficient structures.

5. CTE Basics:
a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
WITH ActorFilms AS (
    SELECT actor_id, COUNT(film_id) AS num_films
    FROM film_actor
    GROUP BY actor_id
)
SELECT a.actor_name, af.num_films
FROM actor a
JOIN ActorFilms af ON a.actor_id = af.actor_id;

6. CTE with Joins:

a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.

WITH FilmLanguage AS (
    SELECT f.film_id, f.title AS film_title, l.name AS language_name, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM FilmLanguage;

7. CTE for Aggregation:

a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.

WITH CustomerPayments AS (
    SELECT c.customer_id, SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
)
SELECT c.first_name, c.last_name, cp.total_revenue
FROM customer c
JOIN CustomerPayments cp ON c.customer_id = cp.customer_id;


 8.CTE with Window Functions:
a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

Rank films based on their rental duration from the film table.
Assuming that the rental duration is stored in the film table (in a column like rental_duration), we can rank the films using a window function.

WITH FilmRank AS (
    SELECT 
        film_id, 
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS rental_rank
    FROM film
)
SELECT * FROM FilmRank;
Explanation:
This query ranks films based on their rental_duration in descending order. The RANK() window function assigns a unique rank to each row, with ties in rental_duration receiving the same rank.

9. CTE and Filtering:
 a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details
We can create a CTE to find customers with more than two rentals, and then join this result with the customer table to retrieve additional customer details.


WITH CustomerRentals AS (
    SELECT customer_id, COUNT(rental_id) AS rental_count
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(rental_id) > 2
)
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customer c
JOIN CustomerRentals cr ON c.customer_id = cr.customer_id;
Explanation:

The CustomerRentals CTE finds customers who have made more than two rentals by counting rental transactions grouped by customer_id.
We then join the result with the customer table to get customer details like first_name, last_name, and email.


10. CTE for Date Calculations:
 a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
Find the total number of rentals made each month, based on the rental_date from the rental table.

We'll use a CTE to aggregate the rentals by month and year.
WITH MonthlyRentals AS (
    SELECT 
        EXTRACT(YEAR FROM rental_date) AS rental_year,
        EXTRACT(MONTH FROM rental_date) AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY rental_year, rental_month
    ORDER BY rental_year, rental_month
)
SELECT * FROM MonthlyRentals;
Explanation:

The EXTRACT(YEAR FROM rental_date) and EXTRACT(MONTH FROM rental_date) functions are used to group rentals by year and month.
The COUNT(rental_id) counts the number of rentals per month.


11. CTE and Self-Join:
a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
together, using the film_actor table.

Generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.

We'll use a self-join on the film_actor table to find pairs of actors who appear in the same film.
WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id  -- To avoid repeating pairs
)
SELECT 
    a1.actor_id AS actor1_id,
    a2.actor_id AS actor2_id,
    f.title
FROM ActorPairs ap
JOIN actor a1 ON ap.actor1_id = a1.actor_id
JOIN actor a2 ON ap.actor2_id = a2.actor_id
JOIN film f ON ap.film_id = f.film_id;
Explanation:

The CTE ActorPairs creates pairs of actors who are in the same movie by joining the film_actor table with itself (fa1 and fa2).
We filter out reversed pairs using fa1.actor_id < fa2.actor_id.
After that, we join with the actor and film tables to get the actor names and film titles.


12. CTE for Recursive Search:
 a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column.
Find all employees in the staff table who report to a specific manager, considering the reports_to column.

A recursive CTE can be used to find all employees who report to a particular manager, even in nested hierarchies.
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: start with the manager (replace 'manager_id' with actual ID)
    SELECT staff_id, first_name, last_name, reports_to
    FROM staff
    WHERE staff_id = 1  -- Example manager ID

    UNION ALL

    -- Recursive case: find employees who report to someone already in the hierarchy
    SELECT s.staff_id, s.first_name, s.last_name, s.reports_to
    FROM staff s
    JOIN EmployeeHierarchy eh ON s.reports_to = eh.staff_id
)
SELECT * FROM EmployeeHierarchy;
Explanation:

The EmployeeHierarchy CTE starts with a specific manager (in this case, staff member with staff_id = 1).
The recursive part of the CTE joins the staff table on reports_to to find employees who report to the already selected staff members.
The query continues to recurse until all employees reporting to the given manager (directly or indirectly) are found.



