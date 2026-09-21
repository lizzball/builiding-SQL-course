# Building SQL Course

A hands-on SQL learning repo using SQLite and a **fully synthetic diagnostic-laboratory database**.

Think: a simplified LifeLabs-style data environment built for learning SQL. No record represents a real patient, physician, or laboratory result.

## Database structure

The practice database contains **1,000 synthetic patients**, **1,000 lab tests**, and 12 synthetic ordering physicians across three related tables:

- `patients` — synthetic patient demographics
- `ordering_doctors` — synthetic ordering physicians
- `lab_tests` — one test record per patient with biomarker results and disease status

The core test table contains:

- `test_id`
- `patient_id`
- `order_id` — identifies the ordering physician in this teaching dataset
- `collection_date`
- `disease_status`
- `biomarker_a`
- `biomarker_b`
- `biomarker_c`

All biomarker values are numeric and constrained to **20–35**.

### Intentional signal

This is not random noise. The 1,000-patient cohort was designed so that:

- **Biomarker A is associated with disease status**: disease cases tend to have lower values.
- Biomarkers B and C have much more overlap between cases and controls.
- The Biomarker A relationship is deliberately imperfect, so threshold-based analyses produce false positives and false negatives.

That makes the dataset useful later for practicing diagnostic-style analyses.

## Start in GitHub Codespaces

Open this repo in a Codespace. The dev container installs SQLite and automatically builds:

```
practice.db
```

from:

```
data/create_database.sql
```

If your Codespace was already open before the database changed, rebuild it manually:

```bash
rm -f practice.db
sqlite3 practice.db < data/create_database.sql
```

Open SQLite:

```bash
sqlite3 practice.db
```

Then:

```sql
.tables
.headers on
.mode column
```

Try:

```sql
SELECT *
FROM lab_tests
LIMIT 10;
```

## Learning path

1. SELECT + LIMIT
2. WHERE + filtering
3. ORDER BY
4. COUNT / AVG / MIN / MAX
5. GROUP BY
6. JOIN patient, test, and ordering-provider tables
7. CASE WHEN
8. Diagnostic thresholds
9. Subqueries + CTEs
10. Window functions and analytics-style questions

Start with `exercises/01_basics.sql`.
