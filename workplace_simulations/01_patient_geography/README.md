# Workplace Simulation 01 — Patient Geography

## Stakeholder request

> "Can you tell me how many tested patients we have in each province? I want to understand the geographic distribution of the cohort. Please send me the counts from largest to smallest."

## Your job

Use the synthetic diagnostic database to answer the request.

### Source tables

You may inspect the database with:

```sql
.tables
.schema patients
.schema lab_tests
```

### Requirements

1. Count **unique tested patients** by province.
2. Sort provinces from highest to lowest patient count.
3. Save the reproducible SQL in `analysis.sql`.
4. Export the final query result as a CSV.
5. Write a short stakeholder-facing summary in `deliverable.md`.

## Why this is a JOIN exercise

The test event lives in `lab_tests`, while province lives in `patients`.

The common key is:

```
lab_tests.patient_id = patients.patient_id
```

Be careful about the **grain** of the data: if one patient had multiple tests, `COUNT(*)` would count tests rather than people. Use a unique-patient count.

## Run the saved SQL

From the normal Codespaces terminal:

```bash
sqlite3 -header -column practice.db < workplace_simulations/01_patient_geography/analysis.sql
```

## Export to CSV

From the normal terminal:

```bash
sqlite3 -header -csv practice.db < workplace_simulations/01_patient_geography/analysis.sql > workplace_simulations/01_patient_geography/patients_by_province.csv
```

This creates a tabular snapshot that could be sent to a stakeholder or loaded into another tool.

## Deliverables

- `analysis.sql` — reproducible query logic
- `patients_by_province.csv` — result snapshot
- `deliverable.md` — short stakeholder-facing interpretation
