-- customer ranking by total amount spent on *rentals*
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order

SELECT
customer.email,
RANK () OVER (
  ORDER BY
  SUM(amount) DESC
)
FROM
customer
LEFT JOIN
rental
ON
rental.customer_id = customer.customer_id
LEFT JOIN
payment
ON
payment.rental_id = rental.rental_id
GROUP BY
customer.email
-- ORDER BY
-- sum DESC