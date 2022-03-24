-- customer ranking by total film time watched
-- similar to exercise 6

SELECT
customer.email,
RANK () OVER (
  ORDER BY
  SUM(film.length) DESC
)
FROM
customer
LEFT JOIN
rental
ON
rental.customer_id = customer.customer_id
LEFT JOIN
inventory
ON
inventory.inventory_id = rental.inventory_id
LEFT JOIN
film
ON
inventory.film_id = film.film_id
GROUP BY
customer.email