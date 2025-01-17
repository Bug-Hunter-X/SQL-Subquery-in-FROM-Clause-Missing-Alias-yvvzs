The solution is to add an alias to the subquery. The alias allows the outer query to refer to the subquery's results.  Here's the corrected query:

```sql
SELECT c.customer_id, COUNT(*) AS order_count
FROM customers c JOIN (SELECT o.customer_id, COUNT(*) AS order_count FROM orders o GROUP BY o.customer_id) AS order_counts ON c.customer_id = order_counts.customer_id
GROUP BY c.customer_id;
```

Alternatively, a more efficient approach (avoiding the explicit join) using a correlated subquery:

```sql
SELECT c.customer_id, (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;
```
This revised query correctly counts orders for each customer.