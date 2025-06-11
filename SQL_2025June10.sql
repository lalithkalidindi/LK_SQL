01)Which actors have the first name ‘ELVIS’?
SELECT * FROM actor WHERE first_name = 'ELVIS';

2)How many actors have the first name ‘CUBA’?.
SELECT COUNT(*) AS actor_count FROM actor WHERE first_name = 'CUBA';

3)How many distinct actors have the last name ‘TEMPLE’?.
SELECT COUNT(*) AS actor_count 
FROM actor 
WHERE last_name = 'TEMPLE';

4)Which last names are not repeated?
SELECT last_name 
FROM actor 
GROUP BY last_name 
HAVING COUNT(*) = 1;


5)What is that average running time of all the films in the sakila DB?
SELECT AVG(length) AS average_running_time 
FROM film;

6)Return the full names (first and last) of actors with “SON” in their last name, ordered by their first name.
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE '%SON%' 
ORDER BY first_name;


7)Which actor has appeared in the most films?
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, actor.first_name, actor.last_name
ORDER BY film_count DESC
LIMIT 1;

8)What is the difference between below two SQL

SELECT country_id, country from country WHERE
country = 'Afghanistan' OR 'Bangladesh' OR 'China';


SELECT country_id, country from country WHERE
country IN('Afghanistan', 'Bangladesh','China');

answer 

There is a key difference between the two SQL queries:

Query 1 (Incorrect)
sql
SELECT country_id, country FROM country 
WHERE country = 'Afghanistan' OR 'Bangladesh' OR 'China';
Issue:
The condition OR 'Bangladesh' OR 'China' is incorrect.

'Bangladesh' and 'China' are treated as truthy values, meaning they always evaluate to TRUE.

This results in all rows being returned, regardless of the country name.

Corrected Version of Query 1:
sql
SELECT country_id, country FROM country 
WHERE country = 'Afghanistan' OR country = 'Bangladesh' OR country = 'China';
This explicitly checks each country name separately.

Query 2 (Correct & Efficient)
sql
SELECT country_id, country FROM country 
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

9)
Display  Staff First name and Last Name and their address from Staff table and Address table

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id;

10)
Display all the payments from payment date on  Jan 01 2006 and future dates
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date
FROM payment
WHERE payment_date >= '2006-01-01';

11)Get Sum of  all the payments (SUM) from payment date on  Jan 01 2008 and future dates

SELECT SUM(amount) AS total_payments
FROM payment
WHERE payment_date >= '2008-01-01';


