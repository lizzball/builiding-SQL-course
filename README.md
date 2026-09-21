# Building SQL Course

A hands-on SQL learning repo using SQLite and a fully synthetic retail database.

## What is in the database?

The practice database contains four related tables:

- `customers` — customer demographics and signup dates
- `products` — product catalogue and pricing
- `orders` — order-level records
- `order_items` — line items connecting orders to products

All names and records are synthetic.

## Start in GitHub Codespaces

Open this repo in a Codespace. The dev container will install SQLite and automatically build:

```
practice.db
```

from:

```
data/create_database.sql
```

To open the database manually:

```bash
sqlite3 practice.db
```

Useful SQLite commands:

```sql
.tables
.schema customers
.headers on
.mode column
```

Then try:

```sql
SELECT * FROM customers;
```

## Learning path

1. SELECT + LIMIT
2. WHERE + filtering
3. ORDER BY
4. COUNT / SUM / AVG
5. GROUP BY
6. JOIN
7. CASE WHEN
8. Subqueries + CTEs
9. Window functions
10. Analytics-style questions

Start with `exercises/01_basics.sql`.
